#!/usr/bin/env python3
"""
Test RFB 3.8 VNC Server for Antigravity Remote Desktop Validation.
Full protocol handshake, ServerInit, Raw FramebufferUpdate, PointerEvent, KeyEvent.
"""

import sys
import asyncio
import struct
import time
import math

WIDTH = 640
HEIGHT = 480
BPP = 32

class TestVncServer:
    def __init__(self, host="127.0.0.1", port=5900):
        self.host = host
        self.port = port
        self.last_pointer = (WIDTH // 2, HEIGHT // 2, 0)
        self.key_history = []
        self.frame_count = 0

    def generate_frame(self) -> bytes:
        """Generates dynamic 32-bit RGBA framebuffer bytes."""
        self.frame_count += 1
        px, py, pbtn = self.last_pointer
        buf = bytearray(WIDTH * HEIGHT * 4)

        now_str = time.strftime("%H:%M:%S")
        sub_sec = int((time.time() % 1) * 100)

        # Draw a dark luxury studio background (#0B0C0E) with subtle grid
        bg_r, bg_g, bg_b, bg_a = 11, 12, 14, 255
        grid_r, grid_g, grid_b = 26, 28, 34
        bar_r, bar_g, bar_b = 34, 36, 42

        # Draw top taskbar (height 36)
        # and grid pattern
        idx = 0
        for y in range(HEIGHT):
            is_topbar = (y < 36)
            is_grid_y = (y % 40 == 0)
            for x in range(WIDTH):
                is_grid_x = (x % 40 == 0)
                if is_topbar:
                    r, g, b = bar_r, bar_g, bar_b
                elif is_grid_x or is_grid_y:
                    r, g, b = grid_r, grid_g, grid_b
                else:
                    r, g, b = bg_r, bg_g, bg_b

                # Center pulsing box (interactive test region)
                if 220 <= x <= 420 and 160 <= y <= 320:
                    pulsing = int(128 + 60 * math.sin(self.frame_count * 0.15))
                    if 222 <= x <= 418 and 162 <= y <= 318:
                        r, g, b = 24, 28, 38
                    else:
                        r, g, b = 52, 211, 153 # emerald border

                # Highlight pointer position (interactive feedback)
                dx = x - px
                dy = y - py
                if dx * dx + dy * dy <= 49:
                    if pbtn & 1:
                        r, g, b = 239, 68, 68 # Red if clicked
                    else:
                        r, g, b = 56, 189, 248 # Cyan pointer

                # Pack Little-Endian RGBA / BGRA
                # SetPixelFormat standard: Red=0..255 (shift 0), Green (shift 8), Blue (shift 16)
                buf[idx] = r
                buf[idx + 1] = g
                buf[idx + 2] = b
                buf[idx + 3] = 255
                idx += 4

        return bytes(buf)

    async def handle_client(self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter):
        peer = writer.get_extra_info('peername')
        print(f"[RFB Server] New connection from {peer}", file=sys.stderr)

        try:
            # 1. ProtocolVersion
            writer.write(b"RFB 003.008\n")
            await writer.drain()

            client_ver = await reader.readexactly(12)
            print(f"[RFB Server] Client version: {client_ver.decode('latin1').strip()}", file=sys.stderr)

            # 2. Security Handshake
            # 1 type: None (1)
            writer.write(b"\x01\x01")
            await writer.drain()

            chosen_sec = await reader.readexactly(1)
            print(f"[RFB Server] Client selected security type: {chosen_sec[0]}", file=sys.stderr)

            # SecurityResult: 0 = OK
            writer.write(struct.pack("!I", 0))
            await writer.drain()

            # 3. ClientInit
            shared = await reader.readexactly(1)
            print(f"[RFB Server] ClientInit shared={shared[0]}", file=sys.stderr)

            # 4. ServerInit
            name = b"Antigravity Live RFB 3.8 (arm64)"
            server_init = struct.pack(
                "!HHBBBBHHHBBB3sI",
                WIDTH, HEIGHT,
                32, 24, # bits-per-pixel, depth
                0, 1,   # big-endian (0 = little), true-colour (1)
                255, 255, 255, # red-max, green-max, blue-max
                0, 8, 16,      # red-shift, green-shift, blue-shift
                b"\x00\x00\x00", # pad
                len(name)
            ) + name
            writer.write(server_init)
            await writer.drain()
            print("[RFB Server] ServerInit sent successfully", file=sys.stderr)

            # 5. Main Protocol Loop
            while True:
                msg_type_b = await reader.read(1)
                if not msg_type_b:
                    break
                msg_type = msg_type_b[0]

                if msg_type == 0: # SetPixelFormat
                    pad_and_fmt = await reader.readexactly(19)
                    print(f"[RFB Server] SetPixelFormat received", file=sys.stderr)

                elif msg_type == 2: # SetEncodings
                    pad = await reader.readexactly(1)
                    num_encodings = struct.unpack("!H", await reader.readexactly(2))[0]
                    enc_data = await reader.readexactly(num_encodings * 4)
                    print(f"[RFB Server] SetEncodings: {num_encodings} encodings", file=sys.stderr)

                elif msg_type == 3: # FramebufferUpdateRequest
                    req = await reader.readexactly(9)
                    incremental, rx, ry, rw, rh = struct.unpack("!BHHHH", req)

                    # Send FramebufferUpdate
                    frame_bytes = self.generate_frame()
                    header = struct.pack(
                        "!BBHHHHHi",
                        0, # msg type 0
                        0, # pad
                        1, # 1 rectangle
                        0, 0, WIDTH, HEIGHT, # x, y, w, h
                        0  # Raw encoding
                    )
                    writer.write(header + frame_bytes)
                    await writer.drain()

                elif msg_type == 4: # KeyEvent
                    key_data = await reader.readexactly(7)
                    down_flag, pad, key = struct.unpack("!BBH I", b"\x00" + key_data)
                    # Down flag is byte 0, key is last 4 bytes
                    down_flag = key_data[0]
                    key = struct.unpack("!I", key_data[3:7])[0]
                    print(f"[RFB Server] KeyEvent: key={hex(key)} down={down_flag}", file=sys.stderr)

                elif msg_type == 5: # PointerEvent
                    ptr_data = await reader.readexactly(5)
                    btn_mask, px, py = struct.unpack("!BHH", ptr_data)
                    self.last_pointer = (px, py, btn_mask)
                    # print(f"[RFB Server] PointerEvent: x={px} y={py} btn={btn_mask}", file=sys.stderr)

                elif msg_type == 6: # ClientCutText
                    pad = await reader.readexactly(3)
                    length = struct.unpack("!I", await reader.readexactly(4))[0]
                    text = await reader.readexactly(length)
                    print(f"[RFB Server] ClientCutText: {text.decode('latin1', errors='replace')}", file=sys.stderr)

        except (asyncio.IncompleteReadError, ConnectionResetError, BrokenPipeError):
            pass
        except Exception as e:
            print(f"[RFB Server] Client error: {e}", file=sys.stderr)
        finally:
            print(f"[RFB Server] Client {peer} disconnected", file=sys.stderr)
            writer.close()

    async def start(self):
        server = await asyncio.start_server(self.handle_client, self.host, self.port)
        print(f"[RFB Server] RFB 3.8 VNC server running on {self.host}:{self.port}", file=sys.stderr)
        sys.stderr.flush()
        async with server:
            await server.serve_forever()

if __name__ == "__main__":
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 5900
    srv = TestVncServer(port=port)
    try:
        asyncio.run(srv.start())
    except KeyboardInterrupt:
        pass
