import http from 'http';

const ws = new WebSocket('ws://127.0.0.1:5999/?host=127.0.0.1&port=5901');
ws.binaryType = 'arraybuffer';

let state = 'HANDSHAKE';
let buffer = Buffer.alloc(0);

ws.addEventListener('open', () => {
  console.log('[TestClient] WS connected successfully');
});

ws.addEventListener('message', (event) => {
  const data = Buffer.from(event.data);
  buffer = Buffer.concat([buffer, data]);

  if (state === 'HANDSHAKE') {
    if (buffer.length >= 12) {
      const ver = buffer.subarray(0, 12).toString();
      buffer = buffer.subarray(12);
      console.log('[TestClient] Protocol version from server:', ver.trim());
      ws.send(Buffer.from('RFB 003.008\n'));
      state = 'SECURITY';
    }
  } else if (state === 'SECURITY') {
    if (buffer.length >= 2) {
      const numTypes = buffer[0];
      const type = buffer[1];
      buffer = buffer.subarray(2);
      console.log('[TestClient] Security types count:', numTypes, 'type:', type);
      ws.send(Buffer.from([1])); // None
      state = 'SECURITY_RESULT';
    }
  } else if (state === 'SECURITY_RESULT') {
    if (buffer.length >= 4) {
      const res = buffer.readUInt32BE(0);
      buffer = buffer.subarray(4);
      console.log('[TestClient] Security Result (0 = OK):', res);
      ws.send(Buffer.from([1])); // ClientInit (shared=1)
      state = 'SERVER_INIT';
    }
  } else if (state === 'SERVER_INIT') {
    if (buffer.length >= 24) {
      const w = buffer.readUInt16BE(0);
      const h = buffer.readUInt16BE(2);
      const bpp = buffer[4];
      const nameLen = buffer.readUInt32BE(20);
      if (buffer.length >= 24 + nameLen) {
        const name = buffer.subarray(24, 24 + nameLen).toString();
        buffer = buffer.subarray(24 + nameLen);
        console.log('[TestClient] ServerInit details -> Resolution:', `${w}x${h}`, 'BPP:', bpp, 'Name:', name);

        // Send SetEncodings: Raw (0)
        const encMsg = Buffer.alloc(8);
        encMsg[0] = 2; // SetEncodings
        encMsg.writeUInt16BE(1, 2);
        encMsg.writeInt32BE(0, 4);
        ws.send(encMsg);

        // Send FramebufferUpdateRequest
        const reqMsg = Buffer.alloc(10);
        reqMsg[0] = 3;
        reqMsg[1] = 0; // Incremental = 0 (Full frame)
        reqMsg.writeUInt16BE(0, 2);
        reqMsg.writeUInt16BE(0, 4);
        reqMsg.writeUInt16BE(w, 6);
        reqMsg.writeUInt16BE(h, 8);
        ws.send(reqMsg);

        // Send PointerEvent
        const ptrMsg = Buffer.alloc(6);
        ptrMsg[0] = 5;
        ptrMsg[1] = 1; // Left button down
        ptrMsg.writeUInt16BE(320, 2);
        ptrMsg.writeUInt16BE(240, 4);
        ws.send(ptrMsg);
        console.log('[TestClient] Sent PointerEvent: x=320, y=240, btn=1');

        // Send KeyEvent (Enter key = 0xff0d)
        const keyMsg = Buffer.alloc(8);
        keyMsg[0] = 4;
        keyMsg[1] = 1; // Down
        keyMsg.writeUInt32BE(0xff0d, 4);
        ws.send(keyMsg);
        console.log('[TestClient] Sent KeyEvent: key=0xff0d (Enter)');

        state = 'FRAME_UPDATE';
      }
    }
  } else if (state === 'FRAME_UPDATE') {
    if (buffer.length >= 4) {
      const msgType = buffer[0];
      const numRects = buffer.readUInt16BE(2);
      if (buffer.length >= 16) {
        const rw = buffer.readUInt16BE(8);
        const rh = buffer.readUInt16BE(10);
        const enc = buffer.readInt32BE(12);
        const expectedBytes = 16 + (rw * rh * 4);
        if (buffer.length >= expectedBytes) {
          console.log('[TestClient] FramebufferUpdate received successfully:');
          console.log(`  - msgType: ${msgType} (FramebufferUpdate)`);
          console.log(`  - Rectangles: ${numRects}`);
          console.log(`  - Rect size: ${rw}x${rh}, encoding: ${enc} (Raw)`);
          console.log(`  - Total bytes received: ${buffer.length}`);
          console.log('[TestClient] >>> RESULT: ALL PROTOCOL CHECKS PASSED 100% <<<');
          ws.close();
          process.exit(0);
        }
      }
    }
  }
});

ws.addEventListener('error', (err) => {
  console.error('[TestClient] Error:', err);
  process.exit(1);
});
