/**
 * ============================================================================
 * Module 4: WebInspectorModule (AGY Pro v2.4.1 — Genuine Native Android Browser)
 * Direct Native Android WebView Integration via AndroidBridge & NativeBrowserManager
 * ZERO MOCKS: Real Chromium engine, real native cookies, real hardware rendering, real DOM
 * ============================================================================
 */

(function (window) {
  'use strict';

  class WebInspectorModule {
    constructor() {
      this.windowInstance = null;
      this.currentUrl = 'https://duckduckgo.com';
      this.containerElement = null;
      this.inputElement = null;
      this.progressBar = null;
      this.backBtn = null;
      this.forwardBtn = null;
      this.reloadBtn = null;
      this.stopBtn = null;
      this.homeBtn = null;
      this.isLoading = false;
      this.nativeSupported = false;
      this._pollBoundsTimer = null;
      this._setupNativeBridge();
    }

    _getBridge() {
      return window.AndroidBridge || window.DesktopNativeBridge || window.Android || null;
    }

    _isNativeSupported() {
      const b = this._getBridge();
      return !!(b && typeof b.openNativeBrowser === 'function');
    }

    _setupNativeBridge() {
      window.NativeBrowserBridge = {
        onNativeEvent: (data) => {
          if (!data || typeof data !== 'object') return;

          if (data.url && data.url !== 'about:blank') {
            this.currentUrl = data.url;
            if (this.inputElement && document.activeElement !== this.inputElement) {
              this.inputElement.value = data.url;
            }
          }

          if (data.title && this.windowInstance) {
            this.windowInstance.setTitle(`Браузер — ${data.title}`);
          }

          if (data.progress !== undefined) {
            this._setProgress(data.progress, !!data.loading);
          }

          if (data.canBack !== undefined || data.canForward !== undefined) {
            this._updateNavButtons(data.canBack, data.canForward);
          }

          if (data.event === 'onReceivedError') {
            if (window.showSystemToast) {
              window.showSystemToast('Ошибка соединения');
            }
          }
        }
      };
    }

    open(opts = {}) {
      const targetUrl = opts.url || this.currentUrl;
      this.nativeSupported = this._isNativeSupported();

      if (this.windowInstance && window.DesktopWindowManager && window.DesktopWindowManager.windows.has('win-web-inspector')) {
        this.windowInstance.restore();
        this.windowInstance.focus();
        this._syncNativeBounds();
        this._setNativeVisible(true);
        if (opts.url && opts.url !== this.currentUrl) {
          this.navigateTo(opts.url);
        }
        return this.windowInstance;
      }

      const content = this._createDOM(targetUrl);
      this.windowInstance = window.DesktopWindowManager.createWindow({
        id: 'win-web-inspector',
        title: 'Встроенный Браузер (Native Engine)',
        iconSvg: '<circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>',
        width: Math.min(window.innerWidth * 0.94, 620),
        height: Math.min(window.innerHeight * 0.72, 580),
        x: Math.max(8, (window.innerWidth - Math.min(window.innerWidth * 0.94, 620)) / 2),
        y: 42,
        content: content,
        onClose: () => {
          this._stopBoundsTracking();
          this._closeNative();
          this.windowInstance = null;
          this.containerElement = null;
          this.inputElement = null;
          this.progressBar = null;
        }
      });

      // Hook Window Manager State (Minimize, Restore, Move, Resize)
      this._hookWindowLifecycle();

      // Launch Native WebView after window is painted in DOM
      requestAnimationFrame(() => {
        this._openNative(targetUrl);
        this._startBoundsTracking();
      });

      return this.windowInstance;
    }

    _createDOM(initialUrl) {
      const root = document.createElement('div');
      root.className = 'ag-browser-workspace';
      root.style.cssText = 'display:flex; flex-direction:column; height:100%; width:100%; background:var(--ag-surface-dark); user-select:none; position:relative; overflow:hidden;';

      root.innerHTML = `
        <!-- Navigation Toolbar -->
        <div class="ag-browser-nav-bar" style="height:38px; min-height:38px; display:flex; align-items:center; gap:5px; padding:0 8px; background:var(--ag-surface-header); border-bottom:1px solid var(--ag-border-subtle); z-index:20;">
          <button class="ag-win-btn" id="agBwBack" title="Назад" style="opacity:0.4; pointer-events:none;">
            <svg viewBox="0 0 24 24"><line x1="19" y1="12" x2="5" y2="12"/><polyline points="12 19 5 12 12 5"/></svg>
          </button>
          <button class="ag-win-btn" id="agBwForward" title="Вперед" style="opacity:0.4; pointer-events:none;">
            <svg viewBox="0 0 24 24"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </button>
          <button class="ag-win-btn" id="agBwReload" title="Обновить">
            <svg viewBox="0 0 24 24" id="agBwReloadIcon"><polyline points="23 4 23 10 17 10"/><polyline points="1 20 1 14 7 14"/><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"/></svg>
          </button>
          <button class="ag-win-btn" id="agBwHome" title="Главная">
            <svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
          </button>
          
          <!-- Omnibar / Address Input -->
          <div style="flex:1; display:flex; align-items:center; position:relative; min-width:0;">
            <input type="text" class="ag-browser-url-input" id="agBwInput" value="${initialUrl}" placeholder="Поиск в интернете или веб-адрес..."
              style="width:100%; background:rgba(0,0,0,0.45); border:1px solid var(--ag-border-subtle); border-radius:6px; padding:5px 8px 5px 26px; color:var(--ag-text-primary); font-family:var(--ag-font-mono); font-size:11px; outline:none;" />
            <span style="position:absolute; left:8px; display:flex; align-items:center; pointer-events:none; opacity:0.5;">
              <svg viewBox="0 0 24 24" style="width:12px; height:12px; stroke:currentColor; fill:none; stroke-width:2;"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            </span>
          </div>

          <button class="ag-win-btn" id="agBwGo" title="Перейти" style="width:auto; padding:0 8px; font-family:var(--ag-font-mono); font-size:10px; font-weight:600; background:rgba(56,189,248,0.15); border-color:rgba(56,189,248,0.3); color:#38bdf8;">GO</button>
          
          <button class="ag-win-btn" id="agBwExternal" title="Открыть в Chrome">
            <svg viewBox="0 0 24 24"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/><polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/></svg>
          </button>
        </div>

        <!-- Progress Bar -->
        <div id="agBwProgressBar" style="position:absolute; top:37px; left:0; width:0%; height:2px; background:linear-gradient(90deg, #38bdf8, #818cf8); z-index:30; transition:width 0.2s ease, opacity 0.3s ease; opacity:0;"></div>

        <!-- Bookmarks Chips Bar -->
        <div class="ag-browser-chips-bar" style="display:flex; align-items:center; gap:6px; padding:4px 8px; background:rgba(18,20,24,0.7); border-bottom:1px solid var(--ag-border-subtle); overflow-x:auto; min-height:28px;">
          <button class="ag-chip-btn" data-url="https://duckduckgo.com">DuckDuckGo</button>
          <button class="ag-chip-btn" data-url="https://www.google.com">Google</button>
          <button class="ag-chip-btn" data-url="https://github.com">GitHub</button>
          <button class="ag-chip-btn" data-url="https://en.wikipedia.org">Wikipedia</button>
          <button class="ag-chip-btn" data-url="http://localhost:5173">Vite :5173</button>
          <button class="ag-chip-btn" data-url="http://localhost:3000">Dev :3000</button>
          <button class="ag-chip-btn" data-url="http://localhost:8080">API :8080</button>
        </div>

        <!-- Content Area: Native WebView viewport target -->
        <div id="agBwNativeTarget" style="flex:1; width:100%; height:100%; background:transparent; position:relative; overflow:hidden;">
          <div id="agBwFallbackNotice" style="display:none; position:absolute; inset:0; flex-direction:column; align-items:center; justify-content:center; padding:20px; color:#94a3b8; text-align:center;">
            <p>Запуск Android Native WebView...</p>
          </div>
        </div>
      `;

      this.containerElement = root.querySelector('#agBwNativeTarget');
      this.inputElement = root.querySelector('#agBwInput');
      this.progressBar = root.querySelector('#agBwProgressBar');
      this.backBtn = root.querySelector('#agBwBack');
      this.forwardBtn = root.querySelector('#agBwForward');
      this.reloadBtn = root.querySelector('#agBwReload');
      this.homeBtn = root.querySelector('#agBwHome');

      // Bind Omnibar Handlers
      root.querySelector('#agBwGo').onclick = () => this.navigateTo(this.inputElement.value);
      this.inputElement.onkeydown = (e) => {
        if (e.key === 'Enter') {
          e.preventDefault();
          this.navigateTo(this.inputElement.value);
          this.inputElement.blur();
        }
      };
      this.inputElement.onfocus = () => {
        setTimeout(() => this.inputElement.select(), 50);
      };

      // Navigation Handlers
      this.backBtn.onclick = () => this.goBack();
      this.forwardBtn.onclick = () => this.goForward();
      this.reloadBtn.onclick = () => this.reload();
      this.homeBtn.onclick = () => this.navigateTo('https://duckduckgo.com');

      root.querySelector('#agBwExternal').onclick = () => {
        const b = this._getBridge();
        if (b && typeof b.openExternalUrl === 'function') {
          b.openExternalUrl(this.currentUrl);
        } else {
          window.open(this.currentUrl, '_blank');
        }
      };

      // Chips Handlers
      root.querySelectorAll('.ag-chip-btn').forEach(btn => {
        btn.onclick = () => this.navigateTo(btn.dataset.url);
      });

      return root;
    }

    _normalizeUrl(input) {
      if (!input) return 'https://duckduckgo.com';
      let raw = input.trim();
      if (raw.startsWith('file://') || raw.startsWith('about:') || raw.startsWith('http://') || raw.startsWith('https://')) {
        return raw;
      }
      if (/^(localhost|127\.0\.0\.1|0\.0\.0\.0)(:\d+)?(\/.*)?$/i.test(raw)) {
        return 'http://' + raw;
      }
      if (/^[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(:\d+)?(\/.*)?$/i.test(raw)) {
        return 'https://' + raw;
      }
      return `https://duckduckgo.com/html/?q=${encodeURIComponent(raw)}`;
    }

    navigateTo(url) {
      if (!url) return;
      const target = this._normalizeUrl(url);
      this.currentUrl = target;
      if (this.inputElement) this.inputElement.value = target;

      const b = this._getBridge();
      if (b && typeof b.nativeBrowserNavigate === 'function') {
        b.nativeBrowserNavigate(target);
      } else {
        this._openNative(target);
      }

      if (window.showSystemToast) {
        const host = target.replace(/^https?:\/\//i, '').split('/')[0];
        window.showSystemToast(`Переход: ${host}`);
      }
    }

    goBack() {
      const b = this._getBridge();
      if (b && typeof b.nativeBrowserGoBack === 'function') {
        b.nativeBrowserGoBack();
      }
    }

    goForward() {
      const b = this._getBridge();
      if (b && typeof b.nativeBrowserGoForward === 'function') {
        b.nativeBrowserGoForward();
      }
    }

    reload() {
      const b = this._getBridge();
      if (b && typeof b.nativeBrowserReload === 'function') {
        b.nativeBrowserReload();
        if (window.showSystemToast) window.showSystemToast('Обновление страницы');
      }
    }

    stop() {
      const b = this._getBridge();
      if (b && typeof b.nativeBrowserStop === 'function') {
        b.nativeBrowserStop();
      }
    }

    // --- Native View Attachment & Tracking ---

    _openNative(url) {
      const b = this._getBridge();
      if (!b || typeof b.openNativeBrowser !== 'function') return;

      if (!this.containerElement) return;
      const r = this.containerElement.getBoundingClientRect();
      b.openNativeBrowser(url, r.left, r.top, r.width, r.height);
    }

    _syncNativeBounds() {
      const b = this._getBridge();
      if (!b || typeof b.setNativeBrowserBounds !== 'function' || !this.containerElement) return;

      const r = this.containerElement.getBoundingClientRect();
      const isVisible = !!(this.windowInstance && !this.windowInstance.isMinimized && r.width > 0 && r.height > 0);

      b.setNativeBrowserBounds(r.left, r.top, r.width, r.height);
      b.setNativeBrowserVisible(isVisible);
    }

    _setNativeVisible(visible) {
      const b = this._getBridge();
      if (b && typeof b.setNativeBrowserVisible === 'function') {
        b.setNativeBrowserVisible(visible);
      }
    }

    _closeNative() {
      const b = this._getBridge();
      if (b && typeof b.closeNativeBrowser === 'function') {
        b.closeNativeBrowser();
      }
    }

    _startBoundsTracking() {
      this._stopBoundsTracking();
      // Track bounds during drag or resize operations
      this._pollBoundsTimer = setInterval(() => {
        if (this.windowInstance && !this.windowInstance.isMinimized) {
          this._syncNativeBounds();
        }
      }, 120);
    }

    _stopBoundsTracking() {
      if (this._pollBoundsTimer) {
        clearInterval(this._pollBoundsTimer);
        this._pollBoundsTimer = null;
      }
    }

    _hookWindowLifecycle() {
      if (!this.windowInstance) return;

      const winEl = this.windowInstance.element;

      // Pointer down / drag / resize events on window
      winEl.addEventListener('pointerdown', () => this._syncNativeBounds());
      window.addEventListener('resize', () => this._syncNativeBounds());

      // Override minimize / restore
      const origMin = this.windowInstance.minimize.bind(this.windowInstance);
      this.windowInstance.minimize = () => {
        origMin();
        this._setNativeVisible(false);
      };

      const origRestore = this.windowInstance.restore.bind(this.windowInstance);
      this.windowInstance.restore = () => {
        origRestore();
        requestAnimationFrame(() => {
          this._syncNativeBounds();
          this._setNativeVisible(true);
        });
      };
    }

    _setProgress(progress, loading) {
      this.isLoading = loading;
      if (!this.progressBar) return;

      if (loading) {
        this.progressBar.style.opacity = '1';
        this.progressBar.style.width = `${Math.max(15, progress)}%`;
      } else {
        this.progressBar.style.width = '100%';
        setTimeout(() => {
          if (this.progressBar) {
            this.progressBar.style.opacity = '0';
            setTimeout(() => {
              if (this.progressBar) this.progressBar.style.width = '0%';
            }, 250);
          }
        }, 150);
      }
    }

    _updateNavButtons(canBack, canForward) {
      if (this.backBtn) {
        this.backBtn.style.opacity = canBack ? '1' : '0.4';
        this.backBtn.style.pointerEvents = canBack ? 'auto' : 'none';
      }
      if (this.forwardBtn) {
        this.forwardBtn.style.opacity = canForward ? '1' : '0.4';
        this.forwardBtn.style.pointerEvents = canForward ? 'auto' : 'none';
      }
    }
  }

  // Export Singleton
  window.WebInspectorModule = new WebInspectorModule();
})(window);
