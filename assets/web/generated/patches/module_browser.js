/**
 * ============================================================================
 * Module 4: WebInspectorModule (Встроенный Браузер и Веб-Инспектор)
 * Local Dev Server Preview (Vite, Next.js, FastAPI) & Live HTML/SVG/MD File Preview
 * External Link Interception & Anti-Frame Bypass
 * ============================================================================
 */

(function (window) {
  'use strict';

  class WebInspectorModule {
    constructor() {
      this.windowInstance = null;
      this.currentUrl = 'http://localhost:3000';
      this.frameElement = null;
      this.inputElement = null;
      this._bindGlobalLinkInterceptor();
    }

    open(opts = {}) {
      const targetUrl = opts.url || this.currentUrl;

      if (this.windowInstance && window.DesktopWindowManager.windows.has('win-web-inspector')) {
        this.windowInstance.restore();
        this.windowInstance.focus();
        if (opts.url) this.navigateTo(opts.url);
        return this.windowInstance;
      }

      const content = this._createDOM(targetUrl);
      this.windowInstance = window.DesktopWindowManager.createWindow({
        id: 'win-web-inspector',
        title: 'Встроенный Браузер / Inspector',
        iconSvg: '<circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>',
        width: Math.min(window.innerWidth * 0.94, 580),
        height: Math.min(window.innerHeight * 0.65, 520),
        x: Math.max(8, (window.innerWidth - Math.min(window.innerWidth * 0.94, 580)) / 2),
        y: 45,
        content: content,
        onClose: () => {
          this.windowInstance = null;
          this.frameElement = null;
          this.inputElement = null;
        }
      });

      // Register Drag & Drop Target for Live File Preview
      if (window.UnifiedDragDropBus) {
        window.UnifiedDragDropBus.registerDropTarget(this.windowInstance.bodyElement, (payload) => {
          this.previewFile(payload.path);
        });
      }

      return this.windowInstance;
    }

    _createDOM(initialUrl) {
      const root = document.createElement('div');
      root.className = 'ag-browser-workspace';
      root.style.cssText = 'display:flex; flex-direction:column; height:100%; background:var(--ag-surface-dark);';
      root.innerHTML = `
        <div class="ag-browser-nav-bar" style="height:38px; display:flex; align-items:center; gap:6px; padding:0 8px; background:var(--ag-surface-header); border-bottom:1px solid var(--ag-border-subtle);">
          <button class="ag-win-btn" id="agBwBack" title="Назад">
            <svg viewBox="0 0 24 24"><line x1="19" y1="12" x2="5" y2="12"/><polyline points="12 19 5 12 12 5"/></svg>
          </button>
          <button class="ag-win-btn" id="agBwForward" title="Вперед">
            <svg viewBox="0 0 24 24"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </button>
          <button class="ag-win-btn" id="agBwReload" title="Обновить">
            <svg viewBox="0 0 24 24"><polyline points="23 4 23 10 17 10"/><polyline points="1 20 1 14 7 14"/><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"/></svg>
          </button>
          <input type="text" class="ag-browser-url-input" id="agBwInput" value="${initialUrl}" placeholder="http://127.0.0.1:3000" style="flex:1; background:rgba(0,0,0,0.4); border:1px solid var(--ag-border-subtle); border-radius:6px; padding:4px 8px; color:var(--ag-text-primary); font-family:var(--ag-font-mono); font-size:11px; outline:none;" />
          <button class="ag-win-btn" id="agBwGo" title="Перейти" style="width:auto; padding:0 8px; font-family:var(--ag-font-mono); font-size:10px;">GO</button>
          <button class="ag-win-btn" id="agBwExternal" title="Открыть в Chrome">
            <svg viewBox="0 0 24 24"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/><polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/></svg>
          </button>
        </div>
        <div class="ag-browser-chips-bar" style="display:flex; align-items:center; gap:6px; padding:4px 8px; background:rgba(18,20,24,0.6); border-bottom:1px solid var(--ag-border-subtle); overflow-x:auto;">
          <button class="ag-chip-btn" data-url="http://localhost:3000">Dev :3000</button>
          <button class="ag-chip-btn" data-url="http://localhost:5173">Vite :5173</button>
          <button class="ag-chip-btn" data-url="http://localhost:8080">API :8080</button>
          <button class="ag-chip-btn" data-url="http://127.0.0.1:45170">Core :45170</button>
        </div>
        <div style="flex:1; position:relative; overflow:hidden; background:#ffffff;">
          <iframe id="agBwIframe" src="${initialUrl}" style="width:100%; height:100%; border:none; display:block;" sandbox="allow-scripts allow-same-origin allow-forms allow-popups"></iframe>
        </div>
      `;

      this.frameElement = root.querySelector('#agBwIframe');
      this.inputElement = root.querySelector('#agBwInput');

      // Handlers
      root.querySelector('#agBwGo').onclick = () => this.navigateTo(this.inputElement.value);
      this.inputElement.onkeydown = (e) => {
        if (e.key === 'Enter') this.navigateTo(this.inputElement.value);
      };
      root.querySelector('#agBwReload').onclick = () => {
        if (this.frameElement) {
          this.frameElement.src = this.frameElement.src;
          if (window.showSystemToast) window.showSystemToast('Страница обновляется');
        }
      };
      root.querySelector('#agBwBack').onclick = () => {
        try { this.frameElement.contentWindow.history.back(); } catch (_) {}
      };
      root.querySelector('#agBwForward').onclick = () => {
        try { this.frameElement.contentWindow.history.forward(); } catch (_) {}
      };
      root.querySelector('#agBwExternal').onclick = () => {
        const bridge = window.SystemBridge || window.BridgeConnector;
        if (bridge && typeof bridge.openExternalUrl === 'function') {
          bridge.openExternalUrl(this.inputElement.value);
        } else {
          window.open(this.inputElement.value, '_blank');
        }
      };

      root.querySelectorAll('.ag-chip-btn').forEach(btn => {
        btn.onclick = () => this.navigateTo(btn.dataset.url);
      });

      return root;
    }

    navigateTo(url) {
      if (!url) return;
      let target = url.trim();
      if (!target.startsWith('http://') && !target.startsWith('https://') && !target.startsWith('file://')) {
        target = 'http://' + target;
      }
      this.currentUrl = target;
      if (this.inputElement) this.inputElement.value = target;

      if (this.frameElement) {
        this.frameElement.removeAttribute('srcdoc');
        this.frameElement.src = target;
      }

      if (window.showSystemToast) {
        window.showSystemToast(`Переход: ${target}`);
      }
    }

    /**
     * Live File Preview for HTML, SVG, Markdown, JSON, Text
     * @param {string} filePath
     */
    async previewFile(filePath) {
      if (!filePath || !this.frameElement) return;
      this.open();

      const bridge = window.SystemBridge || window.BridgeConnector;
      const content = await bridge.readFile(filePath);
      const ext = filePath.split('.').pop().toLowerCase();
      const fileName = filePath.split('/').pop();

      if (this.inputElement) {
        this.inputElement.value = `file://${filePath}`;
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
        // Plain text / code
        const safeText = content.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
        this.frameElement.srcdoc = `<!DOCTYPE html><html><head><meta name="viewport" content="width=device-width, initial-scale=1.0"><style>body{font-family:monospace; font-size:12px; background:#0e1014; color:#eceef2; padding:16px; white-space:pre-wrap; word-break:break-all;}</style></head><body><pre>${safeText}</pre></body></html>`;
      }

      if (window.showSystemToast) {
        window.showSystemToast(`Просмотр файла: ${fileName}`);
      }
    }

    _bindGlobalLinkInterceptor() {
      // Intercept any external links clicked inside chat or app
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
