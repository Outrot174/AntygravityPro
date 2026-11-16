/**
 * ============================================================================
 * Module: FileExplorerWindow (Полнофункциональный Файловый Менеджер Android)
 * Native Android Shared Storage (/storage/emulated/0) + Linux Userspace
 * Zero-Fakes: Real FS operations, Breadcrumbs, Multi-select, Intent View, Quiet Luxury
 * ============================================================================
 */

(function (window) {
  'use strict';

  class FileExplorerModule {
    constructor() {
      this.windowInstance = null;
      this.currentPath = localStorage.getItem('ag_explorer_last_path') || '/storage/emulated/0';
      this.history = [this.currentPath];
      this.historyIndex = 0;
      this.items = [];
      this.filteredItems = [];
      this.searchQuery = '';
      this.viewMode = localStorage.getItem('ag_explorer_view_mode') || 'list'; // 'list' or 'grid'
      this.sortMode = 'name-asc'; // 'name-asc', 'name-desc', 'size-desc', 'size-asc', 'date-desc'
      this.selectMode = false;
      this.selectedPaths = new Set();
      this.clipboard = null; // { action: 'copy'|'cut', items: [paths...] }
      this.isPathInputMode = false;

      this.quickLocations = [
        { name: 'Память', path: '/storage/emulated/0', icon: '📱' },
        { name: 'Загрузки', path: '/storage/emulated/0/Download', icon: '📥' },
        { name: 'Документы', path: '/storage/emulated/0/Documents', icon: '📄' },
        { name: 'DCIM', path: '/storage/emulated/0/DCIM', icon: '📷' },
        { name: 'Картинки', path: '/storage/emulated/0/Pictures', icon: '🖼' },
        { name: 'Видео', path: '/storage/emulated/0/Movies', icon: '🎬' },
        { name: 'Музыка', path: '/storage/emulated/0/Music', icon: '🎵' },
        { name: 'Antigravity', path: '/storage/emulated/0/Antigravity', icon: '🚀' },
        { name: 'Программы', path: '/storage/emulated/0/Antigravity/программы', icon: '📦' },
        { name: 'Linux', path: '/data/user/0/com.agy.pro/files/usr', icon: '🐧' },
        { name: 'Home', path: '/data/user/0/com.agy.pro/files', icon: '🏠' }
      ];
    }

    open(opts = {}) {
      if (this.windowInstance && window.DesktopWindowManager && window.DesktopWindowManager.windows.has('win-file-explorer')) {
        this.windowInstance.restore();
        this.windowInstance.focus();
        return this.windowInstance;
      }

      const content = this._createDOM();
      const winW = Math.min(window.innerWidth * 0.94, 520);
      const winH = Math.min(window.innerHeight * 0.65, 520);

      this.windowInstance = window.DesktopWindowManager.createWindow({
        id: 'win-file-explorer',
        title: 'Файлы (Проводник Android)',
        iconSvg: '<path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/>',
        width: winW,
        height: winH,
        x: Math.max(6, (window.innerWidth - winW) / 2),
        y: 42,
        content: content,
        onClose: () => {
          this.windowInstance = null;
          this._closeContextMenu();
          this._closeModal();
        }
      });

      return this.windowInstance;
    }

    _createDOM() {
      const root = document.createElement('div');
      root.className = 'ag-explorer-workspace';
      root.innerHTML = `
        <!-- Top Navigation Bar -->
        <div class="ag-explorer-nav-bar">
          <button class="ag-win-btn" id="agExpBack" title="Назад">
            <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"/></svg>
          </button>
          <button class="ag-win-btn" id="agExpForward" title="Вперед">
            <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg>
          </button>
          <button class="ag-win-btn" id="agExpUp" title="На уровень вверх">
            <svg viewBox="0 0 24 24"><line x1="12" y1="19" x2="12" y2="5"/><polyline points="5 12 12 5 19 12"/></svg>
          </button>

          <!-- Breadcrumbs Container / Path Input -->
          <div class="ag-explorer-breadcrumbs" id="agExpBreadcrumbs" title="Нажмите для перехода / редактирования пути"></div>
          <input type="text" class="ag-explorer-path-text" id="agExpPathInput" style="display:none;" value="${this.currentPath}" />

          <button class="ag-win-btn" id="agExpTogglePath" title="Ввести путь вручную">
            <svg viewBox="0 0 24 24"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
          </button>
          <button class="ag-win-btn" id="agExpSearchToggle" title="Поиск / фильтр">
            <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          </button>
          <button class="ag-win-btn" id="agExpViewToggle" title="Переключить вид (Список / Сетка)">
            <svg id="agExpViewIcon" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
          </button>
          <button class="ag-win-btn" id="agExpRefresh" title="Обновить">
            <svg id="agExpRefreshSvg" viewBox="0 0 24 24"><polyline points="23 4 23 10 17 10"/><polyline points="1 20 1 14 7 14"/><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"/></svg>
          </button>
        </div>

        <!-- Search Bar (Collapsible) -->
        <div class="ag-explorer-search-row" id="agExpSearchRow" style="display:none;">
          <input type="text" class="ag-explorer-search-input" id="agExpSearchInput" placeholder="Поиск файлов и папок в текущем каталоге..." />
          <button class="ag-win-btn" id="agExpSearchClear" title="Очистить поиск">
            <svg viewBox="0 0 24 24"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
          </button>
        </div>

        <!-- Quick Access Storage Locations Chips -->
        <div class="ag-explorer-chips" id="agExpChips">
          ${this.quickLocations.map(loc => `
            <button class="ag-chip-btn ${loc.path === this.currentPath ? 'ag-active' : ''}" data-path="${loc.path}">
              <span>${loc.icon}</span> ${loc.name}
            </button>
          `).join('')}
        </div>

        <!-- Main File List / Grid Container -->
        <div class="ag-explorer-file-list ${this.viewMode === 'grid' ? 'ag-grid-view' : ''}" id="agExpFileList"></div>

        <!-- Bottom Context Action Bar -->
        <div class="ag-explorer-action-bar" id="agExpActionBar">
          <div class="ag-action-btn-group">
            <button class="ag-action-btn" id="agExpNewFolder">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/><line x1="12" y1="11" x2="12" y2="17"/><line x1="9" y1="14" x2="15" y2="14"/></svg>
              + Папка
            </button>
            <button class="ag-action-btn" id="agExpNewFile">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><line x1="12" y1="11" x2="12" y2="17"/><line x1="9" y1="14" x2="15" y2="14"/></svg>
              + Файл
            </button>
            <button class="ag-action-btn ag-btn-primary" id="agExpPasteBtn" style="display:none;">
              📋 Вставить
            </button>
            <button class="ag-action-btn" id="agExpSelectToggle">
              ☑ Выбрать
            </button>
          </div>
          <div id="agExpItemCount" style="opacity:0.75; font-size:10px;">0 элементов</div>
        </div>

        <!-- Modal Dialog Container -->
        <div class="ag-modal-overlay" id="agExpModal" style="display:none;"></div>
      `;

      this.rootEl = root;
      this.breadcrumbsEl = root.querySelector('#agExpBreadcrumbs');
      this.pathTextEl = root.querySelector('#agExpPathInput');
      this.fileListEl = root.querySelector('#agExpFileList');
      this.searchRowEl = root.querySelector('#agExpSearchRow');
      this.searchInputEl = root.querySelector('#agExpSearchInput');
      this.itemCountEl = root.querySelector('#agExpItemCount');
      this.pasteBtnEl = root.querySelector('#agExpPasteBtn');
      this.modalEl = root.querySelector('#agExpModal');

      // Bind Toolbar events
      root.querySelector('#agExpBack').onclick = () => this.navigateBack();
      root.querySelector('#agExpForward').onclick = () => this.navigateForward();
      root.querySelector('#agExpUp').onclick = () => this.navigateUp();

      // Path Toggle / Edit
      root.querySelector('#agExpTogglePath').onclick = () => this._togglePathEditMode();

      this.pathTextEl.onkeydown = (e) => {
        if (e.key === 'Enter') {
          this._togglePathEditMode(false);
          this.navigateTo(this.pathTextEl.value.trim());
        } else if (e.key === 'Escape') {
          this._togglePathEditMode(false);
        }
      };

      // Search events
      root.querySelector('#agExpSearchToggle').onclick = () => {
        const isHidden = this.searchRowEl.style.display === 'none';
        this.searchRowEl.style.display = isHidden ? 'flex' : 'none';
        if (isHidden) this.searchInputEl.focus();
        else {
          this.searchQuery = '';
          this.searchInputEl.value = '';
          this._applyFilterAndRender();
        }
      };

      this.searchInputEl.oninput = () => {
        this.searchQuery = this.searchInputEl.value.trim().toLowerCase();
        this._applyFilterAndRender();
      };

      root.querySelector('#agExpSearchClear').onclick = () => {
        this.searchQuery = '';
        this.searchInputEl.value = '';
        this._applyFilterAndRender();
      };

      // View mode toggle
      root.querySelector('#agExpViewToggle').onclick = () => {
        this.viewMode = this.viewMode === 'list' ? 'grid' : 'list';
        localStorage.setItem('ag_explorer_view_mode', this.viewMode);
        this.fileListEl.classList.toggle('ag-grid-view', this.viewMode === 'grid');
      };

      // Refresh button
      const refreshBtn = root.querySelector('#agExpRefresh');
      const refreshSvg = root.querySelector('#agExpRefreshSvg');
      refreshBtn.onclick = async () => {
        refreshSvg.style.transition = 'transform 0.4s ease';
        refreshSvg.style.transform = 'rotate(360deg)';
        await this.loadDirectory(this.currentPath);
        setTimeout(() => {
          refreshSvg.style.transition = 'none';
          refreshSvg.style.transform = 'rotate(0deg)';
        }, 400);
      };

      // Quick Chips navigation
      root.querySelectorAll('.ag-chip-btn').forEach(btn => {
        btn.onclick = () => this.navigateTo(btn.dataset.path);
      });

      // Action Bar Buttons
      root.querySelector('#agExpNewFolder').onclick = () => this.promptCreateFolder();
      root.querySelector('#agExpNewFile').onclick = () => this.promptCreateFile();
      root.querySelector('#agExpPasteBtn').onclick = () => this.executePaste();
      root.querySelector('#agExpSelectToggle').onclick = () => this.toggleSelectMode();

      // Initial Directory Load
      setTimeout(() => {
        this.navigateTo(this.currentPath, false);
      }, 0);

      return root;
    }

    _togglePathEditMode(explicitState) {
      this.isPathInputMode = explicitState !== undefined ? explicitState : !this.isPathInputMode;
      if (this.isPathInputMode) {
        this.breadcrumbsEl.style.display = 'none';
        this.pathTextEl.style.display = 'block';
        this.pathTextEl.value = this.currentPath;
        this.pathTextEl.focus();
        this.pathTextEl.select();
      } else {
        this.pathTextEl.style.display = 'none';
        this.breadcrumbsEl.style.display = 'flex';
      }
    }

    _renderBreadcrumbs() {
      if (!this.breadcrumbsEl) return;
      this.breadcrumbsEl.innerHTML = '';

      const normalized = this.currentPath.replace(/\/+$/, '') || '/';
      const parts = normalized.split('/').filter(Boolean);

      // Root breadcrumb
      const rootCrumb = document.createElement('span');
      rootCrumb.className = 'ag-breadcrumb-crumb';
      rootCrumb.textContent = '/';
      rootCrumb.onclick = () => this.navigateTo('/');
      this.breadcrumbsEl.appendChild(rootCrumb);

      let accumulated = '';
      parts.forEach((p, idx) => {
        accumulated += '/' + p;
        const targetPath = accumulated;

        const sep = document.createElement('span');
        sep.className = 'ag-breadcrumb-sep';
        sep.textContent = '›';
        this.breadcrumbsEl.appendChild(sep);

        const crumb = document.createElement('span');
        crumb.className = 'ag-breadcrumb-crumb';
        crumb.textContent = p;
        if (idx === parts.length - 1) {
          crumb.style.color = '#fff';
          crumb.style.fontWeight = '600';
        }
        crumb.onclick = () => this.navigateTo(targetPath);
        this.breadcrumbsEl.appendChild(crumb);
      });

      // Auto scroll to right
      this.breadcrumbsEl.scrollLeft = this.breadcrumbsEl.scrollWidth;
    }

    async navigateTo(path, pushHistory = true) {
      if (!path) return;
      const cleanPath = path.replace(/\/+$/, '') || '/';
      this.currentPath = cleanPath;
      localStorage.setItem('ag_explorer_last_path', cleanPath);

      if (pushHistory) {
        if (this.historyIndex < this.history.length - 1) {
          this.history = this.history.slice(0, this.historyIndex + 1);
        }
        this.history.push(cleanPath);
        this.historyIndex = this.history.length - 1;
      }

      this._updateHistoryButtons();
      this._renderBreadcrumbs();
      if (this.pathTextEl) this.pathTextEl.value = cleanPath;

      // Update chip states
      if (this.rootEl) {
        this.rootEl.querySelectorAll('.ag-chip-btn').forEach(btn => {
          btn.classList.toggle('ag-active', btn.dataset.path === cleanPath);
        });
      }

      // Reset selection
      this.selectedPaths.clear();
      this._updateActionBar();

      await this.loadDirectory(cleanPath);
    }

    navigateBack() {
      if (this.historyIndex > 0) {
        this.historyIndex--;
        this.navigateTo(this.history[this.historyIndex], false);
      }
    }

    navigateForward() {
      if (this.historyIndex < this.history.length - 1) {
        this.historyIndex++;
        this.navigateTo(this.history[this.historyIndex], false);
      }
    }

    navigateUp() {
      if (this.currentPath === '/' || this.currentPath === '/storage/emulated/0') {
        if (this.currentPath === '/storage/emulated/0') {
          this.navigateTo('/storage');
          return;
        }
        return;
      }
      const parts = this.currentPath.split('/').filter(Boolean);
      parts.pop();
      const parent = '/' + parts.join('/');
      this.navigateTo(parent || '/');
    }

    _updateHistoryButtons() {
      if (!this.rootEl) return;
      const backBtn = this.rootEl.querySelector('#agExpBack');
      const fwdBtn = this.rootEl.querySelector('#agExpForward');
      if (backBtn) backBtn.style.opacity = this.historyIndex > 0 ? '1' : '0.35';
      if (fwdBtn) fwdBtn.style.opacity = this.historyIndex < this.history.length - 1 ? '1' : '0.35';
    }

    async loadDirectory(path) {
      if (!this.fileListEl) return;
      this.fileListEl.innerHTML = '<div style="padding:16px; font-size:11px; color:#8e95a5;">Чтение содержимого каталога...</div>';

      try {
        const bridge = window.SystemBridge || window.BridgeConnector;
        const items = await bridge.listFiles(path);
        this.items = Array.isArray(items) ? items : [];
        this._applyFilterAndRender();
      } catch (err) {
        this.fileListEl.innerHTML = `<div style="padding:16px; font-size:11px; color:#f87171;">Ошибка чтения: ${err.message || err}</div>`;
      }
    }

    _applyFilterAndRender() {
      if (!this.items) {
        this.filteredItems = [];
      } else if (!this.searchQuery) {
        this.filteredItems = [...this.items];
      } else {
        this.filteredItems = this.items.filter(item =>
          item.name.toLowerCase().includes(this.searchQuery)
        );
      }

      // Sort items: folders first, then according to sortMode
      this.filteredItems.sort((a, b) => {
        if (a.isDir && !b.isDir) return -1;
        if (!a.isDir && b.isDir) return 1;

        if (this.sortMode === 'name-desc') return b.name.localeCompare(a.name);
        if (this.sortMode === 'size-desc') return (b.sizeBytes || 0) - (a.sizeBytes || 0);
        if (this.sortMode === 'size-asc') return (a.sizeBytes || 0) - (b.sizeBytes || 0);
        if (this.sortMode === 'date-desc') return (b.lastModified || 0) - (a.lastModified || 0);
        if (this.sortMode === 'date-asc') return (a.lastModified || 0) - (b.lastModified || 0);
        return a.name.localeCompare(b.name);
      });

      this._renderItems();
      this._updateActionBar();
    }

    _renderItems() {
      if (!this.fileListEl) return;
      this.fileListEl.innerHTML = '';

      if (this.filteredItems.length === 0) {
        this.fileListEl.innerHTML = `
          <div style="padding:28px 16px; text-align:center; color:#5a6275; font-size:11px;">
            ${this.searchQuery ? 'Ничего не найдено по запросу «' + this.searchQuery + '»' : '(Каталог пуст)'}
          </div>
        `;
        return;
      }

      this.filteredItems.forEach(item => {
        if (item.name.startsWith('.') && item.name !== '.git') return; // skip system dotfiles

        const fullPath = item.path || `${this.currentPath.replace(/\/+$/, '')}/${item.name}`;
        const isSelected = this.selectedPaths.has(fullPath);

        const entry = document.createElement('div');
        entry.className = `ag-file-entry ${isSelected ? 'ag-selected' : ''}`;
        entry.dataset.path = fullPath;

        const iconSvg = this._getFileIconSvg(item);

        entry.innerHTML = `
          <div class="ag-file-meta-left">
            ${this.selectMode ? `
              <div class="ag-file-checkbox ${isSelected ? 'ag-checked' : ''}">
                ${isSelected ? '<svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3"><polyline points="20 6 9 17 4 12"/></svg>' : ''}
              </div>
            ` : ''}
            <svg class="ag-file-type-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75">
              ${iconSvg}
            </svg>
            <span class="ag-file-name-label" title="${item.name}">${item.name}</span>
          </div>
          <div class="ag-file-meta-right">
            ${item.size ? `<span class="ag-file-size-label">${item.size}</span>` : ''}
            <button class="ag-file-chat-btn" title="Вставить путь в Чат">+ В чат</button>
            <button class="ag-file-more-btn" title="Действия">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="1"/><circle cx="12" cy="5" r="1"/><circle cx="12" cy="19" r="1"/></svg>
            </button>
          </div>
        `;

        // Direct Button "+ В чат"
        const chatBtn = entry.querySelector('.ag-file-chat-btn');
        if (chatBtn) {
          chatBtn.onclick = (e) => {
            e.stopPropagation();
            if (window.UnifiedDragDropBus) {
              window.UnifiedDragDropBus.insertPathToChatInput(fullPath, item.name);
            }
          };
          chatBtn.onpointerdown = (e) => e.stopPropagation();
        }

        // Three-dots menu button (Меню трех точек — СОХРАНЕНО)
        const moreBtn = entry.querySelector('.ag-file-more-btn');
        if (moreBtn) {
          moreBtn.onclick = (e) => {
            e.stopPropagation();
            this.openContextMenu(e, item, fullPath);
          };
          moreBtn.onpointerdown = (e) => e.stopPropagation();
        }

        // ====================================================================
        // Drag & Drop into Chat (Pointer & Touch Engine)
        // ====================================================================
        entry.setAttribute('draggable', 'true');

        let isDragging = false;
        let dragTimer = null;
        let startX = 0;
        let startY = 0;
        let moved = false;

        const onPointerDown = (e) => {
          if (this.selectMode || e.button === 2) return;
          startX = e.clientX;
          startY = e.clientY;
          moved = false;
          isDragging = false;

          // Drag timer: if user holds for 150ms or moves, start drag into Chat
          dragTimer = setTimeout(() => {
            if (window.UnifiedDragDropBus) {
              isDragging = true;
              entry.classList.add('ag-dragging');
              const winEl = this.windowInstance ? this.windowInstance.element : null;
              window.UnifiedDragDropBus.startDrag({
                path: fullPath,
                name: item.name,
                size: item.size,
                isDir: item.isDir
              }, winEl, e);
            }
          }, 150);
        };

        const onPointerMove = (e) => {
          if (!dragTimer && !isDragging) return;
          const dist = Math.hypot(e.clientX - startX, e.clientY - startY);
          if (dist > 8) {
            moved = true;
            if (!isDragging && window.UnifiedDragDropBus) {
              if (dragTimer) {
                clearTimeout(dragTimer);
                dragTimer = null;
              }
              isDragging = true;
              entry.classList.add('ag-dragging');
              const winEl = this.windowInstance ? this.windowInstance.element : null;
              window.UnifiedDragDropBus.startDrag({
                path: fullPath,
                name: item.name,
                size: item.size,
                isDir: item.isDir
              }, winEl, e);
            }
          }
        };

        const onPointerEnd = () => {
          if (dragTimer) {
            clearTimeout(dragTimer);
            dragTimer = null;
          }
          if (isDragging) {
            setTimeout(() => {
              isDragging = false;
              moved = false;
            }, 60);
          }
        };

        entry.addEventListener('pointerdown', onPointerDown, { passive: true });
        entry.addEventListener('pointermove', onPointerMove, { passive: true });
        entry.addEventListener('pointerup', onPointerEnd, { passive: true });
        entry.addEventListener('pointercancel', onPointerEnd, { passive: true });

        // HTML5 Drag support (mouse / trackpad)
        entry.addEventListener('dragstart', (e) => {
          if (this.selectMode) { e.preventDefault(); return; }
          e.dataTransfer.setData('text/plain', `@${fullPath} `);
          e.dataTransfer.setData('application/x-antigravity-path', fullPath);
          e.dataTransfer.effectAllowed = 'copy';
          if (window.UnifiedDragDropBus) {
            const winEl = this.windowInstance ? this.windowInstance.element : null;
            window.UnifiedDragDropBus.startDrag({
              path: fullPath,
              name: item.name,
              size: item.size,
              isDir: item.isDir
            }, winEl, e);
          }
        });

        // Right-click context menu (Меню трех точек)
        entry.oncontextmenu = (e) => {
          e.preventDefault();
          this.openContextMenu(e, item, fullPath);
        };

        // Entry Click Handling (only if not dragged or moved)
        entry.onclick = (e) => {
          if (moved || isDragging) return;

          if (this.selectMode) {
            this.toggleSelectItem(fullPath);
            return;
          }

          if (item.isDir) {
            this.navigateTo(fullPath);
          } else {
            this.openFile(fullPath, item.name);
          }
        };

        this.fileListEl.appendChild(entry);
      });
    }

    _getFileIconSvg(item) {
      if (item.isDir) {
        return '<path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/>';
      }
      const ext = (item.name.split('.').pop() || '').toLowerCase();
      if (['jpg', 'jpeg', 'png', 'webp', 'gif', 'svg'].includes(ext)) {
        return '<rect x="3" y="3" width="18" height="18" rx="2" ry="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/>';
      }
      if (['mp4', 'mkv', 'webm', 'mov'].includes(ext)) {
        return '<rect x="2" y="2" width="20" height="20" rx="2.18" ry="2.18"/><line x1="7" y1="2" x2="7" y2="22"/><line x1="17" y1="2" x2="17" y2="22"/><line x1="2" y1="12" x2="22" y2="12"/><line x1="2" y1="7" x2="7" y2="7"/><line x1="2" y1="17" x2="7" y2="17"/><line x1="17" y1="17" x2="22" y2="17"/><line x1="17" y1="7" x2="22" y2="7"/>';
      }
      if (['mp3', 'wav', 'ogg', 'flac'].includes(ext)) {
        return '<path d="M9 18V5l12-2v13"/><circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/>';
      }
      if (['zip', 'rar', 'tar', 'gz', '7z', 'apk'].includes(ext)) {
        return '<polyline points="21 8 21 21 3 21 3 8"/><rect x="1" y="3" width="22" height="5"/><line x1="10" y1="12" x2="14" y2="12"/>';
      }
      if (['pdf'].includes(ext)) {
        return '<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="9" y1="15" x2="15" y2="15"/>';
      }
      if (['py', 'js', 'json', 'html', 'css', 'sh', 'java', 'kt', 'xml', 'md'].includes(ext)) {
        return '<polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/>';
      }
      return '<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/>';
    }

    toggleSelectMode() {
      this.selectMode = !this.selectMode;
      this.selectedPaths.clear();
      const btn = this.rootEl.querySelector('#agExpSelectToggle');
      if (btn) btn.textContent = this.selectMode ? 'Отмена' : '☑ Выбрать';
      this._renderItems();
      this._updateActionBar();
    }

    toggleSelectItem(fullPath) {
      if (this.selectedPaths.has(fullPath)) this.selectedPaths.delete(fullPath);
      else this.selectedPaths.add(fullPath);
      this._renderItems();
      this._updateActionBar();
    }

    _updateActionBar() {
      if (!this.itemCountEl) return;
      const totalDirs = this.filteredItems.filter(i => i.isDir).length;
      const totalFiles = this.filteredItems.filter(i => !i.isDir).length;

      if (this.selectedPaths.size > 0) {
        this.itemCountEl.textContent = `Выбрано: ${this.selectedPaths.size} из ${this.filteredItems.length}`;
      } else {
        this.itemCountEl.textContent = `${totalFiles} файлов · ${totalDirs} папок`;
      }

      // Paste button state
      if (this.pasteBtnEl) {
        if (this.clipboard && this.clipboard.items.length > 0) {
          this.pasteBtnEl.style.display = 'flex';
          this.pasteBtnEl.textContent = `📋 Вставить (${this.clipboard.items.length})`;
        } else {
          this.pasteBtnEl.style.display = 'none';
        }
      }
    }

    // ==========================================
    // File Operations: Create, Delete, Rename, etc.
    // ==========================================

    promptCreateFolder() {
      this._showModal({
        title: 'Новая папка',
        bodyHtml: `
          <div style="font-size:11px; color:#8e95a5;">Создать каталог в: ${this.currentPath}</div>
          <input type="text" class="ag-modal-input" id="agModalInput" placeholder="Имя папки" autofocus />
        `,
        confirmText: 'Создать',
        onConfirm: async () => {
          const input = this.modalEl.querySelector('#agModalInput');
          const name = input ? input.value.trim() : '';
          if (!name) return;
          const target = `${this.currentPath.replace(/\/+$/, '')}/${name}`;
          const bridge = window.SystemBridge || window.BridgeConnector;
          await bridge.createFolder(target);
          this._closeModal();
          await this.loadDirectory(this.currentPath);
        }
      });
    }

    promptCreateFile() {
      this._showModal({
        title: 'Новый файл',
        bodyHtml: `
          <div style="font-size:11px; color:#8e95a5;">Создать файл в: ${this.currentPath}</div>
          <input type="text" class="ag-modal-input" id="agModalInput" placeholder="Имя файла (напр. notes.txt)" autofocus />
        `,
        confirmText: 'Создать',
        onConfirm: async () => {
          const input = this.modalEl.querySelector('#agModalInput');
          const name = input ? input.value.trim() : '';
          if (!name) return;
          const target = `${this.currentPath.replace(/\/+$/, '')}/${name}`;
          const bridge = window.SystemBridge || window.BridgeConnector;
          await bridge.createFile(target, '');
          this._closeModal();
          await this.loadDirectory(this.currentPath);
        }
      });
    }

    promptRename(fullPath, currentName) {
      this._showModal({
        title: 'Переименовать',
        bodyHtml: `
          <div style="font-size:11px; color:#8e95a5;">Текущее имя: ${currentName}</div>
          <input type="text" class="ag-modal-input" id="agModalInput" value="${currentName}" autofocus />
        `,
        confirmText: 'Сохранить',
        onConfirm: async () => {
          const input = this.modalEl.querySelector('#agModalInput');
          const newName = input ? input.value.trim() : '';
          if (!newName || newName === currentName) {
            this._closeModal();
            return;
          }
          const parent = fullPath.substring(0, fullPath.lastIndexOf('/'));
          const target = `${parent}/${newName}`;
          const bridge = window.SystemBridge || window.BridgeConnector;
          await bridge.renameItem(fullPath, target);
          this._closeModal();
          await this.loadDirectory(this.currentPath);
        }
      });
    }

    confirmDelete(paths) {
      const list = Array.isArray(paths) ? paths : [paths];
      if (list.length === 0) return;

      this._showModal({
        title: 'Удаление файлов',
        bodyHtml: `
          <div style="color:#f87171; font-weight:600; font-size:12px;">Вы действительно хотите удалить ${list.length} элемент(ов)?</div>
          <div style="font-size:11px; color:#8e95a5; max-height:100px; overflow-y:auto; font-family:var(--ag-font-mono);">
            ${list.map(p => `• ${p.split('/').pop()}`).join('<br/>')}
          </div>
          <div style="font-size:10px; color:#e06c75;">Это действие нельзя отменить на устройстве.</div>
        `,
        confirmText: 'Удалить навсегда',
        confirmClass: 'ag-btn-danger',
        onConfirm: async () => {
          const bridge = window.SystemBridge || window.BridgeConnector;
          for (const p of list) {
            await bridge.deleteItem(p);
          }
          this._closeModal();
          this.selectedPaths.clear();
          await this.loadDirectory(this.currentPath);
        }
      });
    }

    copyToClipboard(paths, action = 'copy') {
      const list = Array.isArray(paths) ? paths : [paths];
      if (list.length === 0) return;
      this.clipboard = { action, items: list };
      this._updateActionBar();
    }

    async executePaste() {
      if (!this.clipboard || this.clipboard.items.length === 0) return;
      const bridge = window.SystemBridge || window.BridgeConnector;
      const { action, items } = this.clipboard;

      for (const src of items) {
        const name = src.split('/').pop();
        const dst = `${this.currentPath.replace(/\/+$/, '')}/${name}`;
        if (action === 'cut') {
          await bridge.moveItem(src, dst);
        } else {
          await bridge.copyItem(src, dst);
        }
      }

      if (action === 'cut') {
        this.clipboard = null;
      }
      this._updateActionBar();
      await this.loadDirectory(this.currentPath);
    }

    async showProperties(fullPath) {
      const bridge = window.SystemBridge || window.BridgeConnector;
      const stats = await bridge.getFileStats(fullPath);
      const name = fullPath.split('/').pop();

      this._showModal({
        title: `Свойства: ${name}`,
        bodyHtml: `
          <div style="display:flex; flex-direction:column; gap:6px; font-family:var(--ag-font-mono); font-size:11px;">
            <div><b style="color:#8e95a5;">Имя:</b> ${name}</div>
            <div><b style="color:#8e95a5;">Путь:</b> <span style="word-break:break-all;">${fullPath}</span></div>
            <div><b style="color:#8e95a5;">Тип:</b> ${stats ? stats.typeStr : (fullPath.includes('.') ? 'Файл' : 'Каталог')}</div>
            <div><b style="color:#8e95a5;">Размер:</b> ${stats ? bridge._formatSize(stats.sizeBytes, stats.isDir) + ' (' + stats.sizeBytes + ' байт)' : 'Неизвестно'}</div>
            <div><b style="color:#8e95a5;">Изменен:</b> ${stats && stats.lastModified ? new Date(stats.lastModified).toLocaleString() : 'Неизвестно'}</div>
            <div><b style="color:#8e95a5;">Права:</b> ${stats ? stats.permissions : '0755'}</div>
          </div>
        `,
        confirmText: 'Закрыть',
        onConfirm: () => this._closeModal()
      });
    }

    async openFile(fullPath, name) {
      const ext = (name.split('.').pop() || '').toLowerCase();
      const bridge = window.SystemBridge || window.BridgeConnector;

      // Text/Code files preview
      if (['txt', 'log', 'json', 'py', 'js', 'sh', 'md', 'html', 'css', 'xml', 'yml', 'yaml'].includes(ext)) {
        const content = await bridge.readFile(fullPath);
        this._showModal({
          title: `Просмотр: ${name}`,
          bodyHtml: `
            <textarea readonly style="width:100%; height:240px; background:#0b0c0e; color:#eceef2; font-family:var(--ag-font-mono); font-size:10px; border:1px solid var(--ag-border-subtle); border-radius:6px; padding:8px; outline:none; resize:none;">${content ? content.replace(/</g, '&lt;') : ''}</textarea>
          `,
          confirmText: 'Открыть во внешнем приложении',
          onConfirm: () => {
            bridge.openFileExternal(fullPath);
            this._closeModal();
          }
        });
        return;
      }

      // Image files preview
      if (['jpg', 'jpeg', 'png', 'webp', 'gif', 'svg'].includes(ext)) {
        this._showModal({
          title: `Изображение: ${name}`,
          bodyHtml: `
            <div style="text-align:center; padding:10px;">
              <img src="file://${fullPath}" style="max-width:100%; max-height:220px; border-radius:6px; border:1px solid var(--ag-border-subtle);" onerror="this.src=''; this.alt='(Предпросмотр недоступен прямо в webview)';" />
              <div style="margin-top:8px; font-size:10px; color:#8e95a5;">${fullPath}</div>
            </div>
          `,
          confirmText: 'Открыть в галерее Android',
          onConfirm: () => {
            bridge.openFileExternal(fullPath);
            this._closeModal();
          }
        });
        return;
      }

      // Default: Launch compatible Android App via Intent
      await bridge.openFileExternal(fullPath);
    }

    // ==========================================
    // Context Menu & Modal Helpers
    // ==========================================

    openContextMenu(e, item, fullPath) {
      this._closeContextMenu();

      const menu = document.createElement('div');
      menu.className = 'ag-context-menu';
      menu.id = 'agExpContextMenu';

      menu.innerHTML = `
        <button class="ag-context-menu-item" data-action="open">↗ ${item.isDir ? 'Открыть папку' : 'Открыть файл'}</button>
        <button class="ag-context-menu-item" data-action="chat">💬 Вставить путь в Чат</button>
        <div class="ag-context-menu-sep"></div>
        <button class="ag-context-menu-item" data-action="copy">📋 Копировать</button>
        <button class="ag-context-menu-item" data-action="cut">✂ Вырезать</button>
        <button class="ag-context-menu-item" data-action="rename">✏ Переименовать</button>
        <div class="ag-context-menu-sep"></div>
        <button class="ag-context-menu-item" data-action="props">ℹ Свойства</button>
        <button class="ag-context-menu-item ag-danger" data-action="delete">🗑 Удалить</button>
      `;

      // Position Context Menu
      const x = Math.min(e.clientX || 50, window.innerWidth - 180);
      const y = Math.min(e.clientY || 100, window.innerHeight - 240);
      menu.style.left = `${Math.max(10, x)}px`;
      menu.style.top = `${Math.max(10, y)}px`;

      menu.querySelectorAll('.ag-context-menu-item').forEach(btn => {
        btn.onclick = () => {
          const action = btn.dataset.action;
          this._closeContextMenu();
          if (action === 'open') {
            if (item.isDir) this.navigateTo(fullPath);
            else this.openFile(fullPath, item.name);
          } else if (action === 'chat') {
            if (window.UnifiedDragDropBus) {
              window.UnifiedDragDropBus.insertPathToChatInput(fullPath, item.name);
            }
          } else if (action === 'copy') {
            this.copyToClipboard(fullPath, 'copy');
          } else if (action === 'cut') {
            this.copyToClipboard(fullPath, 'cut');
          } else if (action === 'rename') {
            this.promptRename(fullPath, item.name);
          } else if (action === 'props') {
            this.showProperties(fullPath);
          } else if (action === 'delete') {
            this.confirmDelete(fullPath);
          }
        };
      });

      document.body.appendChild(menu);

      // Dismiss listener
      const dismiss = (ev) => {
        if (!menu.contains(ev.target)) {
          this._closeContextMenu();
          document.removeEventListener('pointerdown', dismiss);
        }
      };
      setTimeout(() => document.addEventListener('pointerdown', dismiss), 10);
    }

    _closeContextMenu() {
      const existing = document.getElementById('agExpContextMenu');
      if (existing) existing.remove();
    }

    _showModal({ title, bodyHtml, confirmText = 'OK', confirmClass = 'ag-btn-primary', onConfirm }) {
      if (!this.modalEl) return;
      this.modalEl.style.display = 'flex';
      this.modalEl.innerHTML = `
        <div class="ag-modal-box">
          <div class="ag-modal-header">
            <span>${title}</span>
            <button class="ag-win-btn" id="agModalClose">✕</button>
          </div>
          <div class="ag-modal-body">
            ${bodyHtml}
          </div>
          <div class="ag-modal-footer">
            <button class="ag-action-btn" id="agModalCancel">Отмена</button>
            <button class="ag-action-btn ${confirmClass}" id="agModalConfirm">${confirmText}</button>
          </div>
        </div>
      `;

      this.modalEl.querySelector('#agModalClose').onclick = () => this._closeModal();
      this.modalEl.querySelector('#agModalCancel').onclick = () => this._closeModal();
      const confirmBtn = this.modalEl.querySelector('#agModalConfirm');
      if (confirmBtn && onConfirm) {
        confirmBtn.onclick = onConfirm;
      }

      // Enter key handler
      const input = this.modalEl.querySelector('.ag-modal-input');
      if (input) {
        input.onkeydown = (e) => {
          if (e.key === 'Enter' && onConfirm) onConfirm();
          else if (e.key === 'Escape') this._closeModal();
        };
        setTimeout(() => input.focus(), 50);
      }
    }

    _closeModal() {
      if (this.modalEl) {
        this.modalEl.style.display = 'none';
        this.modalEl.innerHTML = '';
      }
    }
  }

  // Export Singleton
  window.FileExplorerModule = new FileExplorerModule();
})(window);
