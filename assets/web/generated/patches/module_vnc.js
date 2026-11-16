/**
 * ============================================================================
 * Module 5: VncViewerWindow (Клиент aVNC / Remote Desktop)
 * Genuine RFB 3.8 Protocol Engine, Dynamic Framebuffer Streaming,
 * Remote Pointer/Keyboard Transceiver & Floating Window Stacking Integration
 *
 * ZERO-FAKES: Real RFB Handshake, Security Handshake, Raw & CopyRect Decoders,
 * Coordinate Translation, WebSocket-to-TCP micro-bridge auto-launch.
 * ============================================================================
 */

(function (window) {
  'use strict';

  // --------------------------------------------------------------------------
  // Pure JavaScript DES Implementation for VNC Authentication (RFC 6143)
  // --------------------------------------------------------------------------
  const VncAuth = (function () {
    const IP = [
      58, 50, 42, 34, 26, 18, 10, 2, 60, 52, 44, 36, 28, 20, 12, 4,
      62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32, 24, 16, 8,
      57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, 27, 19, 11, 3,
      61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23, 15, 7
    ];
    const FP = [
      40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55, 23, 63, 31,
      38, 6, 46, 14, 54, 22, 62, 30, 37, 5, 45, 13, 53, 21, 61, 29,
      36, 4, 44, 12, 52, 20, 60, 28, 35, 3, 43, 11, 51, 19, 59, 27,
      34, 2, 42, 10, 50, 18, 58, 26, 33, 1, 41, 9, 49, 17, 57, 25
    ];
    const PC1 = [
      57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18,
      10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36,
      63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, 30, 22,
      14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4
    ];
    const PC2 = [
      14, 17, 11, 24, 1, 5, 3, 28, 15, 6, 21, 10,
      23, 19, 12, 4, 26, 8, 16, 7, 27, 20, 13, 2,
      41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48,
      44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32
    ];
    const SHIFTS = [1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1];
    const SBOX = [
      [14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7, 0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8, 4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0, 15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13],
      [15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10, 3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5, 0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15, 13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9],
      [10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8, 13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1, 13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7, 1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12],
      [7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15, 13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9, 10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4, 3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14],
      [2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9, 14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6, 4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14, 11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3],
      [12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11, 10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8, 9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6, 4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13],
      [4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1, 13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6, 1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2, 6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12],
      [13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7, 1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2, 7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8, 2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11]
    ];
    const P = [
      16, 7, 20, 21, 29, 12, 28, 17, 1, 15, 23, 26, 5, 18, 31, 10,
      2, 8, 24, 14, 32, 27, 3, 9, 19, 13, 30, 6, 22, 11, 4, 25
    ];
    const E = [
      32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9,
      8, 9, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17,
      16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25,
      24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 1
    ];

    function permute(src, table) {
      const res = [];
      for (let i = 0; i < table.length; i++) {
        res.push(src[table[i] - 1]);
      }
      return res;
    }

    function bytesToBits(bytes) {
      const bits = [];
      for (let i = 0; i < bytes.length; i++) {
        for (let b = 7; b >= 0; b--) {
          bits.push((bytes[i] >> b) & 1);
        }
      }
      return bits;
    }

    function bitsToBytes(bits) {
      const bytes = new Uint8Array(bits.length / 8);
      for (let i = 0; i < bits.length; i += 8) {
        let byte = 0;
        for (let b = 0; b < 8; b++) {
          byte = (byte << 1) | bits[i + b];
        }
        bytes[i / 8] = byte;
      }
      return bytes;
    }

    function generateSubkeys(keyBits) {
      const pc1Bits = permute(keyBits, PC1);
      let c = pc1Bits.slice(0, 28);
      let d = pc1Bits.slice(28, 56);
      const subkeys = [];

      for (let r = 0; r < 16; r++) {
        const shift = SHIFTS[r];
        c = c.slice(shift).concat(c.slice(0, shift));
        d = d.slice(shift).concat(d.slice(0, shift));
        subkeys.push(permute(c.concat(d), PC2));
      }
      return subkeys;
    }

    function desBlock(blockBits, subkeys) {
      const ipBits = permute(blockBits, IP);
      let l = ipBits.slice(0, 32);
      let r = ipBits.slice(32, 64);

      for (let round = 0; round < 16; round++) {
        const er = permute(r, E);
        const subkey = subkeys[round];
        const xored = er.map((bit, idx) => bit ^ subkey[idx]);

        // S-Boxes
        const sOutput = [];
        for (let s = 0; s < 8; s++) {
          const chunk = xored.slice(s * 6, s * 6 + 6);
          const row = (chunk[0] << 1) | chunk[5];
          const col = (chunk[1] << 3) | (chunk[2] << 2) | (chunk[3] << 1) | chunk[4];
          const val = SBOX[s][row * 16 + col];
          for (let b = 3; b >= 0; b--) {
            sOutput.push((val >> b) & 1);
          }
        }

        const f = permute(sOutput, P);
        const newR = l.map((bit, idx) => bit ^ f[idx]);
        l = r;
        r = newR;
      }

      return permute(r.concat(l), FP);
    }

    function reverseBitsByte(b) {
      let r = 0;
      for (let i = 0; i < 8; i++) {
        if ((b >> i) & 1) r |= (1 << (7 - i));
      }
      return r;
    }

    return {
      encryptChallenge: function (password, challenge16) {
        // VNC Password: pad/truncate to 8 bytes, reverse bits in each byte
        const keyBytes = new Uint8Array(8);
        for (let i = 0; i < Math.min(8, password.length); i++) {
          keyBytes[i] = reverseBitsByte(password.charCodeAt(i) & 0xff);
        }
        const keyBits = bytesToBits(keyBytes);
        const subkeys = generateSubkeys(keyBits);

        // Encrypt two 8-byte blocks
        const chalBits = bytesToBits(challenge16);
        const b1 = desBlock(chalBits.slice(0, 64), subkeys);
        const b2 = desBlock(chalBits.slice(64, 128), subkeys);
        return bitsToBytes(b1.concat(b2));
      }
    };
  })();

  // --------------------------------------------------------------------------
  // Genuine RFB 3.8 Protocol Client Engine
  // --------------------------------------------------------------------------
  class RFBClient {
    constructor() {
      this.ws = null;
      this.state = 'DISCONNECTED'; // CONNECTING, HANDSHAKE, SECURITY, AUTHENTICATING, SERVER_INIT, ACTIVE, CLOSED
      this.buffer = new Uint8Array(0);
      this.password = '';
      this.fbWidth = 0;
      this.fbHeight = 0;
      this.desktopName = '';
      this.pixelFormat = null;
      this.onStateChange = null;
      this.onFrameUpdate = null;
      this.onDesktopSize = null;
      this.onError = null;
      this._updatePending = false;
    }

    connect(wsUrl, password = '') {
      this.disconnect();
      this.password = password;
      this.state = 'CONNECTING';
      this._notifyState('CONNECTING');

      try {
        this.ws = new WebSocket(wsUrl, ['binary']);
        this.ws.binaryType = 'arraybuffer';

        this.ws.onopen = () => {
          this.state = 'HANDSHAKE';
          this._notifyState('HANDSHAKE');
        };

        this.ws.onmessage = (event) => {
          const chunk = new Uint8Array(event.data);
          this._appendBuffer(chunk);
          this._processBuffer();
        };

        this.ws.onerror = (e) => {
          console.error('[RFBClient] WebSocket error:', e);
          if (this.onError) this.onError('Ошибка сетевого соединения RFB WebSocket');
        };

        this.ws.onclose = () => {
          this.state = 'DISCONNECTED';
          this._notifyState('DISCONNECTED');
        };
      } catch (err) {
        if (this.onError) this.onError(err.message);
        this.state = 'DISCONNECTED';
        this._notifyState('DISCONNECTED');
      }
    }

    disconnect() {
      if (this.ws) {
        try {
          this.ws.close();
        } catch (_) {}
        this.ws = null;
      }
      this.buffer = new Uint8Array(0);
      this.state = 'DISCONNECTED';
      this._notifyState('DISCONNECTED');
    }

    _notifyState(st) {
      if (this.onStateChange) this.onStateChange(st);
    }

    _appendBuffer(chunk) {
      const merged = new Uint8Array(this.buffer.length + chunk.length);
      merged.set(this.buffer, 0);
      merged.set(chunk, this.buffer.length);
      this.buffer = merged;
    }

    _consume(n) {
      const slice = this.buffer.slice(0, n);
      this.buffer = this.buffer.slice(n);
      return slice;
    }

    _readUInt16(offset = 0) {
      return (this.buffer[offset] << 8) | this.buffer[offset + 1];
    }

    _readUInt32(offset = 0) {
      return (
        ((this.buffer[offset] << 24) >>> 0) |
        (this.buffer[offset + 1] << 16) |
        (this.buffer[offset + 2] << 8) |
        this.buffer[offset + 3]
      ) >>> 0;
    }

    _readInt32(offset = 0) {
      const u = this._readUInt32(offset);
      return (u & 0x80000000) ? (u - 0x100000000) : u;
    }

    _send(bytes) {
      if (this.ws && this.ws.readyState === WebSocket.OPEN) {
        this.ws.send(bytes.buffer ? bytes.buffer : bytes);
      }
    }

    _processBuffer() {
      try {
        let keepProcessing = true;
        while (keepProcessing && this.buffer.length > 0) {
          switch (this.state) {
            case 'HANDSHAKE':
              if (this.buffer.length < 12) return;
              const verBytes = this._consume(12);
              const verStr = String.fromCharCode.apply(null, verBytes);
              // Reply with RFB 003.008\n
              this._send(new TextEncoder().encode('RFB 003.008\n'));
              this.state = 'SECURITY';
              this._notifyState('SECURITY');
              break;

            case 'SECURITY':
              if (this.buffer.length < 1) return;
              const numSec = this.buffer[0];
              if (numSec === 0) {
                // Connection failed: read error reason
                if (this.buffer.length < 5) return;
                const errLen = this._readUInt32(1);
                if (this.buffer.length < 5 + errLen) return;
                this._consume(5);
                const reason = new TextDecoder().decode(this._consume(errLen));
                throw new Error(`RFB Security Failure: ${reason}`);
              }
              if (this.buffer.length < 1 + numSec) return;
              this._consume(1);
              const secTypes = this._consume(numSec);

              let selectedType = 1; // None
              let hasVncAuth = false;
              for (let i = 0; i < secTypes.length; i++) {
                if (secTypes[i] === 2) hasVncAuth = true;
              }

              if (this.password && hasVncAuth) {
                selectedType = 2; // VNC Auth
              } else if (!hasVncAuth && !secTypes.includes(1)) {
                selectedType = secTypes[0];
              }

              this._send(new Uint8Array([selectedType]));

              if (selectedType === 1) {
                // Security Type None in RFB 3.8 expects 4-byte SecurityResult
                this.state = 'SECURITY_RESULT';
              } else if (selectedType === 2) {
                this.state = 'AUTHENTICATING';
                this._notifyState('AUTHENTICATING');
              } else {
                throw new Error(`Неподдерживаемый тип авторизации RFB: ${selectedType}`);
              }
              break;

            case 'AUTHENTICATING':
              // 16-byte random challenge
              if (this.buffer.length < 16) return;
              const challenge = this._consume(16);
              const response = VncAuth.encryptChallenge(this.password, challenge);
              this._send(response);
              this.state = 'SECURITY_RESULT';
              break;

            case 'SECURITY_RESULT':
              if (this.buffer.length < 4) return;
              const secResult = this._readUInt32(0);
              this._consume(4);
              if (secResult !== 0) {
                // Failed, read error string if available
                let errMsg = 'Авторизация VNC отклонена сервером (Неверный пароль)';
                if (this.buffer.length >= 4) {
                  const len = this._readUInt32(0);
                  if (this.buffer.length >= 4 + len) {
                    this._consume(4);
                    errMsg = new TextDecoder().decode(this._consume(len));
                  }
                }
                throw new Error(errMsg);
              }
              // Send ClientInit (shared = 1)
              this._send(new Uint8Array([1]));
              this.state = 'SERVER_INIT';
              this._notifyState('SERVER_INIT');
              break;

            case 'SERVER_INIT':
              if (this.buffer.length < 24) return;
              this.fbWidth = this._readUInt16(0);
              this.fbHeight = this._readUInt16(2);
              const bpp = this.buffer[4];
              const depth = this.buffer[5];
              const bigEndian = this.buffer[6];
              const trueColour = this.buffer[7];
              const redMax = this._readUInt16(8);
              const greenMax = this._readUInt16(10);
              const blueMax = this._readUInt16(12);
              const redShift = this.buffer[14];
              const greenShift = this.buffer[15];
              const blueShift = this.buffer[16];
              const nameLen = this._readUInt32(20);

              if (this.buffer.length < 24 + nameLen) return;
              this._consume(24);
              this.desktopName = new TextDecoder().decode(this._consume(nameLen));

              this.pixelFormat = {
                bpp, depth, bigEndian, trueColour,
                redMax, greenMax, blueMax,
                redShift, greenShift, blueShift
              };

              console.log(`[RFBClient] Desktop '${this.desktopName}' (${this.fbWidth}x${this.fbHeight}, bpp=${bpp})`);

              // Send SetEncodings: Raw (0), CopyRect (1), DesktopSize (-223)
              this._sendSetEncodings([0, 1, -223]);

              // Send initial FramebufferUpdateRequest (incremental = 0)
              this.requestUpdate(0);

              this.state = 'ACTIVE';
              this._notifyState('ACTIVE');
              if (this.onDesktopSize) this.onDesktopSize(this.fbWidth, this.fbHeight, this.desktopName);
              break;

            case 'ACTIVE':
              keepProcessing = this._handleServerMessage();
              break;

            default:
              keepProcessing = false;
              break;
          }
        }
      } catch (err) {
        console.error('[RFBClient] Protocol error:', err);
        if (this.onError) this.onError(err.message);
        this.disconnect();
      }
    }

    _handleServerMessage() {
      if (this.buffer.length < 1) return false;
      const msgType = this.buffer[0];

      if (msgType === 0) {
        // FramebufferUpdate
        if (this.buffer.length < 4) return false;
        const numRects = this._readUInt16(2);
        let offset = 4;

        // Verify full payload availability before consuming
        for (let r = 0; r < numRects; r++) {
          if (this.buffer.length < offset + 12) return false;
          const rw = this._readUInt16(offset + 4);
          const rh = this._readUInt16(offset + 6);
          const encoding = this._readInt32(offset + 8);
          offset += 12;

          if (encoding === 0) {
            // Raw: rw * rh * (bpp / 8) bytes
            const bytesPerPixel = Math.max(1, Math.floor(this.pixelFormat.bpp / 8));
            const dataLen = rw * rh * bytesPerPixel;
            if (this.buffer.length < offset + dataLen) return false;
            offset += dataLen;
          } else if (encoding === 1) {
            // CopyRect: 4 bytes (srcX, srcY)
            if (this.buffer.length < offset + 4) return false;
            offset += 4;
          } else if (encoding === -223) {
            // DesktopSize: 0 extra bytes, rx/ry/rw/rh define new resolution
          } else {
            console.warn(`[RFBClient] Unsupported encoding ${encoding}`);
          }
        }

        // All rectangles are buffered: process and render
        this._consume(4);
        for (let r = 0; r < numRects; r++) {
          const rx = (this.buffer[0] << 8) | this.buffer[1];
          const ry = (this.buffer[2] << 8) | this.buffer[3];
          const rw = (this.buffer[4] << 8) | this.buffer[5];
          const rh = (this.buffer[6] << 8) | this.buffer[7];
          const encoding = this._readInt32(8);
          this._consume(12);

          if (encoding === 0) {
            const bytesPerPixel = Math.max(1, Math.floor(this.pixelFormat.bpp / 8));
            const dataLen = rw * rh * bytesPerPixel;
            const rawBytes = this._consume(dataLen);

            if (this.onFrameUpdate) {
              this.onFrameUpdate({
                type: 'raw',
                x: rx, y: ry, width: rw, height: rh,
                data: rawBytes,
                format: this.pixelFormat
              });
            }
          } else if (encoding === 1) {
            const srcX = (this.buffer[0] << 8) | this.buffer[1];
            const srcY = (this.buffer[2] << 8) | this.buffer[3];
            this._consume(4);

            if (this.onFrameUpdate) {
              this.onFrameUpdate({
                type: 'copyrect',
                x: rx, y: ry, width: rw, height: rh,
                srcX, srcY
              });
            }
          } else if (encoding === -223) {
            // DesktopSize pseudo-encoding
            this.fbWidth = rw;
            this.fbHeight = rh;
            if (this.onDesktopSize) this.onDesktopSize(rw, rh, this.desktopName);
          }
        }

        // Request next incremental update
        this.requestUpdate(1);
        return true;
      } else if (msgType === 2) {
        // Bell
        this._consume(1);
        return true;
      } else if (msgType === 3) {
        // ServerCutText
        if (this.buffer.length < 8) return false;
        const textLen = this._readUInt32(4);
        if (this.buffer.length < 8 + textLen) return false;
        this._consume(8);
        const text = new TextDecoder().decode(this._consume(textLen));
        console.log(`[RFBClient] ServerCutText: ${text.slice(0, 80)}`);
        return true;
      } else {
        console.warn(`[RFBClient] Unknown server message type: ${msgType}`);
        this._consume(1);
        return true;
      }
    }

    _sendSetEncodings(encodings) {
      const buf = new Uint8Array(4 + encodings.length * 4);
      buf[0] = 2; // SetEncodings
      buf[1] = 0; // pad
      buf[2] = (encodings.length >> 8) & 0xff;
      buf[3] = encodings.length & 0xff;
      for (let i = 0; i < encodings.length; i++) {
        const enc = encodings[i];
        const off = 4 + i * 4;
        buf[off] = (enc >> 24) & 0xff;
        buf[off + 1] = (enc >> 16) & 0xff;
        buf[off + 2] = (enc >> 8) & 0xff;
        buf[off + 3] = enc & 0xff;
      }
      this._send(buf);
    }

    requestUpdate(incremental = 1) {
      if (this.state !== 'ACTIVE') return;
      const buf = new Uint8Array(10);
      buf[0] = 3; // FramebufferUpdateRequest
      buf[1] = incremental ? 1 : 0;
      buf[2] = 0; buf[3] = 0; // x = 0
      buf[4] = 0; buf[5] = 0; // y = 0
      buf[6] = (this.fbWidth >> 8) & 0xff;
      buf[7] = this.fbWidth & 0xff;
      buf[8] = (this.fbHeight >> 8) & 0xff;
      buf[9] = this.fbHeight & 0xff;
      this._send(buf);
    }

    sendPointerEvent(x, y, buttonMask = 0) {
      if (this.state !== 'ACTIVE') return;
      const clX = Math.max(0, Math.min(this.fbWidth - 1, Math.round(x)));
      const clY = Math.max(0, Math.min(this.fbHeight - 1, Math.round(y)));
      const buf = new Uint8Array(6);
      buf[0] = 5; // PointerEvent
      buf[1] = buttonMask & 0xff;
      buf[2] = (clX >> 8) & 0xff;
      buf[3] = clX & 0xff;
      buf[4] = (clY >> 8) & 0xff;
      buf[5] = clY & 0xff;
      this._send(buf);
    }

    sendKeyEvent(keysym, downFlag = 1) {
      if (this.state !== 'ACTIVE') return;
      const buf = new Uint8Array(8);
      buf[0] = 4; // KeyEvent
      buf[1] = downFlag ? 1 : 0;
      buf[2] = 0; buf[3] = 0; // pad
      buf[4] = (keysym >> 24) & 0xff;
      buf[5] = (keysym >> 16) & 0xff;
      buf[6] = (keysym >> 8) & 0xff;
      buf[7] = keysym & 0xff;
      this._send(buf);
    }
  }

  // --------------------------------------------------------------------------
  // Floating Window Controller & UI
  // --------------------------------------------------------------------------
  class VncViewerModule {
    constructor() {
      this.windowInstance = null;
      this.rfb = new RFBClient();
      this.canvas = null;
      this.ctx = null;
      this.isFitMode = true; // Fit to Window vs 1:1 Pixel Perfect
      this.isKeyboardVisible = false;
      this.pointerMask = 0;
      this.bridgePort = 5998;
      this._setupRFBListeners();
    }

    _setupRFBListeners() {
      this.rfb.onStateChange = (st) => this._updateStatusUI(st);
      this.rfb.onDesktopSize = (w, h, name) => {
        if (this.canvas) {
          this.canvas.width = w;
          this.canvas.height = h;
          if (this.resBadgeEl) {
            this.resBadgeEl.textContent = `${w}×${h}`;
          }
        }
      };
      this.rfb.onFrameUpdate = (rect) => this._renderFrameUpdate(rect);
      this.rfb.onError = (msg) => {
        if (window.showSystemToast) window.showSystemToast(`VNC Ошибка: ${msg}`);
        this._updateStatusUI('ERROR', msg);
      };
    }

    open(opts = {}) {
      if (this.windowInstance && window.DesktopWindowManager.windows.has('win-vnc-viewer')) {
        this.windowInstance.restore();
        this.windowInstance.focus();
        return this.windowInstance;
      }

      const content = this._createDOM();
      this.windowInstance = window.DesktopWindowManager.createWindow({
        id: 'win-vnc-viewer',
        title: 'aVNC — Удаленный Рабочий Стол (RFB 3.8)',
        iconSvg: '<rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/>',
        width: Math.min(window.innerWidth * 0.92, 720),
        height: Math.min(window.innerHeight * 0.75, 520),
        x: Math.max(16, (window.innerWidth - Math.min(window.innerWidth * 0.92, 720)) / 2),
        y: 80,
        content: content,
        onClose: () => {
          this.disconnect();
          this.windowInstance = null;
        }
      });

      return this.windowInstance;
    }

    _createDOM() {
      const root = document.createElement('div');
      root.className = 'ag-vnc-workspace';
      root.style.cssText = 'display:flex; flex-direction:column; height:100%; background:#050608; overflow:hidden; font-family:var(--ag-font-mono);';
      root.innerHTML = `
        <div class="ag-vnc-toolbar" style="height:42px; display:flex; align-items:center; gap:6px; padding:0 8px; background:var(--ag-surface-header); border-bottom:1px solid var(--ag-border-subtle); flex-shrink:0; overflow-x:auto;">
          <span style="font-size:11px; color:var(--ag-text-muted);">HOST:</span>
          <input type="text" id="agVncHost" value="127.0.0.1" style="width:85px; background:rgba(0,0,0,0.4); border:1px solid var(--ag-border-subtle); border-radius:4px; padding:3px 6px; color:#fff; font-size:11px;" />
          <span style="font-size:11px; color:var(--ag-text-muted);">PORT:</span>
          <input type="text" id="agVncPort" value="5900" style="width:48px; background:rgba(0,0,0,0.4); border:1px solid var(--ag-border-subtle); border-radius:4px; padding:3px 6px; color:#fff; font-size:11px;" />
          <input type="password" id="agVncPass" placeholder="Пароль" style="width:65px; background:rgba(0,0,0,0.4); border:1px solid var(--ag-border-subtle); border-radius:4px; padding:3px 6px; color:#fff; font-size:11px;" />
          
          <button class="ag-win-btn" id="agVncConnectBtn" style="width:auto; padding:0 10px; height:26px; font-size:11px; font-weight:600; background:#34d399; color:#0b0c0e; border-radius:4px; border:none; cursor:pointer;">Подключить</button>
          <button class="ag-win-btn" id="agVncFitBtn" style="width:auto; padding:0 8px; height:26px; font-size:11px; background:rgba(255,255,255,0.08); color:#eceef2; border-radius:4px; border:1px solid var(--ag-border-subtle); cursor:pointer;">Вписать</button>
          <button class="ag-win-btn" id="agVncKbdBtn" style="width:auto; padding:0 8px; height:26px; font-size:11px; background:rgba(255,255,255,0.08); color:#eceef2; border-radius:4px; border:1px solid var(--ag-border-subtle); cursor:pointer;">Клавиатура</button>
          
          <div style="flex:1;"></div>
          <span id="agVncResBadge" style="font-size:10px; color:#94a3b8; background:rgba(255,255,255,0.05); padding:2px 6px; border-radius:3px;">---</span>
          <span id="agVncStatus" style="font-size:10px; color:#ef4444; font-weight:600; margin-left:4px;">ОТКЛЮЧЕНО</span>
        </div>

        <div id="agVncViewport" style="flex:1; position:relative; overflow:auto; display:flex; align-items:center; justify-content:center; touch-action:none; user-select:none; background:#07080a;">
          <canvas id="agVncCanvas" width="640" height="480" style="max-width:100%; max-height:100%; object-fit:contain; background:#0b0c0e; box-shadow:0 0 25px rgba(0,0,0,0.8); image-rendering:pixelated;"></canvas>
        </div>

        <!-- Virtual Keyboard Quick Bar for Android -->
        <div id="agVncKbdBar" style="display:none; height:36px; background:#121418; border-top:1px solid var(--ag-border-subtle); padding:0 6px; align-items:center; gap:4px; overflow-x:auto; flex-shrink:0;">
          <button class="ag-vnc-kbtn" data-key="0xff1b">Esc</button>
          <button class="ag-vnc-kbtn" data-key="0xff09">Tab</button>
          <button class="ag-vnc-kbtn" data-key="0xffe3">Ctrl</button>
          <button class="ag-vnc-kbtn" data-key="0xffe9">Alt</button>
          <button class="ag-vnc-kbtn" data-key="0xffeb">Super</button>
          <button class="ag-vnc-kbtn" data-key="0xff08">Bksp</button>
          <button class="ag-vnc-kbtn" data-key="0xffff">Del</button>
          <button class="ag-vnc-kbtn" data-key="0xff52">↑</button>
          <button class="ag-vnc-kbtn" data-key="0xff54">↓</button>
          <button class="ag-vnc-kbtn" data-key="0xff51">←</button>
          <button class="ag-vnc-kbtn" data-key="0xff53">→</button>
          <button class="ag-vnc-kbtn" data-key="0xff0d">Enter</button>
          <button class="ag-vnc-kbtn" data-macro="ctrl-c">Ctrl+C</button>
        </div>
      `;

      // Style helper keys
      const kbtnStyle = document.createElement('style');
      kbtnStyle.textContent = `
        .ag-vnc-kbtn {
          height: 26px; padding: 0 8px; font-family: var(--ag-font-mono); font-size: 11px;
          background: #1c1f26; color: #eceef2; border: 1px solid #2d3340; border-radius: 4px;
          cursor: pointer; user-select: none; flex-shrink: 0;
        }
        .ag-vnc-kbtn:active { background: #34d399; color: #0b0c0e; }
      `;
      root.appendChild(kbtnStyle);

      this.connectBtn = root.querySelector('#agVncConnectBtn');
      this.statusEl = root.querySelector('#agVncStatus');
      this.resBadgeEl = root.querySelector('#agVncResBadge');
      this.viewport = root.querySelector('#agVncViewport');
      this.canvas = root.querySelector('#agVncCanvas');
      this.ctx = this.canvas.getContext('2d');
      this.kbdBar = root.querySelector('#agVncKbdBar');
      const fitBtn = root.querySelector('#agVncFitBtn');
      const kbdBtn = root.querySelector('#agVncKbdBtn');

      this._drawPlaceholderScreen('VNC сессия не подключена (Нажмите «Подключить»)');

      // Connect toggle
      this.connectBtn.onclick = () => {
        if (this.rfb.state === 'DISCONNECTED') {
          const host = root.querySelector('#agVncHost').value.trim() || '127.0.0.1';
          const port = parseInt(root.querySelector('#agVncPort').value.trim(), 10) || 5900;
          const pass = root.querySelector('#agVncPass').value;
          this.connect(host, port, pass);
        } else {
          this.disconnect();
        }
      };

      // Fit mode toggle
      fitBtn.onclick = () => {
        this.isFitMode = !this.isFitMode;
        if (this.isFitMode) {
          fitBtn.textContent = 'Вписать';
          this.canvas.style.maxWidth = '100%';
          this.canvas.style.maxHeight = '100%';
          this.canvas.style.objectFit = 'contain';
        } else {
          fitBtn.textContent = '1:1 Реальный';
          this.canvas.style.maxWidth = 'none';
          this.canvas.style.maxHeight = 'none';
          this.canvas.style.objectFit = 'none';
        }
      };

      // Keyboard bar toggle
      kbdBtn.onclick = () => {
        this.isKeyboardVisible = !this.isKeyboardVisible;
        this.kbdBar.style.display = this.isKeyboardVisible ? 'flex' : 'none';
        kbdBtn.style.background = this.isKeyboardVisible ? 'rgba(52,211,153,0.2)' : 'rgba(255,255,255,0.08)';
      };

      // Virtual keyboard click bindings
      this.kbdBar.querySelectorAll('.ag-vnc-kbtn').forEach((btn) => {
        btn.addEventListener('click', (e) => {
          e.stopPropagation();
          const keyHex = btn.getAttribute('data-key');
          const macro = btn.getAttribute('data-macro');
          if (macro === 'ctrl-c') {
            this.rfb.sendKeyEvent(0xffe3, 1); // Ctrl down
            this.rfb.sendKeyEvent(0x0063, 1); // 'c' down
            setTimeout(() => {
              this.rfb.sendKeyEvent(0x0063, 0); // 'c' up
              this.rfb.sendKeyEvent(0xffe3, 0); // Ctrl up
            }, 80);
          } else if (keyHex) {
            const sym = parseInt(keyHex, 16);
            this.rfb.sendKeyEvent(sym, 1);
            setTimeout(() => this.rfb.sendKeyEvent(sym, 0), 80);
          }
        });
      });

      // Pointer Event Isolation & Dispatching
      this._bindPointerEvents();

      return root;
    }

    _bindPointerEvents() {
      const getCoords = (clientX, clientY) => {
        const rect = this.canvas.getBoundingClientRect();
        const scaleX = this.canvas.width / rect.width;
        const scaleY = this.canvas.height / rect.height;
        const x = (clientX - rect.left) * scaleX;
        const y = (clientY - rect.top) * scaleY;
        return {
          x: Math.max(0, Math.min(this.canvas.width - 1, x)),
          y: Math.max(0, Math.min(this.canvas.height - 1, y))
        };
      };

      // Pointer down
      this.viewport.addEventListener('pointerdown', (e) => {
        e.stopPropagation();
        if (this.rfb.state !== 'ACTIVE') return;
        this.canvas.setPointerCapture(e.pointerId);

        // Map mouse buttons (0=Left:1, 1=Middle:2, 2=Right:4)
        let mask = 1;
        if (e.button === 1) mask = 2;
        else if (e.button === 2) mask = 4;
        this.pointerMask |= mask;

        const { x, y } = getCoords(e.clientX, e.clientY);
        this.rfb.sendPointerEvent(x, y, this.pointerMask);
      }, { passive: false });

      // Pointer move
      this.viewport.addEventListener('pointermove', (e) => {
        e.stopPropagation();
        if (this.rfb.state !== 'ACTIVE') return;
        const { x, y } = getCoords(e.clientX, e.clientY);
        this.rfb.sendPointerEvent(x, y, this.pointerMask);
      }, { passive: false });

      // Pointer up
      this.viewport.addEventListener('pointerup', (e) => {
        e.stopPropagation();
        if (this.rfb.state !== 'ACTIVE') return;
        try { this.canvas.releasePointerCapture(e.pointerId); } catch (_) {}

        let mask = 1;
        if (e.button === 1) mask = 2;
        else if (e.button === 2) mask = 4;
        this.pointerMask &= ~mask;

        const { x, y } = getCoords(e.clientX, e.clientY);
        this.rfb.sendPointerEvent(x, y, this.pointerMask);
      }, { passive: false });

      // Prevent context menu on right click
      this.viewport.addEventListener('contextmenu', (e) => {
        e.preventDefault();
        e.stopPropagation();
      });

      // Mouse wheel / trackpad scroll
      this.viewport.addEventListener('wheel', (e) => {
        e.preventDefault();
        e.stopPropagation();
        if (this.rfb.state !== 'ACTIVE') return;
        const { x, y } = getCoords(e.clientX, e.clientY);
        const wheelMask = e.deltaY < 0 ? 8 : 16; // 8 = wheel up, 16 = wheel down
        this.rfb.sendPointerEvent(x, y, wheelMask);
        setTimeout(() => this.rfb.sendPointerEvent(x, y, 0), 40);
      }, { passive: false });
    }

    async connect(host, port, password = '') {
      this._updateStatusUI('CONNECTING');

      // If user provided a raw TCP host:port, connect via local micro-bridge
      let wsUrl = '';
      if (host.startsWith('ws://') || host.startsWith('wss://')) {
        wsUrl = host;
      } else {
        // Ensure local bridge is running
        await this._ensureBridgeRunning();
        wsUrl = `ws://127.0.0.1:${this.bridgePort}/?host=${encodeURIComponent(host)}&port=${encodeURIComponent(port)}`;
      }

      console.log(`[VncViewerModule] Connecting to ${wsUrl}...`);
      this.rfb.connect(wsUrl, password);
    }

    async _ensureBridgeRunning() {
      const bridge = window.SystemBridge || window.BridgeConnector;
      if (!bridge) return;
      try {
        // Launch agy-vnc-bridge in daemon mode if not already alive
        const checkCmd = `pgrep -f agy-vnc-bridge || /data/user/0/com.agy/files/usr/bin/agy-vnc-bridge --daemon ${this.bridgePort}`;
        await bridge.exec(checkCmd);
        // Small settle time for TCP socket
        await new Promise((r) => setTimeout(r, 200));
      } catch (e) {
        console.warn('[VncViewerModule] Bridge check exception:', e);
      }
    }

    disconnect() {
      this.rfb.disconnect();
      this._drawPlaceholderScreen('VNC сессия отключена');
    }

    _updateStatusUI(st, errMsg) {
      if (!this.statusEl) return;
      switch (st) {
        case 'CONNECTING':
        case 'HANDSHAKE':
        case 'SECURITY':
        case 'AUTHENTICATING':
        case 'SERVER_INIT':
          this.statusEl.textContent = 'ПОДКЛЮЧЕНИЕ...';
          this.statusEl.style.color = '#f59e0b';
          if (this.connectBtn) {
            this.connectBtn.textContent = 'Отмена';
            this.connectBtn.style.background = '#ef4444';
            this.connectBtn.style.color = '#ffffff';
          }
          break;
        case 'ACTIVE':
          this.statusEl.textContent = 'РАБОТАЕТ (RFB 3.8)';
          this.statusEl.style.color = '#34d399';
          if (this.connectBtn) {
            this.connectBtn.textContent = 'Отключить';
            this.connectBtn.style.background = '#ef4444';
            this.connectBtn.style.color = '#ffffff';
          }
          if (window.showSystemToast) window.showSystemToast('VNC сессия успешно подключена');
          break;
        case 'ERROR':
          this.statusEl.textContent = 'ОШИБКА';
          this.statusEl.style.color = '#ef4444';
          if (this.connectBtn) {
            this.connectBtn.textContent = 'Подключить';
            this.connectBtn.style.background = '#34d399';
            this.connectBtn.style.color = '#0b0c0e';
          }
          break;
        case 'DISCONNECTED':
        default:
          this.statusEl.textContent = 'ОТКЛЮЧЕНО';
          this.statusEl.style.color = '#ef4444';
          if (this.connectBtn) {
            this.connectBtn.textContent = 'Подключить';
            this.connectBtn.style.background = '#34d399';
            this.connectBtn.style.color = '#0b0c0e';
          }
          if (this.resBadgeEl) this.resBadgeEl.textContent = '---';
          break;
      }
    }

    _renderFrameUpdate(rect) {
      if (!this.ctx) return;
      if (rect.type === 'raw') {
        const { x, y, width, height, data, format } = rect;
        const imgData = this.ctx.createImageData(width, height);
        const dst = imgData.data;

        // Convert RFB pixel bytes to RGBA Uint8ClampedArray
        const bpp = format ? format.bpp : 32;
        const bytesPerPixel = Math.max(1, Math.floor(bpp / 8));
        const rShift = (format && format.redShift !== undefined) ? format.redShift : 0;
        const gShift = (format && format.greenShift !== undefined) ? format.greenShift : 8;
        const bShift = (format && format.blueShift !== undefined) ? format.blueShift : 16;

        let srcIdx = 0;
        let dstIdx = 0;
        const totalPixels = width * height;

        if (bytesPerPixel === 4) {
          const rByte = rShift >> 3;
          const gByte = gShift >> 3;
          const bByte = bShift >> 3;
          for (let p = 0; p < totalPixels; p++) {
            dst[dstIdx] = data[srcIdx + rByte];
            dst[dstIdx + 1] = data[srcIdx + gByte];
            dst[dstIdx + 2] = data[srcIdx + bByte];
            dst[dstIdx + 3] = 255;
            srcIdx += 4;
            dstIdx += 4;
          }
        } else if (bytesPerPixel === 2) {
          // 16-bit RGB 565
          for (let p = 0; p < totalPixels; p++) {
            const val = (data[srcIdx + 1] << 8) | data[srcIdx];
            dst[dstIdx] = ((val >> 11) & 0x1f) * 255 / 31;
            dst[dstIdx + 1] = ((val >> 5) & 0x3f) * 255 / 63;
            dst[dstIdx + 2] = (val & 0x1f) * 255 / 31;
            dst[dstIdx + 3] = 255;
            srcIdx += 2;
            dstIdx += 4;
          }
        }

        this.ctx.putImageData(imgData, x, y);
      } else if (rect.type === 'copyrect') {
        const { x, y, width, height, srcX, srcY } = rect;
        this.ctx.drawImage(this.canvas, srcX, srcY, width, height, x, y, width, height);
      }
    }

    _drawPlaceholderScreen(text) {
      if (!this.ctx) return;
      this.ctx.fillStyle = '#0b0c0e';
      this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);

      this.ctx.strokeStyle = '#1b1e26';
      this.ctx.lineWidth = 1;
      for (let x = 0; x < this.canvas.width; x += 40) {
        this.ctx.beginPath(); this.ctx.moveTo(x, 0); this.ctx.lineTo(x, this.canvas.height); this.ctx.stroke();
      }
      for (let y = 0; y < this.canvas.height; y += 40) {
        this.ctx.beginPath(); this.ctx.moveTo(0, y); this.ctx.lineTo(this.canvas.width, y); this.ctx.stroke();
      }

      this.ctx.fillStyle = '#64748b';
      this.ctx.font = '14px "JetBrains Mono", monospace';
      this.ctx.textAlign = 'center';
      this.ctx.fillText(text, this.canvas.width / 2, this.canvas.height / 2);
    }
  }

  // Export Singleton
  window.VncViewerModule = new VncViewerModule();
})(window);
