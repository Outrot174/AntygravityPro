/**
 * ============================================================================
 * BridgeConnector & SystemBridge - Pure Native Android System Bridge
 * Real Hardware & OS Interaction via Direct Smali Interface & Gateway Fallback
 * ZERO FAKES: Real shell execution, real filesystem listing, real engine ports
 * ============================================================================
 */

(function (window) {
  'use strict';

  class SystemBridge {
    constructor() {
      this.gatewayPort = 45175;
      this.enginePort = 45170;
      this._initBridge();
    }

    _initBridge() {
      if (!window.AndroidBridge && window.DesktopNativeBridge) {
        window.AndroidBridge = window.DesktopNativeBridge;
      }
      if (!window.AndroidBridge && window.Android) {
        window.AndroidBridge = window.Android;
      }
    }

    get bridge() {
      this._initBridge();
      return window.AndroidBridge || window.DesktopNativeBridge || window.Android || null;
    }

    /**
     * Executes arbitrary shell commands on native Android / Linux userspace
     * @param {string} cmd
     * @returns {Promise<string>} stdout + stderr
     */
    async exec(cmd) {
      if (!cmd || !cmd.trim()) return '';
      const b = this.bridge;

      // 1. Direct Smali JavascriptInterface method
      if (b && typeof b.execShell === 'function') {
        try {
          const res = b.execShell(cmd);
          if (res !== undefined && res !== null) {
            return String(res);
          }
        } catch (e) {
          console.warn('[SystemBridge] execShell error, trying gateway:', e);
        }
      }

      // 2. Gateway JSON-RPC fallback (ports 45175, 45158, 45160)
      const ports = [this.gatewayPort, 45158, 45160];
      for (const p of ports) {
        try {
          const resp = await fetch(`http://127.0.0.1:${p}/api`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ method: 'exec', params: { cmd: cmd } })
          });
          if (resp.ok) {
            const data = await resp.json();
            return (data && (data.stdout || data.output || data.result)) || '';
          }
        } catch (_) {}
      }

      return `[SystemBridge]: native exec unavailable for '${cmd}'`;
    }

    /**
     * Reads directory files with real disk attributes
     * @param {string} dirPath
     * @returns {Promise<Array<Object>>}
     */
    async listFiles(dirPath) {
      const target = (dirPath || '/storage/emulated/0/Antigravity').trim();
      const b = this.bridge;

      // 1. Direct Smali listDirJson method
      if (b && typeof b.listDirJson === 'function') {
        try {
          const raw = b.listDirJson(target);
          const list = typeof raw === 'string' ? JSON.parse(raw) : raw;
          if (Array.isArray(list)) {
            return list.map(item => ({
              name: item.name,
              path: item.path || `${target.replace(/\/$/, '')}/${item.name}`,
              isDir: !!item.isDir,
              isDirectory: !!item.isDir,
              sizeBytes: item.size || 0,
              size: this._formatSize(item.size || 0, !!item.isDir),
              lastModified: item.lastModified || Date.now()
            }));
          }
        } catch (e) {
          console.warn('[SystemBridge] listDirJson error:', e);
        }
      }

      // 2. Shell execution fallback
      try {
        const pyCmd = `python3 -c "import os, json; p='${target}'; files=[{'name': f, 'path': os.path.join(p, f), 'isDir': os.path.isdir(os.path.join(p, f)), 'size': os.path.getsize(os.path.join(p, f)) if os.path.isfile(os.path.join(p, f)) else 0, 'lastModified': int(os.path.getmtime(os.path.join(p, f))*1000)} for f in sorted(os.listdir(p))]; print(json.dumps(files))" 2>/dev/null`;
        const output = await this.exec(pyCmd);
        if (output && output.trim().startsWith('[')) {
          const list = JSON.parse(output.trim());
          return list.map(item => ({
            name: item.name,
            path: item.path,
            isDir: !!item.isDir,
            isDirectory: !!item.isDir,
            sizeBytes: item.size || 0,
            size: this._formatSize(item.size || 0, !!item.isDir),
            lastModified: item.lastModified || Date.now()
          }));
        }
      } catch (err) {
        console.warn('[SystemBridge] python file listing fallback failed:', err);
      }

      // Return empty array if directory has no files or unreadable
      return [];
    }

    /**
     * Reads file content as text
     * @param {string} filePath
     * @returns {Promise<string>}
     */
    async readFile(filePath) {
      if (!filePath) return '';
      const b = this.bridge;

      if (b && typeof b.readFile === 'function') {
        try {
          return b.readFile(filePath);
        } catch (e) {}
      }
      return this.exec(`cat "${filePath}" 2>/dev/null`);
    }

    /**
     * Writes text content to file
     * @param {string} filePath
     * @param {string} content
     * @returns {Promise<boolean>}
     */
    async writeFile(filePath, content) {
      if (!filePath) return false;
      const b = this.bridge;

      if (b && typeof b.writeFile === 'function') {
        try {
          return b.writeFile(filePath, content);
        } catch (e) {}
      }

      const res = await this.exec(`cat << 'AGY_EOF' > "${filePath}"\n${content}\nAGY_EOF`);
      return !res.includes('Error');
    }

    /**
     * Creates directory on Android storage
     * @param {string} dirPath
     * @returns {Promise<boolean>}
     */
    async createFolder(dirPath) {
      if (!dirPath) return false;
      const res = await this.exec(`mkdir -p "${dirPath}" 2>&1`);
      return !res || !res.toLowerCase().includes('error');
    }

    /**
     * Creates a new file
     * @param {string} filePath
     * @param {string} content
     * @returns {Promise<boolean>}
     */
    async createFile(filePath, content = '') {
      return this.writeFile(filePath, content);
    }

    /**
     * Deletes a file or directory
     * @param {string} targetPath
     * @returns {Promise<boolean>}
     */
    async deleteItem(targetPath) {
      if (!targetPath || targetPath === '/' || targetPath === '/storage/emulated/0') return false;
      const res = await this.exec(`rm -rf "${targetPath}" 2>&1`);
      return !res || !res.toLowerCase().includes('error');
    }

    /**
     * Renames or moves a file/folder
     * @param {string} oldPath
     * @param {string} newPath
     * @returns {Promise<boolean>}
     */
    async renameItem(oldPath, newPath) {
      if (!oldPath || !newPath) return false;
      const res = await this.exec(`mv "${oldPath}" "${newPath}" 2>&1`);
      return !res || !res.toLowerCase().includes('error');
    }

    /**
     * Copies a file or directory
     * @param {string} srcPath
     * @param {string} dstPath
     * @returns {Promise<boolean>}
     */
    async copyItem(srcPath, dstPath) {
      if (!srcPath || !dstPath) return false;
      const res = await this.exec(`cp -rf "${srcPath}" "${dstPath}" 2>&1`);
      return !res || !res.toLowerCase().includes('error');
    }

    /**
     * Moves a file or directory
     * @param {string} srcPath
     * @param {string} dstPath
     * @returns {Promise<boolean>}
     */
    async moveItem(srcPath, dstPath) {
      return this.renameItem(srcPath, dstPath);
    }

    /**
     * Opens a file in external Android application using VIEW intent
     * @param {string} filePath
     * @returns {Promise<string>}
     */
    async openFileExternal(filePath) {
      if (!filePath) return '';
      const ext = (filePath.split('.').pop() || '').toLowerCase();
      let mime = '*/*';
      if (['jpg', 'jpeg', 'png', 'webp', 'gif', 'bmp', 'svg'].includes(ext)) mime = 'image/*';
      else if (['mp4', 'mkv', 'webm', 'avi', 'mov'].includes(ext)) mime = 'video/*';
      else if (['mp3', 'wav', 'ogg', 'm4a', 'flac'].includes(ext)) mime = 'audio/*';
      else if (ext === 'pdf') mime = 'application/pdf';
      else if (['txt', 'log', 'json', 'py', 'js', 'sh', 'md', 'html', 'css', 'xml'].includes(ext)) mime = 'text/plain';
      else if (ext === 'apk') mime = 'application/vnd.android.package-archive';

      // Execute Android Intent
      return this.exec(`am start -a android.intent.action.VIEW -d "file://${filePath}" -t "${mime}" 2>&1`);
    }

    /**
     * Gets file statistics (size, timestamp, permissions)
     * @param {string} filePath
     * @returns {Promise<Object>}
     */
    async getFileStats(filePath) {
      if (!filePath) return null;
      try {
        const out = await this.exec(`stat -c "%s|%Y|%a|%F" "${filePath}" 2>/dev/null`);
        if (out && out.includes('|')) {
          const [size, mtime, perms, type] = out.trim().split('|');
          return {
            sizeBytes: parseInt(size, 10) || 0,
            lastModified: (parseInt(mtime, 10) || 0) * 1000,
            permissions: perms || '644',
            isDir: type.toLowerCase().includes('directory'),
            typeStr: type || 'file'
          };
        }
      } catch (_) {}
      return null;
    }


    /**
     * Gets real core engine port
     */
    getEnginePort() {
      const b = this.bridge;
      if (b && typeof b.getEnginePort === 'function') {
        try {
          const p = b.getEnginePort();
          if (p && p > 0) return p;
        } catch (_) {}
      }
      return 45170;
    }

    /**
     * Gets CSRF token from engine
     */
    getCsrfToken() {
      const b = this.bridge;
      if (b && typeof b.getCsrfToken === 'function') {
        try {
          return b.getCsrfToken() || '';
        } catch (_) {}
      }
      return '';
    }

    /**
     * Opens URL in external browser or intent
     */
    async openExternalUrl(url) {
      if (!url) return;
      return this.exec(`am start -a android.intent.action.VIEW -d "${url}" 2>/dev/null`);
    }

    /**
     * Human-readable byte formatting
     */
    _formatSize(bytes, isDir) {
      if (isDir) return '';
      if (!bytes || bytes === 0) return '0 B';
      if (bytes >= 1024 * 1024 * 1024) return (bytes / (1024 * 1024 * 1024)).toFixed(1) + ' GB';
      if (bytes >= 1024 * 1024) return (bytes / (1024 * 1024)).toFixed(1) + ' MB';
      if (bytes >= 1024) return (bytes / 1024).toFixed(1) + ' KB';
      return bytes + ' B';
    }

    // Compatibility methods for existing codebase
    async getFiles(path) {
      return this.listFiles(path);
    }

    async readDirectory(path) {
      return this.listFiles(path);
    }
  }

  // Export Singleton
  const bridgeInstance = new SystemBridge();
  window.SystemBridge = bridgeInstance;
  window.BridgeConnector = bridgeInstance;
  window.ApiService = bridgeInstance;
})(window);
