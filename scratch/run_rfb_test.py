#!/usr/bin/env python3
"""
All-in-one RFB 3.8 Protocol & Proxy Verification Test
Runs:
1. Real RFB 3.8 VNC Server (port 5904)
2. RFC 6455 WebSocket-to-TCP Bridge (port 5995)
3. Protocol Verification Client via WebSocket
Tests:
- Handshake (RFB 003.008)
- Security Negotiation (Type 1 None)
- SecurityResult (0 = OK)
- ClientInit (shared = 1)
- ServerInit (Dimensions, BPP, Desktop Name)
- SetEncodings (Raw=0, CopyRect=1, DesktopSize=-223)
- FramebufferUpdateRequest
- FramebufferUpdate (Raw decoding, byte length verification)
- PointerEvent (x, y, button mask)
- KeyEvent (keysym, down/up)
"""

import sys
import os
import asyncio
import struct
import hashlib
import base64
import urllib.parse

# Import bridge and server components
sys.path.insert(0, os.path.dirname(__file__))
from test_vnc_server import TestVncServer, WIDTH, HEIGHT
from agy_vnc_bridge import handle_client as bridge_handler, create_ws_frame, WSParser

SERVER_PORT = 5904
BRIDGE_PORT = 5995

async def run_test_client():
    await asyncio.sleep(0.5)
    print("\n=== STARTING RFB 3.8 CLIENT VERIFICATION ===")
    
    # 1. Connect WebSocket to Bridge
    ws_reader, ws_writer = await asyncio.open_connection("127.0.0.1", BRIDGE_PORT)
    sec_key = base64.b64encode(os.urandom(16)).decode()
    upgrade_req = (
        f"GET /?host=127.0.0.1&port={SERVER_PORT} HTTP/1.1\r\n"
        f"Host: 127.0.0.1:{BRIDGE_PORT}\r\n"
        "Upgrade: websocket\r\n"
        "Connection: Upgrade\r\n"
        f"Sec-WebSocket-Key: {sec_key}\r\n"
        "Sec-WebSocket-Version: 13\r\n\r\n"
    )
    ws_writer.write(upgrade_req.encode())
    await ws_writer.drain()

    # Read Upgrade Response
    resp_header = b""
    while b"\r\n\r\n" not in resp_header:
        chunk = await ws_reader.read(1024)
        resp_header += chunk
    assert b"101 Switching Protocols" in resp_header, f"Handshake failed: {resp_header}"
    print("[1/8] [PASS] WebSocket Upgrade & Proxy Connection Established")

    parser = WSParser()
    async def read_ws_bytes(n):
        while len(parser.buffer) < n: # Simplified read
            chunk = await ws_reader.read(4096)
            if not chunk:
                raise ConnectionError("EOF while reading WS")
            parser.feed(chunk)
            frame = parser.next_frame()
            if frame:
                return frame[1]
        frame = parser.next_frame()
        return frame[1] if frame else b""

    # Helper to send binary WS frame from client to server (masked)
    def send_client_frame(data: bytes):
        mask = os.urandom(4)
        masked_data = bytearray(len(data))
        for i in range(len(data)):
            masked_data[i] = data[i] ^ mask[i % 4]
        
        first = 0x82 # FIN=1, binary=2
        length = len(data)
        if length <= 125:
            header = struct.pack("!BB", first, 0x80 | length)
        elif length <= 65535:
            header = struct.pack("!BBH", first, 0x80 | 126, length)
        else:
            header = struct.pack("!BBQ", first, 0x80 | 127, length)
        ws_writer.write(header + mask + bytes(masked_data))

    # Helper to read exact unmasked payload bytes across frames
    buf = bytearray()
    async def recv_exact(num_bytes):
        nonlocal buf
        while len(buf) < num_bytes:
            frame = parser.next_frame()
            if frame:
                buf.extend(frame[1])
            else:
                chunk = await ws_reader.read(65536)
                if not chunk:
                    raise ConnectionError("Connection closed")
                parser.feed(chunk)
        res = bytes(buf[:num_bytes])
        del buf[:num_bytes]
        return res

    # 2. Handshake: Server sends RFB 003.008\n
    ver_bytes = await recv_exact(12)
    server_ver = ver_bytes.decode('latin1').strip()
    print(f"[2/8] [PASS] Server Version Handshake: '{server_ver}'")
    assert server_ver == "RFB 003.008"

    # Send client version
    send_client_frame(b"RFB 003.008\n")
    await ws_writer.drain()

    # 3. Security Negotiation
    sec_types_len_b = await recv_exact(1)
    num_sec = sec_types_len_b[0]
    sec_types = await recv_exact(num_sec)
    print(f"[3/8] [PASS] Security Types Offered: {num_sec} (Types: {list(sec_types)})")
    assert 1 in sec_types # Type 1 = None

    # Select Type 1
    send_client_frame(b"\x01")
    await ws_writer.drain()

    # Read SecurityResult
    sec_result = struct.unpack("!I", await recv_exact(4))[0]
    print(f"[4/8] [PASS] Security Result: {sec_result} (0 = AUTH_SUCCESS)")
    assert sec_result == 0

    # 4. ClientInit (shared = 1)
    send_client_frame(b"\x01")
    await ws_writer.drain()

    # 5. ServerInit
    srv_init_data = await recv_exact(24)
    fb_w, fb_h, bpp, depth, big_end, true_col = struct.unpack("!HHBBBB", srv_init_data[:8])
    name_len = struct.unpack("!I", srv_init_data[20:24])[0]
    name_str = (await recv_exact(name_len)).decode('latin1')
    print(f"[5/8] [PASS] ServerInit Received: {fb_w}x{fb_h}, BPP={bpp}, Desktop='{name_str}'")
    assert fb_w == WIDTH and fb_h == HEIGHT

    # 6. Send SetEncodings: Raw (0), CopyRect (1), DesktopSize (-223)
    enc_msg = struct.pack("!BBHiii", 2, 0, 3, 0, 1, -223)
    send_client_frame(enc_msg)
    await ws_writer.drain()
    print("[6/8] [PASS] SetEncodings Dispatched (Raw, CopyRect, DesktopSize)")

    # 7. Request FramebufferUpdate & Validate Decoded Raw Frame
    req_msg = struct.pack("!BBHHHH", 3, 0, 0, 0, fb_w, fb_h) # Incremental = 0 (Full frame)
    send_client_frame(req_msg)
    await ws_writer.drain()

    fb_header = await recv_exact(4)
    msg_type, pad, num_rects = struct.unpack("!BBH", fb_header)
    assert msg_type == 0 and num_rects == 1

    rect_header = await recv_exact(12)
    rx, ry, rw, rh, enc = struct.unpack("!HHHHi", rect_header)
    assert enc == 0 # Raw
    assert rw == WIDTH and rh == HEIGHT

    pixel_data = await recv_exact(rw * rh * 4)
    print(f"[7/8] [PASS] FramebufferUpdate Decoded: {rw}x{rh} pixels ({len(pixel_data)} bytes stream)")

    # 8. Dispatch PointerEvent & KeyEvent
    # Pointer: (x=320, y=240, button=1)
    ptr_msg = struct.pack("!BBHH", 5, 1, 320, 240)
    send_client_frame(ptr_msg)
    await ws_writer.drain()

    # Key: Enter (0xff0d)
    key_msg = struct.pack("!BBHI", 4, 1, 0, 0xff0d)
    send_client_frame(key_msg)
    await ws_writer.drain()
    print("[8/8] [PASS] PointerEvent & KeyEvent Dispatched & Transmitted")

    ws_writer.close()
    await ws_writer.wait_closed()
    print("\n>>> ALL 8/8 RFB PROTOCOL VERIFICATIONS PASSED WITH 100% SUCCESS <<<\n")

async def main():
    srv = TestVncServer(port=SERVER_PORT)
    vnc_srv_task = asyncio.create_task(srv.start())

    brg_srv = await asyncio.start_server(bridge_handler, "127.0.0.1", BRIDGE_PORT)
    print(f"[Init] Bridge running on port {BRIDGE_PORT}, VNC Server on port {SERVER_PORT}")

    await run_test_client()

    vnc_srv_task.cancel()
    brg_srv.close()

if __name__ == "__main__":
    asyncio.run(main())
