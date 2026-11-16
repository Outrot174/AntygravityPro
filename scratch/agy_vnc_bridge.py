#!/usr/bin/env python3
"""
Antigravity VNC Micro-Bridge (RFC 6455 WebSocket <-> Raw TCP Stream)
Zero-dependency high-throughput proxy for in-browser RFB client.
"""

import sys
import os
import asyncio
import hashlib
import base64
import struct
import urllib.parse

WS_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

def create_ws_frame(data: bytes, opcode: int = 2) -> bytes:
    """Wraps raw data into an unmasked server-to-client RFC 6455 WebSocket frame."""
    length = len(data)
    first_byte = 0x80 | (opcode & 0x0F) # FIN = 1, opcode = 2 (binary)
    if length <= 125:
        header = struct.pack("!BB", first_byte, length)
    elif length <= 65535:
        header = struct.pack("!BBH", first_byte, 126, length)
    else:
        header = struct.pack("!BBQ", first_byte, 127, length)
    return header + data

class WSParser:
    def __init__(self):
        self.buffer = bytearray()

    def feed(self, data: bytes):
        self.buffer.extend(data)

    def next_frame(self):
        """Extracts next complete unmasked frame payload from buffer, or None if incomplete."""
        if len(self.buffer) < 2:
            return None
        byte1, byte2 = self.buffer[0], self.buffer[1]
        fin = (byte1 & 0x80) != 0
        opcode = byte1 & 0x0F
        masked = (byte2 & 0x80) != 0
        payload_len = byte2 & 0x7F

        idx = 2
        if payload_len == 126:
            if len(self.buffer) < 4:
                return None
            payload_len = struct.unpack("!H", self.buffer[2:4])[0]
            idx = 4
        elif payload_len == 127:
            if len(self.buffer) < 10:
                return None
            payload_len = struct.unpack("!Q", self.buffer[2:10])[0]
            idx = 10

        mask_key = None
        if masked:
            if len(self.buffer) < idx + 4:
                return None
            mask_key = bytes(self.buffer[idx:idx+4])
            idx += 4

        if len(self.buffer) < idx + payload_len:
            return None

        raw_payload = self.buffer[idx:idx+payload_len]
        del self.buffer[:idx+payload_len]

        if masked and mask_key:
            # Unmask payload using 4-byte cyclical XOR
            unmasked = bytearray(payload_len)
            for i in range(payload_len):
                unmasked[i] = raw_payload[i] ^ mask_key[i % 4]
            payload = bytes(unmasked)
        else:
            payload = bytes(raw_payload)

        return (opcode, payload)

async def handle_client(ws_reader: asyncio.StreamReader, ws_writer: asyncio.StreamWriter):
    peer = ws_writer.get_extra_info('peername')
    print(f"[Bridge] Connection from {peer}", file=sys.stderr)
    tcp_reader = None
    tcp_writer = None

    try:
        # Read HTTP GET upgrade request
        request_data = b""
        while b"\r\n\r\n" not in request_data:
            chunk = await ws_reader.read(4096)
            if not chunk:
                return
            request_data += chunk
            if len(request_data) > 16384:
                ws_writer.close()
                return

        req_header, _, _ = request_data.partition(b"\r\n\r\n")
        lines = req_header.decode('latin1', errors='replace').split("\r\n")
        if not lines:
            return

        req_line = lines[0]
        parts = req_line.split()
        if len(parts) < 2:
            return
        path = parts[1]

        # Parse query params: ?host=127.0.0.1&port=5900
        parsed_url = urllib.parse.urlparse(path)
        qparams = urllib.parse.parse_qs(parsed_url.query)
        target_host = qparams.get('host', ['127.0.0.1'])[0]
        target_port = int(qparams.get('port', ['5900'])[0])

        headers = {}
        for line in lines[1:]:
            if ":" in line:
                k, v = line.split(":", 1)
                headers[k.strip().lower()] = v.strip()

        sec_key = headers.get("sec-websocket-key")
        if not sec_key:
            ws_writer.write(b"HTTP/1.1 400 Bad Request\r\n\r\nMissing Sec-WebSocket-Key")
            await ws_writer.drain()
            ws_writer.close()
            return

        accept_val = base64.b64encode(hashlib.sha1((sec_key + WS_GUID).encode()).digest()).decode()
        resp = (
            "HTTP/1.1 101 Switching Protocols\r\n"
            "Upgrade: websocket\r\n"
            "Connection: Upgrade\r\n"
            f"Sec-WebSocket-Accept: {accept_val}\r\n"
            "Sec-WebSocket-Protocol: binary\r\n\r\n"
        )
        ws_writer.write(resp.encode('latin1'))
        await ws_writer.drain()
        print(f"[Bridge] WS Handshake completed. Connecting to TCP {target_host}:{target_port}...", file=sys.stderr)

        # Connect to target raw TCP VNC server
        try:
            tcp_reader, tcp_writer = await asyncio.open_connection(target_host, target_port)
            print(f"[Bridge] Connected to target {target_host}:{target_port}", file=sys.stderr)
        except Exception as e:
            print(f"[Bridge] Failed to connect to {target_host}:{target_port}: {e}", file=sys.stderr)
            ws_writer.write(create_ws_frame(b"", opcode=8)) # Close frame
            await ws_writer.drain()
            ws_writer.close()
            return

        parser = WSParser()

        # Forward WS -> TCP
        async def forward_ws_to_tcp():
            while True:
                chunk = await ws_reader.read(32768)
                if not chunk:
                    break
                parser.feed(chunk)
                while True:
                    frame = parser.next_frame()
                    if frame is None:
                        break
                    opcode, payload = frame
                    if opcode == 8: # Close
                        return
                    elif opcode == 9: # Ping
                        ws_writer.write(create_ws_frame(payload, opcode=10)) # Pong
                        await ws_writer.drain()
                    elif opcode in (1, 2): # Text or Binary
                        tcp_writer.write(payload)
                        await tcp_writer.drain()

        # Forward TCP -> WS
        async def forward_tcp_to_ws():
            while True:
                data = await tcp_reader.read(32768)
                if not data:
                    break
                frame = create_ws_frame(data, opcode=2)
                ws_writer.write(frame)
                await ws_writer.drain()

        done, pending = await asyncio.wait(
            [asyncio.create_task(forward_ws_to_tcp()), asyncio.create_task(forward_tcp_to_ws())],
            return_when=asyncio.FIRST_COMPLETED
        )
        for task in pending:
            task.cancel()

    except Exception as e:
        print(f"[Bridge] Session exception: {e}", file=sys.stderr)
    finally:
        print("[Bridge] Closing connection", file=sys.stderr)
        if tcp_writer:
            try:
                tcp_writer.close()
                await tcp_writer.wait_closed()
            except Exception:
                pass
        try:
            ws_writer.close()
            await ws_writer.wait_closed()
        except Exception:
            pass

def daemonize():
    try:
        if os.fork() > 0:
            sys.exit(0)
        os.setsid()
        if os.fork() > 0:
            sys.exit(0)
        sys.stdout.flush()
        sys.stderr.flush()
        with open(os.devnull, 'r') as devnull:
            os.dup2(devnull.fileno(), sys.stdin.fileno())
        with open(os.devnull, 'a+') as devnull:
            os.dup2(devnull.fileno(), sys.stdout.fileno())
            os.dup2(devnull.fileno(), sys.stderr.fileno())
    except Exception as e:
        print(f"[Bridge] Failed to daemonize: {e}", file=sys.stderr)

async def main():
    port = 5998
    for arg in sys.argv[1:]:
        if arg.isdigit():
            port = int(arg)

    host = "127.0.0.1"
    server = await asyncio.start_server(handle_client, host, port)
    print(f"[Bridge] Antigravity VNC micro-bridge listening on ws://{host}:{port}", file=sys.stderr)
    sys.stderr.flush()
    async with server:
        await server.serve_forever()

if __name__ == "__main__":
    if '--daemon' in sys.argv:
        daemonize()
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        pass

