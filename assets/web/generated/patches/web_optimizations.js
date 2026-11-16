(function(){
/**
 * patches/web_optimizations/taps.js - kill the 300ms double-tap delay.
 */
'use strict';

function installTaps(doc) {
  try {
    var style = doc.createElement('style');
    style.setAttribute('data-agy', 'web-optimizations');
    style.textContent =
      'button,a,[role="button"],input,select,textarea{touch-action:manipulation;}';
    (doc.head || doc.documentElement).appendChild(style);
  } catch (e) {}
}

/**
 * patches/web_optimizations/viewport.js - keep --agy-vvh, --vh, and --app-height honest
 * while the soft keyboard opens, strictly subtracting 48px bottom taskbar.
 * Also locks window.scrollTo(0, 0) to prevent WebView body shifting.
 */
function installViewport(global, doc) {
  try {
    function updateVvh() {
      var vv = global.visualViewport;
      var h = (vv && vv.height) ? vv.height : (global.innerHeight || 0);
      var effective = Math.max(0, Math.round(h - 48));
      if (doc.documentElement) {
        doc.documentElement.style.setProperty('--agy-vvh', effective + 'px');
        doc.documentElement.style.setProperty('--vh', effective + 'px');
        doc.documentElement.style.setProperty('--app-height', effective + 'px');
        doc.documentElement.style.setProperty('--ag-taskbar-height', '48px');
        doc.documentElement.style.setProperty('--ag-available-height', effective + 'px');
        doc.documentElement.style.setProperty('--radix-popper-available-height', effective + 'px');
        doc.documentElement.style.setProperty('--radix-popover-content-available-height', effective + 'px');
        doc.documentElement.style.setProperty('--radix-dropdown-menu-content-available-height', effective + 'px');
        doc.documentElement.style.setProperty('--radix-select-content-available-height', effective + 'px');
      }
      if (global.scrollTo) {
        global.scrollTo(0, 0);
      }
    }

    if (global.visualViewport) {
      global.visualViewport.addEventListener('resize', updateVvh, { passive: true });
    }
    global.addEventListener('resize', updateVvh, { passive: true });
    global.addEventListener('scroll', function () {
      if (global.scrollY !== 0 || global.scrollX !== 0) {
        global.scrollTo(0, 0);
      }
    }, { passive: true });

    updateVvh();
  } catch (e) {}
}

/**
 * patches/web_optimizations/popup_guard.js - Bulletproof collision guard for popups & menus.
 * Repositions upward any popovers, select menus, dropdowns, and context menus
 * whose bounds intersect the bottom 48px Taskbar boundary or keyboard viewport.
 */
function installPopupGuard(global, doc) {
  try {
    var POPUP_SELECTOR = [
      '[data-radix-popper-content-wrapper]',
      '[data-radix-menu-content]',
      '[data-radix-dropdown-menu-content]',
      '[data-radix-select-content]',
      '[data-radix-popover-content]',
      '[role="menu"]',
      '[role="listbox"]',
      '.ag-context-menu'
    ].join(',');

    function sanitizePopups() {
      var vv = global.visualViewport;
      var vh = (vv && vv.height) ? vv.height : (global.innerHeight || 0);
      var maxBottom = vh - 48 - 4; // 4px safe margin above taskbar
      if (maxBottom <= 100) return;

      var popups = doc.querySelectorAll(POPUP_SELECTOR);
      for (var i = 0; i < popups.length; i++) {
        var el = popups[i];
        if (el.dataset.agGuarded === 'true') continue;
        var r = el.getBoundingClientRect();
        if (r.height === 0 || r.width === 0) continue;

        if (r.bottom > maxBottom) {
          var overflow = r.bottom - maxBottom;
          var curTop = parseFloat(el.style.top);
          if (isNaN(curTop)) {
            curTop = r.top;
          }
          var newTop = Math.max(12, curTop - overflow);
          el.style.top = newTop + 'px';
          el.style.maxHeight = (maxBottom - 16) + 'px';
          el.style.overflowY = 'auto';
          el.style.webkitOverflowScrolling = 'touch';
          el.dataset.agGuarded = 'true';
        }
      }
    }

    var debounceTimer = null;
    function scheduleSanitize() {
      if (debounceTimer) cancelAnimationFrame(debounceTimer);
      debounceTimer = requestAnimationFrame(sanitizePopups);
    }

    var observer = new MutationObserver(function (mutations) {
      for (var i = 0; i < mutations.length; i++) {
        if (mutations[i].addedNodes.length > 0) {
          scheduleSanitize();
          break;
        }
      }
    });

    observer.observe(doc.body || doc.documentElement, {
      childList: true,
      subtree: true
    });

    if (global.visualViewport) {
      global.visualViewport.addEventListener('resize', scheduleSanitize, { passive: true });
    }
    global.addEventListener('resize', scheduleSanitize, { passive: true });
    global.addEventListener('scroll', scheduleSanitize, { passive: true, capture: true });
  } catch (e) {}
}

/**
 * patches/web_optimizations/gpu.js - GPU-accelerate scroll/animation surfaces
 * and isolate layout for lists.
 */
function installGpu(doc) {
  try {
    if (!doc.querySelector('style[data-agy="gpu-acceleration"]')) {
      var gpu = doc.createElement('style');
      gpu.setAttribute('data-agy', 'gpu-acceleration');
      gpu.textContent =
        'main, [data-testid="chat-container"], .scrollable {' +
        ' transform: translateZ(0);' +
        ' -webkit-overflow-scrolling: touch; }' +
        '[role="listitem"], .message-row, .artifact-viewer {' +
        ' contain: layout style; }' +
        '*{ -webkit-tap-highlight-color: transparent; }';
      (doc.head || doc.documentElement).appendChild(gpu);
    }
  } catch (e) {}
}

/**
 * patches/web_optimizations/public-api.js - install and expose.
 */
var global = window;

if (global.__AG_WEB_OPTIMIZATIONS__) return;
global.__AG_WEB_OPTIMIZATIONS__ = true;

var doc = global.document;
if (!doc) return;

installTaps(doc);
installViewport(global, doc);
installPopupGuard(global, doc);
installGpu(doc);

global.__agWebOptimizations = { installed: true };

try {
  if (!global.__agI18nRuInstalled && doc) {
    var s = doc.createElement("script");
    s.src = "./generated/patches/i18n_ru.js";
    (doc.head || doc.documentElement).appendChild(s);
  }
} catch (e) {}

})();
