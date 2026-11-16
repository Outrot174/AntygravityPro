/**
 * ============================================================================
 * Module 1: CoreChatModule (Студия ИИ - Полноэкранный Workspace)
 * Maximized Workspace Backdrop Architecture
 * Zero DOM-Reparenting: 100% Original React, Models, Prompts, Auth Preserved
 * ============================================================================
 */

(function (window) {
  'use strict';

  class CoreChatModule {
    constructor() {}

    /**
     * Focuses on the background Chat by minimizing all floating windows
     */
    open() {
      if (window.DesktopWindowManager) {
        window.DesktopWindowManager.windows.forEach(w => w.minimize());
        window.DesktopWindowManager._updateTaskbarApps();
      }

      const input = document.querySelector(
        '#root textarea, #root [contenteditable="true"], #root input[type="text"]'
      );
      if (input) {
        input.focus();
      }

      if (window.showSystemToast) {
        window.showSystemToast('Фокус на Чат Студии');
      }
      return null;
    }

    /**
     * Attaches file to chat input field
     */
    attachFile(filePath, fileName) {
      if (window.UnifiedDragDropBus) {
        window.UnifiedDragDropBus.insertPathToChatInput(filePath, fileName);
      }
    }
  }

  // Export Singleton
  window.CoreChatModule = new CoreChatModule();
})(window);
