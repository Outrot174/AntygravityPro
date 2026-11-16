/**
 * ============================================================================
 * Module 2: FileExplorerWindow (Боевой Файловый Проводник)
 * Direct Real Filesystem Navigation (/storage/emulated/0/Antigravity)
 * Smart Mobile Drag & Drop with Auto-Translucent Window & Direct "+ В чат" Action
 * ============================================================================
 */

(function (window) {
  'use strict';

  class FileExplorerModule {
    constructor() {
      this.windowInstance = null;
      this.currentPath = '/storage/emulated/0/Antigravity';
      this.fileListEl = null;
      this.pathTextEl = null;
      this.isLoading = false;
    }

    open(opts = {}) {
      if (this.windowInstance && window.DesktopWindowManager.windows.has('win-file-explorer')) {
        this.windowInstance.restore();
        this.windowInstance.focus();
        return this.windowInstance;
      }

      const content = this._createDOM();
      this.windowInstance = window.DesktopWindowManager.createWindow({
        id: 'win-file-explorer',
        title: 'Файловый Проводник',
        iconSvg: '<path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/>',
        width: Math.min(window.innerWidth * 0.92, 480),
        height: Math.min(window.innerHeight * 0.58, 460),
        x: Math.max(8, (window.innerWidth - Math.min(window.innerWidth * 0.92, 480)) / 2),
        y: 50,
        content: content,
        onClose: () => {
          this.windowInstance = null;
        }
      });

      return this.windowInstance;
    }

    _createDOM() {
      const root = document.createElement('div');
      root.className = 'ag-explorer-workspace';
      root.innerHTML = `
        <div class="ag-explorer-nav-bar">
          <button class="ag-win-btn" id="agExpUp" title="На уровень вверх">
            <svg viewBox="0 0 24 24"><line x1="12" y1="19" x2="12" y2="5"/><polyline points="5 12 12 5 19 12"/></svg>
          </button>
          <input type="text" class="ag-explorer-path-text" id="agExpPathInput" value="${this.currentPath}" />
          <button class="ag-win-btn" id="agExpRefresh" title="Обновить список файлов">
            <svg id="agExpRefreshSvg" viewBox="0 0 24 24"><polyline points="23 4 23 10 17 10"/><polyline points="1 20 1 14 7 14"/><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"/></svg>
          </button>
        </div>
        <div class="ag-explorer-chips" id="agExpChips">
          <button class="ag-chip-btn" data-path="/storage/emulated/0/Antigravity">Antigravity</button>
          <button class="ag-chip-btn" data-path="/storage/emulated/0/Antigravity/программы">программы</button>
          <button class="ag-chip-btn" data-path="/storage/emulated/0/Antigravity/заметки">заметки</button>
          <button class="ag-chip-btn" data-path="/storage/emulated/0/Antigravity/песочница">песочница</button>
          <button class="ag-chip-btn" data-path="/storage/emulated/0/Antigravity/3д модели">3д модели</button>
          <button class="ag-chip-btn" data-path="/storage/emulated/0/Antigravity/промты">промты</button>
          <button class="ag-chip-btn" data-path="/storage/emulated/0/Antigravity/утилиты">утилиты</button>
        </div>
        <div class="ag-explorer-file-list" id="agExpFileList"></div>
      `;

      this.pathTextEl = root.querySelector('#agExpPathInput');
      this.fileListEl = root.querySelector('#agExpFileList');
      const refreshBtn = root.querySelector('#agExpRefresh');
      const refreshSvg = root.querySelector('#agExpRefreshSvg');

      // Toolbar Events
      root.querySelector('#agExpUp').onclick = () => this.navigateUp();

      this.pathTextEl.onkeydown = (e) => {
        if (e.key === 'Enter') {
          this.navigateTo(this.pathTextEl.value.trim());
        }
      };

      refreshBtn.onclick = async () => {
        refreshSvg.style.transition = 'transform 0.4s ease';
        refreshSvg.style.transform = 'rotate(360deg)';
        await this.loadDirectory(this.currentPath);
        setTimeout(() => {
          refreshSvg.style.transition = 'none';
          refreshSvg.style.transform = 'rotate(0deg)';
        }, 400);
      };

      // Chips navigation
      root.querySelectorAll('.ag-chip-btn').forEach(btn => {
        btn.onclick = () => this.navigateTo(btn.dataset.path);
      });

      // Initial load
      setTimeout(() => {
        this.loadDirectory(this.currentPath);
      }, 0);

      return root;
    }

    async navigateTo(path) {
      if (!path) return;
      this.currentPath = path;
      if (this.pathTextEl) this.pathTextEl.value = path;

      // Update chip states
      if (this.windowInstance && this.windowInstance.element) {
        this.windowInstance.element.querySelectorAll('.ag-chip-btn').forEach(btn => {
          btn.classList.toggle('ag-active', btn.dataset.path === path);
        });
      }

      await this.loadDirectory(path);
    }

    navigateUp() {
      if (this.currentPath === '/storage/emulated/0/Antigravity') {
        this.navigateTo('/storage/emulated/0');
        return;
      }
      if (this.currentPath === '/storage/emulated/0' || this.currentPath === '/') return;

      const parts = this.currentPath.replace(/\/$/, '').split('/');
      parts.pop();
      const parent = parts.join('/') || '/storage/emulated/0/Antigravity';
      this.navigateTo(parent);
    }

    async loadDirectory(path) {
      if (!this.fileListEl) return;
      this.fileListEl.innerHTML = '<div style="padding:14px; font-size:11px; color:#8e95a5;">Чтение каталога...</div>';

      try {
        const bridge = window.SystemBridge || window.BridgeConnector;
        const items = await bridge.listFiles(path);
        this.renderFiles(path, items);
      } catch (err) {
        this.fileListEl.innerHTML = `<div style="padding:14px; font-size:11px; color:#e06c75;">Ошибка чтения: ${err.message}</div>`;
      }
    }

    renderFiles(path, items) {
      if (!this.fileListEl) return;
      this.fileListEl.innerHTML = '';

      if (!items || items.length === 0) {
        this.fileListEl.innerHTML = '<div style="padding:14px; font-size:11px; color:#8e95a5;">(Каталог пуст)</div>';
        return;
      }

      // Sort: folders first, then alphabetical
      items.sort((a, b) => {
        if (a.isDir && !b.isDir) return -1;
        if (!a.isDir && b.isDir) return 1;
        return a.name.localeCompare(b.name);
      });

      items.forEach(item => {
        if (item.name.startsWith('.')) return; // skip dotfiles

        const fullPath = item.path || `${path.replace(/\/$/, '')}/${item.name}`;
        const entry = document.createElement('div');
        entry.className = 'ag-file-entry';

        const iconSvg = item.isDir
          ? '<path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/>'
          : '<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/>';

        entry.innerHTML = `
          <div class="ag-file-meta-left">
            <svg class="ag-file-type-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75">
              ${iconSvg}
            </svg>
            <span class="ag-file-name-label">${item.name}</span>
          </div>
          <div class="ag-file-meta-right">
            ${item.size ? `<span class="ag-file-size-label">${item.size}</span>` : ''}
            <button class="ag-file-chat-btn" title="Вставить в Чат">+ В чат</button>
          </div>
        `;

        // Direct Button "+ В чат"
        const chatBtn = entry.querySelector('.ag-file-chat-btn');
        chatBtn.onclick = (e) => {
          e.stopPropagation();
          if (window.UnifiedDragDropBus) {
            window.UnifiedDragDropBus.insertPathToChatInput(fullPath, item.name);
          }
        };

        if (item.isDir) {
          entry.onclick = () => this.navigateTo(fullPath);
        } else {
          // File click options: Preview / In Browser / In Chat
          entry.onclick = () => {
            const ext = item.name.split('.').pop().toLowerCase();
            if (['html', 'svg', 'md', 'txt', 'json', 'py', 'js', 'sh', 'css'].includes(ext)) {
              if (window.WebInspectorModule) {
                window.WebInspectorModule.open();
                window.WebInspectorModule.previewFile(fullPath);
              }
            } else {
              if (window.UnifiedDragDropBus) {
                window.UnifiedDragDropBus.insertPathToChatInput(fullPath, item.name);
              }
            }
          };

          // Touch Drag via UnifiedDragDropBus
          // Triggers translucency on FileExplorer window to reveal Chat underneath!
          let touchTimer = null;
          entry.addEventListener('pointerdown', (e) => {
            touchTimer = setTimeout(() => {
              if (window.UnifiedDragDropBus) {
                entry.classList.add('ag-dragging');
                const winEl = this.windowInstance ? this.windowInstance.element : null;
                window.UnifiedDragDropBus.startDrag({
                  path: fullPath,
                  name: item.name,
                  size: item.size,
                  isDir: false
                }, winEl, e);
              }
            }, 150);
          }, { passive: true });

          const cancelTouch = () => {
            if (touchTimer) clearTimeout(touchTimer);
          };
          entry.addEventListener('pointerup', cancelTouch);
          entry.addEventListener('pointercancel', cancelTouch);
        }

        this.fileListEl.appendChild(entry);
      });
    }
  }

  // Export Singleton
  window.FileExplorerModule = new FileExplorerModule();
})(window);
