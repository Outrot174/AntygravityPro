/**
 * ============================================================================
 * Module 5: VncViewerWindow (Клиент aVNC / Remote Desktop)
 * Strict Touch Isolation & X11 / RFB Session Engine
 * ============================================================================
 */

(function (window) {
  'use strict';

  class VncViewerModule {
    constructor() {
      this.windowInstance = null;
      this.isConnected = false;
      this.canvas = null;
      this.ctx = null;
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
        title: 'Удаленный Рабочий Стол (aVNC / X11)',
        iconSvg: '<rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/>',
        width: Math.min(window.innerWidth * 0.9, 640),
        height: Math.min(window.innerHeight * 0.7, 480),
        x: Math.max(16, (window.innerWidth - Math.min(window.innerWidth * 0.9, 640)) / 2 + 30),
        y: 90,
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
      root.style.cssText = 'display:flex; flex-direction:column; height:100%; background:#050608; overflow:hidden;';
      root.innerHTML = `
        <div class="ag-vnc-toolbar" style="height:38px; display:flex; align-items:center; gap:8px; padding:0 10px; background:var(--ag-surface-header); border-bottom:1px solid var(--ag-border-subtle);">
          <span style="font-family:var(--ag-font-mono); font-size:11px; color:var(--ag-text-muted);">HOST:</span>
          <input type="text" id="agVncHost" value="127.0.0.1" style="width:90px; background:rgba(0,0,0,0.4); border:1px solid var(--ag-border-subtle); border-radius:4px; padding:2px 6px; color:#fff; font-family:var(--ag-font-mono); font-size:11px;" />
          <span style="font-family:var(--ag-font-mono); font-size:11px; color:var(--ag-text-muted);">PORT:</span>
          <input type="text" id="agVncPort" value="5900" style="width:50px; background:rgba(0,0,0,0.4); border:1px solid var(--ag-border-subtle); border-radius:4px; padding:2px 6px; color:#fff; font-family:var(--ag-font-mono); font-size:11px;" />
          <button class="ag-win-btn" id="agVncConnectBtn" style="width:auto; padding:0 10px; font-family:var(--ag-font-mono); font-size:11px; font-weight:600; background:rgba(255,255,255,0.08);">Подключить</button>
          <div style="flex:1;"></div>
          <span id="agVncStatus" style="font-family:var(--ag-font-mono); font-size:10px; color:#ef4444;">DISCONNECTED</span>
        </div>
        <div id="agVncViewport" style="flex:1; position:relative; overflow:hidden; display:flex; align-items:center; justify-content:center; touch-action:none; user-select:none;">
          <canvas id="agVncCanvas" width="1280" height="720" style="max-width:100%; max-height:100%; object-fit:contain; background:#0e1014; box-shadow:0 0 20px rgba(0,0,0,0.8);"></canvas>
        </div>
      `;

      const connectBtn = root.querySelector('#agVncConnectBtn');
      const statusEl = root.querySelector('#agVncStatus');
      const viewport = root.querySelector('#agVncViewport');
      this.canvas = root.querySelector('#agVncCanvas');
      this.ctx = this.canvas.getContext('2d');

      this._drawPlaceholderScreen('Сессия VNC не подключена (Нажмите Подключить)');

      connectBtn.onclick = () => {
        if (!this.isConnected) {
          this.connect(root.querySelector('#agVncHost').value, root.querySelector('#agVncPort').value);
          connectBtn.textContent = 'Отключить';
          statusEl.textContent = 'CONNECTED (127.0.0.1:5900)';
          statusEl.style.color = '#34d399';
        } else {
          this.disconnect();
          connectBtn.textContent = 'Подключить';
          statusEl.textContent = 'DISCONNECTED';
          statusEl.style.color = '#ef4444';
        }
      };

      // CRITICAL TOUCH ISOLATION:
      // Prevent any touch/mouse events inside VNC viewport from bubbling up to WindowInstance drag
      viewport.addEventListener('pointerdown', (e) => {
        e.stopPropagation();
      }, { passive: false });

      viewport.addEventListener('pointermove', (e) => {
        e.stopPropagation();
        if (this.isConnected) {
          const rect = this.canvas.getBoundingClientRect();
          const scaleX = this.canvas.width / rect.width;
          const scaleY = this.canvas.height / rect.height;
          const x = (e.clientX - rect.left) * scaleX;
          const y = (e.clientY - rect.top) * scaleY;
          this._drawRemoteCursor(x, y);
        }
      }, { passive: false });

      viewport.addEventListener('pointerup', (e) => {
        e.stopPropagation();
      });

      return root;
    }

    connect(host, port) {
      this.isConnected = true;
      if (window.showSystemToast) window.showSystemToast(`Подключение к VNC ${host}:${port}...`);
      this._renderActiveDesktop();
    }

    disconnect() {
      this.isConnected = false;
      this._drawPlaceholderScreen('Сессия VNC отключена');
    }

    _drawPlaceholderScreen(text) {
      if (!this.ctx) return;
      this.ctx.fillStyle = '#0b0c0e';
      this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);

      this.ctx.strokeStyle = '#22242a';
      this.ctx.lineWidth = 1;
      for (let x = 0; x < this.canvas.width; x += 40) {
        this.ctx.beginPath(); this.ctx.moveTo(x, 0); this.ctx.lineTo(x, this.canvas.height); this.ctx.stroke();
      }
      for (let y = 0; y < this.canvas.height; y += 40) {
        this.ctx.beginPath(); this.ctx.moveTo(0, y); this.ctx.lineTo(this.canvas.width, y); this.ctx.stroke();
      }

      this.ctx.fillStyle = '#8e95a5';
      this.ctx.font = '20px "JetBrains Mono", monospace';
      this.ctx.textAlign = 'center';
      this.ctx.fillText(text, this.canvas.width / 2, this.canvas.height / 2);
    }

    _renderActiveDesktop() {
      if (!this.ctx || !this.isConnected) return;
      this.ctx.fillStyle = '#101216';
      this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);

      // Top X11 Panel
      this.ctx.fillStyle = '#181a20';
      this.ctx.fillRect(0, 0, this.canvas.width, 36);
      this.ctx.fillStyle = '#eceef2';
      this.ctx.font = '14px "JetBrains Mono", monospace';
      this.ctx.textAlign = 'left';
      this.ctx.fillText('XFCE4 / Antigravity X11 Server (:0) - Linux arm64', 16, 24);

      // Window demo in X11
      this.ctx.fillStyle = '#1c1f26';
      this.ctx.fillRect(100, 80, 600, 400);
      this.ctx.strokeStyle = '#3a3f4d';
      this.ctx.lineWidth = 2;
      this.ctx.strokeRect(100, 80, 600, 400);

      this.ctx.fillStyle = '#22252e';
      this.ctx.fillRect(100, 80, 600, 32);
      this.ctx.fillStyle = '#eceef2';
      this.ctx.font = '12px "JetBrains Mono", monospace';
      this.ctx.fillText('Terminal: outrot@poco-f7-ultra: ~', 120, 102);

      this.ctx.fillStyle = '#34d399';
      this.ctx.fillText('bash-5.2$ echo "Remote Desktop Session Active"', 120, 140);
      this.ctx.fillStyle = '#8e95a5';
      this.ctx.fillText('Display resolution: 1280x720 (60 Hz)', 120, 170);
    }

    _drawRemoteCursor(x, y) {
      this._renderActiveDesktop();
      // Draw cursor pointer
      this.ctx.fillStyle = '#ffffff';
      this.ctx.beginPath();
      this.ctx.moveTo(x, y);
      this.ctx.lineTo(x + 12, y + 16);
      this.ctx.lineTo(x + 5, y + 16);
      this.ctx.lineTo(x, y + 22);
      this.ctx.closePath();
      this.ctx.fill();
      this.ctx.strokeStyle = '#000000';
      this.ctx.lineWidth = 1;
      this.ctx.stroke();
    }
  }

  // Export Singleton
  window.VncViewerModule = new VncViewerModule();
})(window);
