/**
 * ============================================================================
 * Module 3: TerminalWindow (Боевой Плавающий Linux/Android Терминал)
 * Real Shell Execution on Qualcomm Snapdragon 8 Elite (SM8750 ARM64)
 * PTY WebSocket + Direct SystemBridge.exec() with Working Directory Tracking
 * ============================================================================
 */

(function (window) {
  'use strict';

  class TerminalModule {
    constructor() {
      this.windowInstance = null;
      this.outputContainer = null;
      this.inputElement = null;
      this.statusBadgeEl = null;
      this.pwdEl = null;
      this.ws = null;
      this.commandHistory = [];
      this.historyIndex = -1;
      this.workingDir = '/storage/emulated/0/Antigravity';
    }

    open(opts = {}) {
      if (this.windowInstance && window.DesktopWindowManager.windows.has('win-terminal')) {
        this.windowInstance.restore();
        this.windowInstance.focus();
        return this.windowInstance;
      }

      const content = this._createDOM();
      this.windowInstance = window.DesktopWindowManager.createWindow({
        id: 'win-terminal',
        title: 'Терминал ARM64',
        iconSvg: '<polyline points="4 17 10 11 4 5"/><line x1="12" y1="19" x2="20" y2="19"/>',
        width: Math.min(window.innerWidth * 0.94, 560),
        height: Math.min(window.innerHeight * 0.58, 440),
        x: Math.max(8, (window.innerWidth - Math.min(window.innerWidth * 0.94, 560)) / 2),
        y: 45,
        content: content,
        onClose: () => {
          if (this.ws) {
            try { this.ws.close(); } catch (_) {}
            this.ws = null;
          }
          this.windowInstance = null;
          this.outputContainer = null;
          this.inputElement = null;
        }
      });

      // Register Drop-Target for UnifiedDragDropBus
      if (window.UnifiedDragDropBus) {
        window.UnifiedDragDropBus.registerDropTarget(this.windowInstance.bodyElement, (payload) => {
          this.insertPath(payload.path);
        });
      }

      // Connect to PTY if available
      this._initPtySocket();

      return this.windowInstance;
    }

    _createDOM() {
      const root = document.createElement('div');
      root.className = 'ag-terminal-workspace';
      root.style.cssText = 'display:flex; flex-direction:column; height:100%; background:#090a0d; font-family:var(--ag-font-mono); font-size:11px; color:#eceef2; padding:8px 10px; overflow:hidden;';
      root.innerHTML = `
        <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #1a1d24; padding-bottom:6px; margin-bottom:6px;">
          <div style="display:flex; align-items:center; gap:6px;">
            <span style="color:#5a6275; font-size:10px;">SHELL // ARM64</span>
            <span id="agTermStatusBadge" style="font-size:9px; padding:2px 6px; border-radius:4px; background:rgba(255,255,255,0.06); color:#8e95a5;">Native Bridge</span>
          </div>
          <div style="display:flex; gap:4px;">
            <button class="ag-chip-btn" id="agTermBtnLs" style="font-size:9px;">ls -la</button>
            <button class="ag-chip-btn" id="agTermBtnPwd" style="font-size:9px;">pwd</button>
            <button class="ag-chip-btn" id="agTermBtnUname" style="font-size:9px;">uname -a</button>
            <button class="ag-chip-btn" id="agTermBtnClear" style="font-size:9px;">clear</button>
          </div>
        </div>
        <div class="ag-term-output" id="agTermOutput" style="flex:1; overflow-y:auto; line-height:1.45; white-space:pre-wrap; word-break:break-all; font-family:var(--ag-font-mono); font-size:11px;">
<span style="color:#5a6275;">[Antigravity Linux Userspace Native Shell - POCO F7 Ultra SM8750]</span>
<span style="color:#8e95a5;">Prefix: /data/user/0/com.agy.pro/files/usr/bin</span>
<span style="color:#8e95a5;">Готов к вводу команд или перетаскиванию файлов из Проводника.</span>
</div>
        <div style="display:flex; align-items:center; gap:6px; margin-top:6px; border-top:1px solid #1a1d24; padding-top:6px;">
          <span style="color:#34d399; font-weight:600;">agy@poco:</span><span style="color:#60a5fa;" id="agTermPwdLabel">~/Antigravity</span><span style="color:#eceef2;">$</span>
          <input type="text" id="agTermInput" autocomplete="off" spellcheck="false" style="flex:1; background:transparent; border:none; outline:none; color:#eceef2; font-family:var(--ag-font-mono); font-size:11px;" />
        </div>
      `;

      this.outputContainer = root.querySelector('#agTermOutput');
      this.inputElement = root.querySelector('#agTermInput');
      this.statusBadgeEl = root.querySelector('#agTermStatusBadge');
      this.pwdEl = root.querySelector('#agTermPwdLabel');

      // Quick Action Buttons
      root.querySelector('#agTermBtnLs').onclick = () => this.dispatchCommand('ls -la');
      root.querySelector('#agTermBtnPwd').onclick = () => this.dispatchCommand('pwd');
      root.querySelector('#agTermBtnUname').onclick = () => this.dispatchCommand('id && uname -a');
      root.querySelector('#agTermBtnClear').onclick = () => {
        if (this.outputContainer) this.outputContainer.innerHTML = '';
      };

      // Input Event
      this.inputElement.addEventListener('keydown', (e) => {
        if (e.key === 'Enter') {
          e.preventDefault();
          const cmd = this.inputElement.value.trim();
          if (cmd) {
            this.commandHistory.push(cmd);
            this.historyIndex = this.commandHistory.length;
            this.dispatchCommand(cmd);
          }
          this.inputElement.value = '';
        } else if (e.key === 'ArrowUp') {
          e.preventDefault();
          if (this.historyIndex > 0) {
            this.historyIndex--;
            this.inputElement.value = this.commandHistory[this.historyIndex] || '';
          }
        } else if (e.key === 'ArrowDown') {
          e.preventDefault();
          if (this.historyIndex < this.commandHistory.length - 1) {
            this.historyIndex++;
            this.inputElement.value = this.commandHistory[this.historyIndex] || '';
          } else {
            this.historyIndex = this.commandHistory.length;
            this.inputElement.value = '';
          }
        }
      });

      root.addEventListener('click', () => {
        if (this.inputElement) this.inputElement.focus();
      });

      return root;
    }

    _initPtySocket() {
      const port = (window.SystemBridge && window.SystemBridge.getEnginePort()) || 45170;
      const wsUrl = `ws://127.0.0.1:${port}/pty`;

      try {
        const ws = new WebSocket(wsUrl);
        ws.onopen = () => {
          this.ws = ws;
          if (this.statusBadgeEl) {
            this.statusBadgeEl.textContent = `PTY :${port} (ONLINE)`;
            this.statusBadgeEl.style.color = '#34d399';
            this.statusBadgeEl.style.background = 'rgba(52,211,153,0.1)';
          }
        };
        ws.onmessage = (event) => {
          this.printRaw(event.data);
        };
        ws.onerror = () => {
          if (this.statusBadgeEl) {
            this.statusBadgeEl.textContent = 'Native execShell (Direct)';
          }
        };
        ws.onclose = () => {
          this.ws = null;
        };
      } catch (_) {
        if (this.statusBadgeEl) {
          this.statusBadgeEl.textContent = 'Native execShell (Direct)';
        }
      }
    }

    insertPath(filePath) {
      if (!this.inputElement) return;
      const escaped = `"${filePath}" `;
      this.inputElement.value = (this.inputElement.value ? this.inputElement.value + ' ' : '') + escaped;
      this.inputElement.focus();
    }

    async dispatchCommand(cmd) {
      this.printLine(`\nagy@poco:${this._formatPwd(this.workingDir)}$ ${cmd}`);

      if (cmd === 'clear') {
        if (this.outputContainer) this.outputContainer.innerHTML = '';
        return;
      }

      // Handle directory changes locally
      if (cmd.startsWith('cd ') || cmd === 'cd') {
        const target = cmd === 'cd' ? '/storage/emulated/0/Antigravity' : cmd.substring(3).trim();
        let nextDir = target;
        if (!nextDir.startsWith('/')) {
          nextDir = `${this.workingDir}/${nextDir}`;
        }
        // Normalize
        const bridge = window.SystemBridge || window.BridgeConnector;
        const res = await bridge.exec(`cd "${nextDir}" && pwd 2>/dev/null`);
        if (res && res.trim() && !res.includes('No such') && !res.includes('Error')) {
          this.workingDir = res.trim();
          if (this.pwdEl) this.pwdEl.textContent = this._formatPwd(this.workingDir);
        } else {
          this.printLine(`cd: ${target}: No such file or directory`);
        }
        return;
      }

      // Send to WebSocket PTY if open
      if (this.ws && this.ws.readyState === WebSocket.OPEN) {
        this.ws.send(cmd + '\n');
        return;
      }

      // Real execution via SystemBridge
      try {
        const bridge = window.SystemBridge || window.BridgeConnector;
        const fullCmd = `cd "${this.workingDir}" && ${cmd}`;
        const output = await bridge.exec(fullCmd);
        if (output) {
          this.printRaw(output);
        }
      } catch (err) {
        this.printLine(`[shell error]: ${err.message}`);
      }

      if (this.outputContainer) {
        this.outputContainer.scrollTop = this.outputContainer.scrollHeight;
      }
    }

    _formatPwd(dir) {
      if (dir === '/storage/emulated/0/Antigravity') return '~/Antigravity';
      if (dir.startsWith('/storage/emulated/0/Antigravity/')) {
        return '~/' + dir.replace('/storage/emulated/0/Antigravity/', '');
      }
      return dir;
    }

    printLine(text) {
      if (!this.outputContainer) return;
      const el = document.createElement('div');
      el.textContent = text;
      this.outputContainer.appendChild(el);
      this.outputContainer.scrollTop = this.outputContainer.scrollHeight;
    }

    printRaw(text) {
      if (!this.outputContainer) return;
      const el = document.createElement('span');
      el.textContent = text;
      this.outputContainer.appendChild(el);
      this.outputContainer.scrollTop = this.outputContainer.scrollHeight;
    }
  }

  // Export Singleton
  window.TerminalModule = new TerminalModule();
})(window);
