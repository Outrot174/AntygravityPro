/**
 * ============================================================================
 * UnifiedDragDropBus - Inter-Window Drag & Drop Event Bus
 * 60-120 FPS Touch & Pointer Engine with Smart Mobile Translucency
 * ============================================================================
 */

(function (window) {
  'use strict';

  function showSystemToast(message) {
    let toast = document.getElementById('agSystemToast');
    if (!toast) {
      toast = document.createElement('div');
      toast.id = 'agSystemToast';
      document.body.appendChild(toast);
    }
    toast.textContent = message;
    toast.classList.add('ag-visible');
    clearTimeout(toast._timer);
    toast._timer = setTimeout(() => {
      toast.classList.remove('ag-visible');
    }, 2200);
  }
  window.showSystemToast = showSystemToast;

  class DragDropBus {
    constructor() {
      this.currentPayload = null;
      this.sourceWindowEl = null;
      this.ghostElement = null;
      this.dropTargets = new Set();
      this.currentHoverTarget = null;
      this.isDragging = false;
      this.rafId = null;
      this.pointerPos = { x: 0, y: 0 };

      this._initGhost();
      this._bindGlobalEvents();
    }

    _initGhost() {
      if (!this.ghostElement) {
        this.ghostElement = document.getElementById('agDragDropGhost');
        if (!this.ghostElement) {
          this.ghostElement = document.createElement('div');
          this.ghostElement.id = 'agDragDropGhost';
          document.body.appendChild(this.ghostElement);
        }
      }
    }

    _bindGlobalEvents() {
      const onMove = (e) => {
        if (!this.isDragging) return;
        const pt = e.touches ? e.touches[0] : e;
        this.pointerPos.x = pt.clientX;
        this.pointerPos.y = pt.clientY;

        if (!this.rafId) {
          this.rafId = requestAnimationFrame(() => {
            this._renderGhost();
            this._detectDropTarget();
            this.rafId = null;
          });
        }
      };

      const onEnd = (e) => {
        if (!this.isDragging) return;
        this.isDragging = false;

        if (this.rafId) {
          cancelAnimationFrame(this.rafId);
          this.rafId = null;
        }

        if (this.ghostElement) {
          this.ghostElement.style.display = 'none';
        }

        // Restore window opacity
        if (this.sourceWindowEl) {
          this.sourceWindowEl.classList.remove('ag-dragging-translucent');
        }

        // Determine drop action
        const pt = e.changedTouches ? e.changedTouches[0] : e;
        const dropX = pt ? pt.clientX : this.pointerPos.x;
        const dropY = pt ? pt.clientY : this.pointerPos.y;

        if (this.currentHoverTarget && this.currentHoverTarget._agDropHandler) {
          // Dropped on a custom registered window (Terminal, Browser, etc.)
          this.currentHoverTarget._agDropHandler(this.currentPayload);
          showSystemToast(`Файл прикреплен: ${this.currentPayload.name}`);
        } else {
          // Check if dropped over Chat (#root) or anywhere outside floating windows
          const elemUnder = document.elementFromPoint(dropX, dropY);
          const inFloatingWin = elemUnder && elemUnder.closest('.ag-window-instance:not(.ag-dragging-translucent)');

          if (!inFloatingWin && this.currentPayload) {
            // Drop onto main Chat workspace!
            this.insertPathToChatInput(this.currentPayload.path, this.currentPayload.name);
          }
        }

        this._clearDropTargetHighlight();
        this.currentPayload = null;
        this.sourceWindowEl = null;
        this.currentHoverTarget = null;
        document.querySelectorAll('.ag-file-entry.ag-dragging').forEach(el => el.classList.remove('ag-dragging'));
      };

      window.addEventListener('pointermove', onMove, { passive: true });
      window.addEventListener('pointerup', onEnd);
      window.addEventListener('pointercancel', onEnd);
      window.addEventListener('touchmove', onMove, { passive: true });
      window.addEventListener('touchend', onEnd);
      window.addEventListener('touchcancel', onEnd);
    }

    _renderGhost() {
      if (!this.ghostElement || !this.currentPayload) return;
      this.ghostElement.style.left = `${this.pointerPos.x}px`;
      this.ghostElement.style.top = `${this.pointerPos.y}px`;
    }

    _detectDropTarget() {
      // Temporarily hide ghost to inspect elements underneath
      this.ghostElement.style.display = 'none';
      const el = document.elementFromPoint(this.pointerPos.x, this.pointerPos.y);
      this.ghostElement.style.display = 'block';

      if (!el) {
        this._clearDropTargetHighlight();
        return;
      }

      let matchedTarget = null;
      for (const target of this.dropTargets) {
        if (target.contains(el)) {
          matchedTarget = target;
          break;
        }
      }

      if (matchedTarget !== this.currentHoverTarget) {
        this._clearDropTargetHighlight();
        this.currentHoverTarget = matchedTarget;
        if (this.currentHoverTarget) {
          this.currentHoverTarget.classList.add('ag-drop-target-active');
        }
      }
    }

    _clearDropTargetHighlight() {
      if (this.currentHoverTarget) {
        this.currentHoverTarget.classList.remove('ag-drop-target-active');
        this.currentHoverTarget = null;
      }
    }

    /**
     * Starts dragging a file
     * @param {Object} payload { name, path, isDir, size }
     * @param {HTMLElement} sourceWindowEl Window to make translucent during drag
     * @param {Event} e Pointer or touch event
     */
    startDrag(payload, sourceWindowEl, e) {
      this.currentPayload = payload;
      this.sourceWindowEl = sourceWindowEl || null;
      this.isDragging = true;

      // Smart Mobile Translucency: make source window translucent to reveal Chat
      if (this.sourceWindowEl) {
        this.sourceWindowEl.classList.add('ag-dragging-translucent');
      }

      const pt = e.touches ? e.touches[0] : e;
      this.pointerPos.x = pt ? pt.clientX : window.innerWidth / 2;
      this.pointerPos.y = pt ? pt.clientY : window.innerHeight / 2;

      if (this.ghostElement) {
        this.ghostElement.textContent = `📎 ${payload.name}`;
        this.ghostElement.style.display = 'block';
        this._renderGhost();
      }

      if (window.navigator && window.navigator.vibrate) {
        window.navigator.vibrate(25);
      }
    }

    registerDropTarget(element, onDropCallback) {
      if (!element) return;
      element._agDropHandler = onDropCallback;
      this.dropTargets.add(element);
    }

    unregisterDropTarget(element) {
      if (!element) return;
      delete element._agDropHandler;
      this.dropTargets.delete(element);
    }

    /**
     * Injects file path reference directly into the real React input field
     * @param {string} filePath
     * @param {string} fileName
     */
    insertPathToChatInput(filePath, fileName) {
      const targetInput = document.querySelector(
        '#root textarea, #root [contenteditable="true"], #root input[type="text"]'
      );

      const tag = `@${filePath} `;

      if (targetInput) {
        if (targetInput.tagName === 'TEXTAREA' || targetInput.tagName === 'INPUT') {
          const currentVal = targetInput.value || '';
          const newVal = currentVal ? `${currentVal.trim()} ${tag}` : tag;

          try {
            const proto = targetInput.tagName === 'TEXTAREA'
              ? window.HTMLTextAreaElement.prototype
              : window.HTMLInputElement.prototype;
            const setter = Object.getOwnPropertyDescriptor(proto, 'value').set;
            setter.call(targetInput, newVal);
            targetInput.dispatchEvent(new Event('input', { bubbles: true }));
            targetInput.dispatchEvent(new Event('change', { bubbles: true }));
            targetInput.focus();
          } catch (_) {
            targetInput.value = newVal;
          }
        } else if (targetInput.getAttribute('contenteditable') === 'true') {
          targetInput.focus();
          document.execCommand('insertText', false, tag);
        }
        showSystemToast(`В чат добавлен: ${fileName || filePath.split('/').pop()}`);
      } else {
        // Fallback: copy to clipboard
        if (navigator.clipboard && navigator.clipboard.writeText) {
          navigator.clipboard.writeText(tag);
        }
        showSystemToast(`Путь скопирован: ${fileName || filePath}`);
      }
    }
  }

  // Export Singleton
  window.UnifiedDragDropBus = new DragDropBus();
})(window);
