/**
 * ============================================================================
 * Module 4: WebInspectorModule (Встроенный Браузер и Веб-Инспектор AGY Pro v2.4.1)
 * Full Android Floating Browser: HTTPS, Search, Dev Servers, History & Anti-Frame Engine
 * ZERO FAKES: Real HTTP/HTTPS navigation, interactive DOM, touch scrolling, form input
 * ============================================================================
 */

(function (window) {
  'use strict';

  const PROXY_PORT = 45180;
  const PROXY_BASE = `http://127.0.0.1:${PROXY_PORT}/proxy?url=`;

  class WebInspectorModule {
    constructor() {
      this.windowInstance = null;
      this.currentUrl = 'https://duckduckgo.com';
      this.history = [];
      this.historyIndex = -1;
      this.frameElement = null;
      this.inputElement = null;
      this.progressBar = null;
      this.shieldElement = null;
      this.backBtn = null;
      this.forwardBtn = null;
      this.reloadBtn = null;
      this.homeBtn = null;
      this.isLoading = false;
      this._bindGlobalMessageListener();
      this._bindGlobalLinkInterceptor();
      this._ensureProxyService();
    }

    /**
     * Checks and starts the local Anti-Frame proxy daemon if needed
     */
    async _ensureProxyService() {
      try {
        const resp = await fetch(`http://127.0.0.1:${PROXY_PORT}/status`, { signal: AbortSignal.timeout(1000) });
        if (resp.ok) return;
      } catch (_) {}

      // Spawn proxy daemon via native bridge
      const bridge = window.SystemBridge || window.BridgeConnector;
      if (bridge && typeof bridge.exec === 'function') {
        bridge.exec('nohup python /data/user/0/com.agy/files/services/browser-proxy/proxy.py >/dev/null 2>&1 &');
      }
    }

    open(opts = {}) {
      const targetUrl = opts.url || this.currentUrl;

      if (this.windowInstance && window.DesktopWindowManager && window.DesktopWindowManager.windows.has('win-web-inspector')) {
        this.windowInstance.restore();
        this.windowInstance.focus();
        if (opts.url && opts.url !== this.currentUrl) {
          this.navigateTo(opts.url);
        }
        return this.windowInstance;
      }

      const content = this._createDOM(targetUrl);
      this.windowInstance = window.DesktopWindowManager.createWindow({
        id: 'win-web-inspector',
        title: 'Встроенный Браузер / Inspector',
        iconSvg: '<circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>',
        width: Math.min(window.innerWidth * 0.94, 600),
        height: Math.min(window.innerHeight * 0.70, 560),
        x: Math.max(8, (window.innerWidth - Math.min(window.innerWidth * 0.94, 600)) / 2),
        y: 42,
        content: content,
        onClose: () => {
          this.windowInstance = null;
          this.frameElement = null;
          this.inputElement = null;
          this.progressBar = null;
          this.shieldElement = null;
          this.backBtn = null;
          this.forwardBtn = null;
        }
      });

      // Hook dragging events on window to protect iframe from stealing pointer focus
      this._hookWindowShield();

      // Register Drag & Drop Target for Live File Preview
      if (window.UnifiedDragDropBus && this.windowInstance.bodyElement) {
        window.UnifiedDragDropBus.registerDropTarget(this.windowInstance.bodyElement, (payload) => {
          this.previewFile(payload.path);
        });
      }

      this.navigateTo(targetUrl, false);
      return this.windowInstance;
    }

    _createDOM(initialUrl) {
      const root = document.createElement('div');
      root.className = 'ag-browser-workspace';
      root.style.cssText = 'display:flex; flex-direction:column; height:100%; width:100%; background:var(--ag-surface-dark); user-select:none; position:relative; overflow:hidden;';

      root.innerHTML = `
        <!-- Navigation Bar -->
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
          <button class="ag-win-btn" id="agBwHome" title="Главная (DuckDuckGo)">
            <svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
          </button>
          
          <!-- Omnibar / Address Input -->
          <div style="flex:1; display:flex; align-items:center; position:relative; min-width:0;">
            <input type="text" class="ag-browser-url-input" id="agBwInput" value="${initialUrl}" placeholder="Поиск в DuckDuckGo или URL адрес..."
              style="width:100%; background:rgba(0,0,0,0.45); border:1px solid var(--ag-border-subtle); border-radius:6px; padding:5px 8px 5px 26px; color:var(--ag-text-primary); font-family:var(--ag-font-mono); font-size:11px; outline:none; transition:border-color 0.15s ease;" />
            <span style="position:absolute; left:8px; display:flex; align-items:center; pointer-events:none; opacity:0.5;">
              <svg viewBox="0 0 24 24" style="width:12px; height:12px; stroke:currentColor; fill:none; stroke-width:2;"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            </span>
          </div>

          <button class="ag-win-btn" id="agBwGo" title="Перейти" style="width:auto; padding:0 8px; font-family:var(--ag-font-mono); font-size:10px; font-weight:600; background:rgba(56,189,248,0.15); border-color:rgba(56,189,248,0.3); color:#38bdf8;">GO</button>
          
          <button class="ag-win-btn" id="agBwExternal" title="Открыть в Chrome">
            <svg viewBox="0 0 24 24"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/><polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/></svg>
          </button>
        </div>

        <!-- Animated Loading Progress Bar -->
        <div id="agBwProgressBar" style="position:absolute; top:37px; left:0; width:0%; height:2px; background:linear-gradient(90deg, #38bdf8, #818cf8); z-index:30; transition:width 0.25s ease, opacity 0.3s ease; opacity:0;"></div>

        <!-- Preset Bookmarks Chips Bar -->
        <div class="ag-browser-chips-bar" style="display:flex; align-items:center; gap:6px; padding:4px 8px; background:rgba(18,20,24,0.7); border-bottom:1px solid var(--ag-border-subtle); overflow-x:auto; min-height:28px;">
          <button class="ag-chip-btn" data-url="https://duckduckgo.com">DuckDuckGo</button>
          <button class="ag-chip-btn" data-url="https://www.google.com">Google</button>
          <button class="ag-chip-btn" data-url="https://github.com">GitHub</button>
          <button class="ag-chip-btn" data-url="http://localhost:5173">Vite :5173</button>
          <button class="ag-chip-btn" data-url="http://localhost:3000">Dev :3000</button>
          <button class="ag-chip-btn" data-url="http://localhost:8080">API :8080</button>
          <button class="ag-chip-btn" data-url="http://127.0.0.1:45170">Core :45170</button>
        </div>

        <!-- Web Content Frame Container -->
        <div class="ag-browser-frame-container" style="flex:1; position:relative; overflow:hidden; background:#ffffff; width:100%; height:100%;">
          <iframe id="agBwIframe" style="width:100%; height:100%; border:none; display:block; background:#ffffff;" allow="fullscreen; clipboard-read; clipboard-write;" loading="lazy"></iframe>
          <!-- Drag Shield (prevents iframe from eating touchmove / pointermove during window dragging) -->
          <div id="agBwShield" style="position:absolute; inset:0; z-index:15; pointer-events:none; background:transparent;"></div>
        </div>
      `;

      this.frameElement = root.querySelector('#agBwIframe');
      this.inputElement = root.querySelector('#agBwInput');
      this.progressBar = root.querySelector('#agBwProgressBar');
      this.shieldElement = root.querySelector('#agBwShield');
      this.backBtn = root.querySelector('#agBwBack');
      this.forwardBtn = root.querySelector('#agBwForward');
      this.reloadBtn = root.querySelector('#agBwReload');
      this.homeBtn = root.querySelector('#agBwHome');

      // Bind Address Bar Actions
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

      // Bind Navigation Controls
      this.backBtn.onclick = () => this.goBack();
      this.forwardBtn.onclick = () => this.goForward();
      this.reloadBtn.onclick = () => this.reload();
      this.homeBtn.onclick = () => this.navigateTo('https://duckduckgo.com');

      root.querySelector('#agBwExternal').onclick = () => {
        const bridge = window.SystemBridge || window.BridgeConnector;
        if (bridge && typeof bridge.openExternalUrl === 'function') {
          bridge.openExternalUrl(this.currentUrl);
        } else {
          window.open(this.currentUrl, '_blank');
        }
      };

      // Bind Preset Chips
      root.querySelectorAll('.ag-chip-btn').forEach(btn => {
        btn.onclick = () => this.navigateTo(btn.dataset.url);
      });

      // Frame Load Events
      this.frameElement.addEventListener('load', () => this._onFrameLoaded());
      this.frameElement.addEventListener('error', () => this._onFrameError());

      return root;
    }

    /**
     * Resolves user input into either a direct URL, dev server, or DuckDuckGo search query
     */
    _normalizeUrl(input) {
      if (!input) return 'https://duckduckgo.com';
      let raw = input.trim();

      if (raw.startsWith('file://') || raw.startsWith('about:')) {
        return raw;
      }

      // Check if it's already a full HTTP/HTTPS URL
      if (raw.startsWith('http://') || raw.startsWith('https://')) {
        return raw;
      }

      // Check for localhost or local IP
      if (/^(localhost|127\.0\.0\.1|0\.0\.0\.0)(:\d+)?(\/.*)?$/i.test(raw)) {
        return 'http://' + raw;
      }

      // Check for domain name with dot and no spaces (e.g. google.com, vite.dev, github.com/user)
      if (/^[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(:\d+)?(\/.*)?$/i.test(raw)) {
        return 'https://' + raw;
      }

      // Otherwise treat as a search query
      return `https://duckduckgo.com/html/?q=${encodeURIComponent(raw)}`;
    }

    /**
     * Determines whether to load URL directly or via local Anti-Frame proxy
     */
    _resolveUrl(targetUrl) {
      if (!targetUrl) return 'about:blank';

      // Local dev servers, core engine ports, and data URIs load directly
      if (
        targetUrl.startsWith('file://') ||
        targetUrl.startsWith('about:') ||
        targetUrl.startsWith('data:') ||
        targetUrl.includes('localhost') ||
        targetUrl.includes('127.0.0.1') ||
        targetUrl.includes('0.0.0.0')
      ) {
        return targetUrl;
      }

      // Remote websites route through the Anti-Frame proxy to bypass X-Frame-Options
      return `${PROXY_BASE}${encodeURIComponent(targetUrl)}`;
    }

    /**
     * Navigates the browser to the specified URL or search query
     */
    navigateTo(url, recordHistory = true) {
      if (!url) return;
      const normalized = this._normalizeUrl(url);
      this.currentUrl = normalized;

      if (this.inputElement) {
        this.inputElement.value = normalized;
      }

      if (recordHistory) {
        // Truncate future history if navigated from past state
        if (this.historyIndex < this.history.length - 1) {
          this.history = this.history.slice(0, this.historyIndex + 1);
        }
        this.history.push(normalized);
        this.historyIndex = this.history.length - 1;
        this._updateNavButtons();
      }

      this._startLoading();

      const finalSrc = this._resolveUrl(normalized);
      if (this.frameElement) {
        this.frameElement.removeAttribute('srcdoc');
        this.frameElement.src = finalSrc;
      }

      if (window.showSystemToast) {
        const displayHost = normalized.replace(/^https?:\/\//i, '').split('/')[0];
        window.showSystemToast(`Переход: ${displayHost}`);
      }
    }

    goBack() {
      if (this.historyIndex > 0) {
        this.historyIndex--;
        this._updateNavButtons();
        const prevUrl = this.history[this.historyIndex];
        this.navigateTo(prevUrl, false);
      }
    }

    goForward() {
      if (this.historyIndex < this.history.length - 1) {
        this.historyIndex++;
        this._updateNavButtons();
        const nextUrl = this.history[this.historyIndex];
        this.navigateTo(nextUrl, false);
      }
    }

    reload() {
      if (!this.frameElement) return;
      this._startLoading();
      const currentSrc = this.frameElement.src;
      this.frameElement.src = 'about:blank';
      setTimeout(() => {
        this.frameElement.src = currentSrc;
      }, 50);
      if (window.showSystemToast) {
        window.showSystemToast('Страница обновляется');
      }
    }

    _updateNavButtons() {
      if (this.backBtn) {
        const canBack = this.historyIndex > 0;
        this.backBtn.style.opacity = canBack ? '1' : '0.4';
        this.backBtn.style.pointerEvents = canBack ? 'auto' : 'none';
      }
      if (this.forwardBtn) {
        const canForward = this.historyIndex < this.history.length - 1;
        this.forwardBtn.style.opacity = canForward ? '1' : '0.4';
        this.forwardBtn.style.pointerEvents = canForward ? 'auto' : 'none';
      }
    }

    _startLoading() {
      this.isLoading = true;
      if (this.progressBar) {
        this.progressBar.style.opacity = '1';
        this.progressBar.style.width = '20%';
        setTimeout(() => {
          if (this.isLoading && this.progressBar) {
            this.progressBar.style.width = '70%';
          }
        }, 150);
      }
      if (this.reloadBtn) {
        const icon = this.reloadBtn.querySelector('#agBwReloadIcon');
        if (icon) icon.style.animation = 'agSpin 1s linear infinite';
      }
    }

    _onFrameLoaded() {
      this.isLoading = false;
      if (this.progressBar) {
        this.progressBar.style.width = '100%';
        setTimeout(() => {
          if (this.progressBar) {
            this.progressBar.style.opacity = '0';
            setTimeout(() => {
              if (this.progressBar) this.progressBar.style.width = '0%';
            }, 300);
          }
        }, 200);
      }
      if (this.reloadBtn) {
        const icon = this.reloadBtn.querySelector('#agBwReloadIcon');
        if (icon) icon.style.animation = 'none';
      }
    }

    _onFrameError() {
      this._onFrameLoaded();
      if (window.showSystemToast) {
        window.showSystemToast('Ошибка соединения с веб-страницей');
      }
    }

    /**
     * Prevents iframe from intercepting mousemove / touchmove while the user is dragging the window
     */
    _hookWindowShield() {
      if (!this.windowInstance || !this.shieldElement) return;

      const header = this.windowInstance.headerElement;
      if (header) {
        header.addEventListener('pointerdown', () => {
          if (this.shieldElement) this.shieldElement.style.pointerEvents = 'auto';
        });
        window.addEventListener('pointerup', () => {
          if (this.shieldElement) this.shieldElement.style.pointerEvents = 'none';
        });
      }
    }

    /**
     * Synchronizes live title and address bar updates sent from proxy or embedded script
     */
    _bindGlobalMessageListener() {
      window.addEventListener('message', (e) => {
        if (!e.data || typeof e.data !== 'object') return;

        if (e.data.type === 'agy_nav_update') {
          if (e.data.title && this.windowInstance) {
            this.windowInstance.setTitle(`Браузер — ${e.data.title}`);
          }
          if (e.data.url && this.inputElement) {
            const raw = e.data.url;
            if (raw.includes(PROXY_BASE)) {
              const actual = decodeURIComponent(raw.split(PROXY_BASE)[1]);
              this.currentUrl = actual;
              this.inputElement.value = actual;
            }
          }
        } else if (e.data.type === 'agy_navigate_to') {
          if (e.data.url) {
            this.navigateTo(e.data.url);
          }
        }
      });
    }

    /**
     * Live File Preview for HTML, SVG, Markdown, JSON, Text
     */
    async previewFile(filePath) {
      if (!filePath) return;
      this.open();

      const bridge = window.SystemBridge || window.BridgeConnector;
      const content = await bridge.readFile(filePath);
      const ext = filePath.split('.').pop().toLowerCase();
      const fileName = filePath.split('/').pop();

      this.currentUrl = `file://${filePath}`;
      if (this.inputElement) {
        this.inputElement.value = this.currentUrl;
      }

      if (ext === 'html' || ext === 'htm') {
        this.frameElement.srcdoc = content;
      } else if (ext === 'svg') {
        this.frameElement.srcdoc = `<!DOCTYPE html><html><body style="margin:0; background:#0b0c0e; display:flex; align-items:center; justify-content:center; height:100vh;">${content}</body></html>`;
      } else if (ext === 'md') {
        const htmlContent = content
          .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
          .replace(/^### (.*$)/gim, '<h3 style="color:#eceef2; margin-top:16px;">$1</h3>')
          .replace(/^## (.*$)/gim, '<h2 style="color:#eceef2; margin-top:20px; border-bottom:1px solid #22242a; padding-bottom:4px;">$1</h2>')
          .replace(/^# (.*$)/gim, '<h1 style="color:#eceef2; margin-top:24px; border-bottom:1px solid #22242a; padding-bottom:6px;">$1</h1>')
          .replace(/\*\*(.*)\*\*/gim, '<strong style="color:#fff;">$1</strong>')
          .replace(/`([^`]+)`/gim, '<code style="background:rgba(255,255,255,0.08); padding:2px 5px; border-radius:4px; font-family:monospace; color:#38bdf8;">$1</code>')
          .replace(/\n/gim, '<br>');
        this.frameElement.srcdoc = `<!DOCTYPE html><html><head><meta name="viewport" content="width=device-width, initial-scale=1.0"><style>body{font-family:-apple-system,sans-serif; background:#0e1014; color:#cbd5e1; padding:16px; line-height:1.6;}</style></head><body>${htmlContent}</body></html>`;
      } else {
        const safeText = content.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
        this.frameElement.srcdoc = `<!DOCTYPE html><html><head><meta name="viewport" content="width=device-width, initial-scale=1.0"><style>body{font-family:monospace; font-size:12px; background:#0e1014; color:#eceef2; padding:16px; white-space:pre-wrap; word-break:break-all;}</style></head><body><pre>${safeText}</pre></body></html>`;
      }

      this._onFrameLoaded();

      if (window.showSystemToast) {
        window.showSystemToast(`Просмотр файла: ${fileName}`);
      }
    }

    _bindGlobalLinkInterceptor() {
      document.addEventListener('click', (e) => {
        const link = e.target.closest('a[href]');
        if (link && link.href) {
          const href = link.getAttribute('href');
          if (href && (href.startsWith('http://') || href.startsWith('https://'))) {
            e.preventDefault();
            this.open({ url: href });
          }
        }
      }, { capture: true });
    }
  }

  // Export Singleton
  window.WebInspectorModule = new WebInspectorModule();
})(window);
