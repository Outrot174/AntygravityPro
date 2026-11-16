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
