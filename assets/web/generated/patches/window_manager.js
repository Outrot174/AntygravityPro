/**
 * ============================================================================
 * DesktopWindowManager & WindowInstance
 * Pure Multi-Window Desktop DE Engine (Quiet Luxury Architecture)
 * 100% Width Ribbon Taskbar, Zero Duplicate Buttons, Zero Tray Clutter
 * ============================================================================
 */

(function (window) {
  'use strict';

  class WindowInstance {
    constructor(manager, opts) {
      this.manager = manager;
      this.id = opts.id;
      this.title = opts.title || 'Окно';
      this.iconSvg = opts.iconSvg || '<rect x="3" y="3" width="18" height="18" rx="2" />';
      this.width = opts.width || Math.min(window.innerWidth * 0.92, 520);
      this.height = opts.height || Math.min(window.innerHeight * 0.58, 480);
      this.minWidth = opts.minWidth || 280;
      this.minHeight = opts.minHeight || 200;
      this.x = opts.x !== undefined ? opts.x : Math.max(8, (window.innerWidth - this.width) / 2);
      this.y = opts.y !== undefined ? opts.y : Math.max(16, (window.innerHeight - this.height - 56) / 2);
      this.isMaximized = false;
      this.isMinimized = false;
      this.isPinned = false;
      this.prevRect = null;
      this.onClose = opts.onClose;

      this.element = null;
      this.bodyElement = null;
      this.headerElement = null;

      this._buildDOM(opts.content);
      this._bindDragEngine();
      this._bindResizeEngine();
      this._bindFocusEngine();
    }

    _buildDOM(content) {
      const el = document.createElement('div');
      el.id = this.id;
      el.className = 'ag-window-instance';
      el.style.width = `${this.width}px`;
      el.style.height = `${this.height}px`;
      el.style.left = `${this.x}px`;
      el.style.top = `${this.y}px`;

      // Header Bar
      const header = document.createElement('div');
      header.className = 'ag-win-header';
      header.innerHTML = `
        <div class="ag-win-title-group">
          <span class="ag-win-icon">
            <svg viewBox="0 0 24 24">${this.iconSvg}</svg>
          </span>
          <span class="ag-win-title">${this.title}</span>
        </div>
        <div class="ag-win-controls">
          <button class="ag-win-btn ag-win-btn-pin" title="Поверх всех окон">
            <svg viewBox="0 0 24 24"><path d="M12 2v10m-5-6h10l-2 6H9l-2-6zm5 10v10" /></svg>
          </button>
          <button class="ag-win-btn ag-win-btn-min" title="Свернуть">
            <svg viewBox="0 0 24 24"><line x1="5" y1="12" x2="19" y2="12" /></svg>
          </button>
          <button class="ag-win-btn ag-win-btn-max" title="Развернуть">
            <svg viewBox="0 0 24 24"><rect x="5" y="5" width="14" height="14" rx="2" /></svg>
          </button>
          <button class="ag-win-btn ag-win-btn-close" title="Закрыть">
            <svg viewBox="0 0 24 24"><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
          </button>
        </div>
      `;

      // Body Area
      const body = document.createElement('div');
      body.className = 'ag-win-body';
      if (typeof content === 'string') {
        body.innerHTML = content;
      } else if (content instanceof HTMLElement) {
        body.appendChild(content);
      }

      // 8-Directional Grippers
      const grips = ['nw', 'ne', 'sw', 'se', 'n', 's', 'w', 'e'];
      grips.forEach(g => {
        const gripEl = document.createElement('div');
        gripEl.className = `ag-resize-grip ag-resize-${g}`;
        gripEl.dataset.direction = g;
        el.appendChild(gripEl);
      });

      el.appendChild(header);
      el.appendChild(body);

      this.element = el;
      this.headerElement = header;
      this.bodyElement = body;

      // Button Handlers
      header.querySelector('.ag-win-btn-pin').onclick = (e) => {
        e.stopPropagation();
        this.togglePin();
      };
      header.querySelector('.ag-win-btn-min').onclick = (e) => {
        e.stopPropagation();
        this.minimize();
      };
      header.querySelector('.ag-win-btn-max').onclick = (e) => {
        e.stopPropagation();
        this.toggleMaximize();
      };
      header.querySelector('.ag-win-btn-close').onclick = (e) => {
        e.stopPropagation();
        this.close();
      };
    }

    _bindFocusEngine() {
      this.element.addEventListener('pointerdown', () => {
        this.focus();
      }, { capture: true, passive: true });
    }

    _bindDragEngine() {
      let isDragging = false;
      let startX = 0, startY = 0;
      let initX = 0, initY = 0;
      let rafId = null;

      const onStart = (e) => {
        if (e.target.closest('.ag-win-controls')) return;
        this.focus();
        if (this.isMaximized) return;

        isDragging = true;
        const pt = e.touches ? e.touches[0] : e;
        startX = pt.clientX;
        startY = pt.clientY;
        initX = this.element.offsetLeft;
        initY = this.element.offsetTop;

        window.addEventListener('pointermove', onMove, { passive: true });
        window.addEventListener('pointerup', onEnd);
        window.addEventListener('touchmove', onMove, { passive: true });
        window.addEventListener('touchend', onEnd);
      };

      const onMove = (e) => {
        if (!isDragging) return;
        const pt = e.touches ? e.touches[0] : e;
        const dx = pt.clientX - startX;
        const dy = pt.clientY - startY;

        if (!rafId) {
          rafId = requestAnimationFrame(() => {
            let nextX = initX + dx;
            let nextY = initY + dy;

            const maxX = window.innerWidth - 60;
            const maxY = window.innerHeight - 80;
            nextX = Math.max(-this.width + 80, Math.min(maxX, nextX));
            nextY = Math.max(0, Math.min(maxY, nextY));

            this.x = nextX;
            this.y = nextY;
            this.element.style.left = `${nextX}px`;
            this.element.style.top = `${nextY}px`;
            rafId = null;
          });
        }
      };

      const onEnd = () => {
        isDragging = false;
        if (rafId) {
          cancelAnimationFrame(rafId);
          rafId = null;
        }
        window.removeEventListener('pointermove', onMove);
        window.removeEventListener('pointerup', onEnd);
        window.removeEventListener('touchmove', onMove);
        window.removeEventListener('touchend', onEnd);
      };

      this.headerElement.addEventListener('pointerdown', onStart);
      this.headerElement.addEventListener('touchstart', onStart, { passive: true });
    }

    _bindResizeEngine() {
      let isResizing = false;
      let dir = '';
      let startX = 0, startY = 0;
      let initW = 0, initH = 0;
      let initX = 0, initY = 0;
      let rafId = null;

      const onStart = (e) => {
        e.stopPropagation();
        this.focus();
        if (this.isMaximized) return;

        const grip = e.currentTarget;
        dir = grip.dataset.direction;
        isResizing = true;

        const pt = e.touches ? e.touches[0] : e;
        startX = pt.clientX;
        startY = pt.clientY;
        initW = this.element.offsetWidth;
        initH = this.element.offsetHeight;
        initX = this.element.offsetLeft;
        initY = this.element.offsetTop;

        window.addEventListener('pointermove', onMove, { passive: true });
        window.addEventListener('pointerup', onEnd);
        window.addEventListener('touchmove', onMove, { passive: true });
        window.addEventListener('touchend', onEnd);
      };

      const onMove = (e) => {
        if (!isResizing) return;
        const pt = e.touches ? e.touches[0] : e;
        const dx = pt.clientX - startX;
        const dy = pt.clientY - startY;

        if (!rafId) {
          rafId = requestAnimationFrame(() => {
            let nw = initW;
            let nh = initH;
            let nx = initX;
            let ny = initY;

            if (dir.includes('e')) nw = Math.max(this.minWidth, initW + dx);
            if (dir.includes('s')) nh = Math.max(this.minHeight, initH + dy);
            if (dir.includes('w')) {
              const diffW = Math.min(dx, initW - this.minWidth);
              nw = initW - diffW;
              nx = initX + diffW;
            }
            if (dir.includes('n')) {
              const diffH = Math.min(dy, initH - this.minHeight);
              nh = initH - diffH;
              ny = initY + diffH;
            }

            this.width = nw;
            this.height = nh;
            this.x = nx;
            this.y = ny;

            this.element.style.width = `${nw}px`;
            this.element.style.height = `${nh}px`;
            this.element.style.left = `${nx}px`;
            this.element.style.top = `${ny}px`;
            rafId = null;
          });
        }
      };

      const onEnd = () => {
        isResizing = false;
        if (rafId) {
          cancelAnimationFrame(rafId);
          rafId = null;
        }
        window.removeEventListener('pointermove', onMove);
        window.removeEventListener('pointerup', onEnd);
        window.removeEventListener('touchmove', onMove);
        window.removeEventListener('touchend', onEnd);
      };

      this.element.querySelectorAll('.ag-resize-grip').forEach(grip => {
        grip.addEventListener('pointerdown', onStart);
        grip.addEventListener('touchstart', onStart, { passive: true });
      });
    }

    focus() {
      this.manager.focusWindow(this.id);
    }

    togglePin() {
      this.isPinned = !this.isPinned;
      const btn = this.headerElement.querySelector('.ag-win-btn-pin');
      if (btn) btn.classList.toggle('ag-pinned', this.isPinned);
      this.focus();
    }

    minimize() {
      this.isMinimized = true;
      this.element.classList.add('ag-minimized');
      this.manager.onWindowStateChanged(this);
    }

    restore() {
      this.isMinimized = false;
      this.element.classList.remove('ag-minimized');
      this.focus();
      this.manager.onWindowStateChanged(this);
    }

    toggleMaximize() {
      if (!this.isMaximized) {
        this.prevRect = {
          width: this.width,
          height: this.height,
          x: this.x,
          y: this.y
        };
        this.element.style.left = '0px';
        this.element.style.top = '0px';
        this.element.style.width = '100vw';
        this.element.style.height = 'calc(100dvh - 52px)';
        this.element.style.borderRadius = '0';
        this.isMaximized = true;
      } else {
        if (this.prevRect) {
          this.x = this.prevRect.x;
          this.y = this.prevRect.y;
          this.width = this.prevRect.width;
          this.height = this.prevRect.height;
          this.element.style.left = `${this.x}px`;
          this.element.style.top = `${this.y}px`;
          this.element.style.width = `${this.width}px`;
          this.element.style.height = `${this.height}px`;
          this.element.style.borderRadius = '12px';
        }
        this.isMaximized = false;
      }
      this.focus();
    }

    close() {
      if (this.onClose) this.onClose();
      this.manager.closeWindow(this.id);
    }
  }

  class DesktopWindowManager {
    constructor() {
      this.windows = new Map();
      this.canvasElement = null;
      this.taskbarElement = null;
      this.topZ = 100;
      this.focusedWindowId = null;

      this._initDesktopLayout();
    }

    _initDesktopLayout() {
      // 1. Transparent Canvas Host for floating windows
      this.canvasElement = document.getElementById('agDesktopCanvas');
      if (!this.canvasElement) {
        this.canvasElement = document.createElement('div');
        this.canvasElement.id = 'agDesktopCanvas';
        document.body.appendChild(this.canvasElement);
      }

      // 2. Fixed Bottom Taskbar (100% width horizontal ribbon, NO right tray clutter)
      this.taskbarElement = document.getElementById('agDesktopTaskbar');
      if (!this.taskbarElement) {
        this.taskbarElement = document.createElement('div');
        this.taskbarElement.id = 'agDesktopTaskbar';
        this.taskbarElement.innerHTML = `
          <button class="ag-taskbar-btn ag-task-active" id="agTaskBtnStudio" title="Студия (Основной Чат)">
            <svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
            <span>Студия</span>
          </button>
          <button class="ag-taskbar-btn" id="agTaskBtnFiles" title="Файловый Проводник">
            <svg viewBox="0 0 24 24"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/></svg>
            <span>Файлы</span>
          </button>
          <button class="ag-taskbar-btn" id="agTaskBtnTerminal" title="Терминал ARM64">
            <svg viewBox="0 0 24 24"><polyline points="4 17 10 11 4 5"/><line x1="12" y1="19" x2="20" y2="19"/></svg>
            <span>Терминал</span>
          </button>
          <button class="ag-taskbar-btn" id="agTaskBtnBrowser" title="Встроенный Браузер">
            <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
            <span>Браузер</span>
          </button>
          <button class="ag-taskbar-btn" id="agTaskBtnVnc" title="Удаленный стол VNC">
            <svg viewBox="0 0 24 24"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>
            <span>aVNC</span>
          </button>
          <div id="agTaskbarRunningApps" style="display:flex; gap:8px; align-items:center;"></div>
        `;
        document.body.appendChild(this.taskbarElement);

        // Core Launchers Binding
        this.taskbarElement.querySelector('#agTaskBtnStudio').onclick = () => {
          if (window.CoreChatModule) window.CoreChatModule.open();
        };
        this.taskbarElement.querySelector('#agTaskBtnFiles').onclick = () => {
          this._toggleOrOpenModule('win-file-explorer', () => window.FileExplorerModule && window.FileExplorerModule.open());
        };
        this.taskbarElement.querySelector('#agTaskBtnTerminal').onclick = () => {
          this._toggleOrOpenModule('win-terminal', () => window.TerminalModule && window.TerminalModule.open());
        };
        this.taskbarElement.querySelector('#agTaskBtnBrowser').onclick = () => {
          this._toggleOrOpenModule('win-web-inspector', () => window.WebInspectorModule && window.WebInspectorModule.open());
        };
        this.taskbarElement.querySelector('#agTaskBtnVnc').onclick = () => {
          this._toggleOrOpenModule('win-vnc-viewer', () => window.VncViewerModule && window.VncViewerModule.open());
        };
      }
    }

    _toggleOrOpenModule(id, openFn) {
      if (this.windows.has(id)) {
        const win = this.windows.get(id);
        if (win.isMinimized) {
          win.restore();
        } else if (this.focusedWindowId === id) {
          win.minimize();
        } else {
          win.focus();
        }
      } else {
        if (openFn) openFn();
      }
    }

    createWindow(opts) {
      if (this.windows.has(opts.id)) {
        const existing = this.windows.get(opts.id);
        if (existing.isMinimized) existing.restore();
        existing.focus();
        return existing;
      }

      const win = new WindowInstance(this, opts);
      this.windows.set(opts.id, win);
      this.canvasElement.appendChild(win.element);
      this.focusWindow(opts.id);
      this._updateTaskbarApps();
      return win;
    }

    focusWindow(id) {
      if (!this.windows.has(id)) return;
      this.windows.forEach(w => w.element.classList.remove('ag-focused'));

      const win = this.windows.get(id);
      win.element.classList.add('ag-focused');
      this.topZ += 2;
      win.element.style.zIndex = win.isPinned ? this.topZ + 1000 : this.topZ;
      this.focusedWindowId = id;
      this._updateTaskbarApps();
    }

    closeWindow(id) {
      if (!this.windows.has(id)) return;
      const win = this.windows.get(id);
      win.element.remove();
      this.windows.delete(id);
      this._updateTaskbarApps();
    }

    onWindowStateChanged(win) {
      this._updateTaskbarApps();
    }

    _updateTaskbarApps() {
      const btnStudio = document.getElementById('agTaskBtnStudio');
      const btnFiles = document.getElementById('agTaskBtnFiles');
      const btnTerm = document.getElementById('agTaskBtnTerminal');
      const btnBw = document.getElementById('agTaskBtnBrowser');
      const btnVnc = document.getElementById('agTaskBtnVnc');

      const fileWin = this.windows.get('win-file-explorer');
      const termWin = this.windows.get('win-terminal');
      const bwWin = this.windows.get('win-web-inspector');
      const vncWin = this.windows.get('win-vnc-viewer');

      if (btnFiles) btnFiles.classList.toggle('ag-task-active', !!(fileWin && !fileWin.isMinimized && this.focusedWindowId === 'win-file-explorer'));
      if (btnTerm) btnTerm.classList.toggle('ag-task-active', !!(termWin && !termWin.isMinimized && this.focusedWindowId === 'win-terminal'));
      if (btnBw) btnBw.classList.toggle('ag-task-active', !!(bwWin && !bwWin.isMinimized && this.focusedWindowId === 'win-web-inspector'));
      if (btnVnc) btnVnc.classList.toggle('ag-task-active', !!(vncWin && !vncWin.isMinimized && this.focusedWindowId === 'win-vnc-viewer'));

      const anyActive = Array.from(this.windows.values()).some(w => !w.isMinimized);
      if (btnStudio) btnStudio.classList.toggle('ag-task-active', !anyActive);

      // Handle custom dynamic windows
      const container = document.getElementById('agTaskbarRunningApps');
      if (!container) return;
      container.innerHTML = '';

      const standardIds = new Set(['win-file-explorer', 'win-terminal', 'win-web-inspector', 'win-vnc-viewer']);
      this.windows.forEach(win => {
        if (!standardIds.has(win.id)) {
          const btn = document.createElement('button');
          btn.className = `ag-taskbar-btn ${this.focusedWindowId === win.id && !win.isMinimized ? 'ag-task-active' : ''}`;
          btn.innerHTML = `
            <svg viewBox="0 0 24 24">${win.iconSvg}</svg>
            <span>${win.title.split(' ')[0]}</span>
          `;
          btn.onclick = () => {
            if (win.isMinimized) win.restore();
            else if (this.focusedWindowId === win.id) win.minimize();
            else win.focus();
          };
          container.appendChild(btn);
        }
      });
    }
  }

  // Export Singleton
  window.DesktopWindowManager = new DesktopWindowManager();
})(window);
