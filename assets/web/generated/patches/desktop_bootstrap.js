/**
 * ============================================================================
 * DesktopBootstrap - Main Multi-Window Operating Environment Bootstrapper
 * Full Multi-Window Desktop DE with Maximized Backdrop Architecture
 * ZERO FAKES: 100% Original Antigravity UI & Native Bridge Preserved
 * ============================================================================
 */

(function (window) {
  'use strict';

  function initDesktopWorkspace() {
    // DesktopWindowManager already handles the 100% ribbon taskbar and button bindings.
    if (window.DesktopWindowManager && window.DesktopWindowManager.taskbarElement) {
      window.DesktopWindowManager._updateTaskbarApps();
    }

    // Welcome Notification
    if (window.showSystemToast) {
      window.showSystemToast('Antigravity Pro DE: Рабочая среда активна');
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initDesktopWorkspace);
  } else {
    initDesktopWorkspace();
  }
})(window);
