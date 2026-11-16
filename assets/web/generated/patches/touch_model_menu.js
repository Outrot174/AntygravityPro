(function(){
/**
 * patches/touch_model_menu/config.js - config, guard and bundle scope.
 *
 * First fragment: if the patch already installed, exit the whole IIFE.
 */
'use strict';

if (window.__agTouchModelMenu && window.__agTouchModelMenu.__installed) {
  return;
}

var CONFIG = {
  // selectors
  trigger: '[data-testid="model-selector-trigger"]',
  panel: '[data-testid="model-selector-panel"]',
  effortGroup: '[data-testid="model-selector-effort-group"]',
  effortOption: '[data-testid="model-selector-effort-option"]',
  modelItem: '[data-testid="model-selector-item"]',
  menuItemRole: '[role="menuitem"]',
  // observer root
  root: '#root',
  // behaviour
  fallbackDelayMs: 70,
  retryDelayMs: 260,
  reopenGuardMs: 400
};

/**
 * patches/touch_model_menu/state.js - mutable patch state.
 */
var state = {
  installed: false,
  hasTouch: false,
  rows: 0,
  groups: 0,
  lastOpenAt: 0,
  opens: 0,
  observer: null,
  scanTimer: 0
};

/**
 * patches/touch_model_menu/detect.js - input and submenu detection.
 */
function detectTouch() {
  try {
    if (navigator.maxTouchPoints > 0) return true;
    if ('ontouchstart' in window) return true;
    if (window.matchMedia && window.matchMedia('(pointer: coarse)').matches) return true;
    if (window.matchMedia && window.matchMedia('(any-pointer: coarse)').matches) return true;
  } catch (_) { /* ignore */ }
  return false;
}

function optionsOpen() {
  try {
    return document.querySelectorAll(CONFIG.effortOption).length > 0;
  } catch (_) {
    return false;
  }
}

function focusQuietly(el) {
  try { el.focus({ preventScroll: true }); } catch (_) {}
}

/**
 * patches/touch_model_menu/synth.js - synthetic pointer/mouse/key sequences.
 */
function dispatchPointerSequence(el) {
  var rect;
  try { rect = el.getBoundingClientRect(); } catch (_) { rect = null; }
  var cx = rect ? rect.left + rect.width / 2 : 0;
  var cy = rect ? rect.top + rect.height / 2 : 0;

  var pointerInit = {
    bubbles: true, cancelable: true, composed: true,
    clientX: cx, clientY: cy, pointerId: 1, pointerType: 'touch',
    isPrimary: true, button: 0, buttons: 0
  };
  var mouseInit = {
    bubbles: true, cancelable: true, composed: true,
    clientX: cx, clientY: cy, button: 0, buttons: 0
  };

  function fire(make) {
    try {
      var ev = make();
      ev.__agTouchSynthetic = true;
      el.dispatchEvent(ev);
    } catch (_) { /* PointerEvent may be unavailable */ }
  }

  fire(function () { return new PointerEvent('pointerover', pointerInit); });
  fire(function () { return new PointerEvent('pointerenter', pointerInit); });
  fire(function () { return new PointerEvent('pointermove', pointerInit); });
  fire(function () { return new MouseEvent('mouseover', mouseInit); });
  fire(function () { return new MouseEvent('mouseenter', mouseInit); });
  fire(function () { return new MouseEvent('mousemove', mouseInit); });
}

function arrowRight(el) {
  try {
    var ev = new KeyboardEvent('keydown', {
      key: 'ArrowRight', code: 'ArrowRight', keyCode: 39, which: 39,
      bubbles: true, cancelable: true, composed: true
    });
    ev.__agTouchSynthetic = true;
    el.dispatchEvent(ev);
  } catch (_) {}
}

/**
 * patches/touch_model_menu/open.js - open the effort submenu on tap.
 */
function openSubmenu(row) {
  var now = Date.now();
  if (now - state.lastOpenAt < CONFIG.reopenGuardMs) return;
  state.lastOpenAt = now;
  state.opens++;

  focusQuietly(row);
  dispatchPointerSequence(row);

  // Fallback: ArrowRight opens a focused Base UI submenu trigger.
  setTimeout(function () {
    if (!optionsOpen()) arrowRight(row);
  }, CONFIG.fallbackDelayMs);
  setTimeout(function () {
    if (!optionsOpen()) arrowRight(row);
  }, CONFIG.retryDelayMs);
}

/**
 * patches/touch_model_menu/register.js - capture-phase row handlers.
 */
function makeHandler(row) {
  return function (event) {
    if (event.__agTouchSynthetic) return;
    if (typeof event.button === 'number' && event.button !== 0) return;
    // Cancel the select-default in the capture phase, before React sees it.
    event.preventDefault();
    event.stopPropagation();
    event.stopImmediatePropagation();
    openSubmenu(row);
  };
}

function registerRow(row) {
  if (!row || row.__agTouchManaged) return false;
  row.__agTouchManaged = true;
  var handler = makeHandler(row);
  row.addEventListener('pointerdown', handler, true);
  row.addEventListener('mousedown', handler, true);
  row.addEventListener('click', handler, true);
  state.rows++;
  return true;
}

/**
 * patches/touch_model_menu/scan.js - debounced DOM scan for effort groups.
 */

// Trailing debounce: DOM mutates constantly while a reply streams. A rAF scan
// would run at screen refresh (60-120 Hz); coalesce to one pass.
var SCAN_DEBOUNCE_MS = 180;

function scan() {
  var groups = [];
  try {
    groups = document.querySelectorAll(CONFIG.effortGroup);
  } catch (_) {
    groups = [];
  }
  state.groups = groups.length;
  for (var i = 0; i < groups.length; i++) {
    var group = groups[i];
    var row = (group.closest && group.closest(CONFIG.menuItemRole)) || group.parentElement || group;
    registerRow(row);
  }
}

function scheduleScan() {
  if (state.scanTimer) return;
  state.scanTimer = setTimeout(function () {
    state.scanTimer = 0;
    scan();
  }, SCAN_DEBOUNCE_MS);
}

/**
 * patches/touch_model_menu/install.js - arm the observer on touch devices.
 */
function install() {
  if (state.installed) return;
  state.hasTouch = detectTouch();
  state.installed = true;

  if (!state.hasTouch) {
    console.log('[agTouchModelMenu] no touch input detected; patch is a no-op.');
    return;
  }

  scan();

  var root = document.querySelector(CONFIG.root) || document.body || document.documentElement;
  if (window.MutationObserver && root) {
    state.observer = new MutationObserver(scheduleScan);
    state.observer.observe(root, { childList: true, subtree: true });
  }
  console.log('[agTouchModelMenu] active (rows=' + state.rows + ').');
}

/**
 * patches/touch_model_menu/public-api.js - expose probe and start.
 */
window.__agTouchModelMenu = {
  __installed: true,
  config: CONFIG,
  probe: function () {
    var groups = 0;
    var options = 0;
    try { groups = document.querySelectorAll(CONFIG.effortGroup).length; } catch (_) {}
    try { options = document.querySelectorAll(CONFIG.effortOption).length; } catch (_) {}
    return {
      installed: state.installed,
      hasTouch: state.hasTouch,
      rows: state.rows,
      groups: groups,
      options: options,
      submenuOpen: options > 0,
      opens: state.opens
    };
  }
};

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', install);
} else {
  install();
}


})();


// --- AGY I18N RU INJECTION ---

(function() {
  'use strict';

  if (window.__agI18nRuInstalled) return;
  window.__agI18nRuInstalled = true;

  var DICT = {
  "New Conversation": "Новый чат",
  "Conversations": "Диалоги",
  "Artifacts": "Артефакты",
  "Terminal": "Терминал",
  "Settings": "Настройки",
  "Overview": "Обзор",
  "Files": "Файлы",
  "Projects": "Проекты",
  "Commands": "Команды",
  "Logs": "Журнал",
  "Errors": "Ошибки",
  "Output": "Вывод",
  "Skills": "Навыки",
  "MCP": "Серверы MCP",
  "Agents": "Агенты",
  "Rules": "Правила",
  "Hooks": "Хуки",
  "Automations": "Автоматизации",
  "Scheduled Tasks": "Запланированные задачи",
  "Shortcuts": "Горячие клавиши",
  "Permissions": "Разрешения",
  "Open Launchpad": "Панель запуска",
  "Search Conversations": "Поиск диалогов",
  "Current workspace": "Текущий проект",
  "Open Workspace": "Открыть проект",
  "New Workspace": "Новый проект",
  "Workspace": "Проект",
  "Recent Files": "Недавние файлы",
  "Pinned Conversations": "Закрепленные диалоги",
  "Today": "Сегодня",
  "Yesterday": "Вчера",
  "Last 7 days": "Последние 7 дней",
  "Last 30 days": "Последние 30 дней",
  "Close Tab": "Закрыть вкладку",
  "New Tab": "Новая вкладка",
  "New Terminal Tab": "Новая вкладка терминала",
  "Split Terminal": "Разделить терминал",
  "Toggle Terminal": "Терминал",
  "Toggle File Viewer": "Проводник файлов",
  "Toggle Editor": "Редактор",
  "Toggle Auxiliary Pane": "Боковая панель",
  "Toggle Overview Panel": "Панель обзора",
  "Toggle Model Selector": "Выбор модели",
  "Open Command Palette": "Командная строка",
  "Open Conversation Picker": "Выбор диалога",
  "Jetski Web": "Antigravity",
  "Model Selection": "Выбор модели",
  "Model": "Модель",
  "Modes": "Режимы",
  "Autonomous Mode": "Автономный режим",
  "Thinking": "Размышление",
  "Thinking...": "Размышляю...",
  "Low": "Низкий",
  "Medium": "Средний",
  "High": "Высокий",
  "None": "Выкл",
  "Default": "По умолчанию",
  "Fast": "Быстрая",
  "Pair Programming": "Парное программирование",
  "Best of N": "Лучший из N",
  "Effort": "Усилие",
  "Thinking Effort": "Глубина размышлений",
  "Reasoning": "Рассуждение",
  "Appearance": "Внешний вид",
  "General": "Основные",
  "Browser": "Браузер",
  "Account": "Аккаунт",
  "Models": "Модели",
  "Customizations": "Кастомизация",
  "Notifications": "Уведомления",
  "App": "Приложение",
  "Developer": "Разработчик",
  "Chat Settings": "Настройки чата",
  "Context Menus": "Контекстные меню",
  "Execution": "Выполнение",
  "Suggestions": "Подсказки",
  "Navigation": "Навигация",
  "Context": "Контекст",
  "Advanced": "Дополнительно",
  "Quota": "Квота",
  "Theme": "Тема",
  "Theme Preference": "Выбор темы",
  "Dark": "Тёмная",
  "Light": "Светлая",
  "System": "Системная",
  "Auto": "Авто",
  "Desktop Mode": "Режим ПК",
  "Use desktop viewport and user agent": "Использовать десктопный интерфейс и User-Agent",
  "Allow List Terminal Commands": "Разрешенные команды",
  "Deny List Terminal Commands": "Запрещенные команды",
  "Agent Auto-Fix Lints": "Автоисправление ошибок",
  "Queued Messages": "Очередь сообщений",
  "Keep computer awake": "Не давать устройству засыпать",
  "Run in background": "Работа в фоновом режиме",
  "Auto check for updates": "Автопроверка обновлений",
  "Always Proceed": "Всегда продолжать",
  "Always Ask": "Всегда спрашивать",
  "Request Review": "Запрашивать подтверждение",
  "Turbo": "Турбо",
  "Close Settings": "Закрыть настройки",
  "Default Customizations": "Стандартные кастомизации",
  "Customize Global Skills": "Глобальные навыки",
  "Custom Agents": "Пользовательские агенты",
  "MCP Servers": "Серверы MCP",
  "Installed Skills": "Установленные навыки",
  "Installed MCP Servers": "Установленные серверы MCP",
  "Manage Skills": "Управление навыками",
  "Manage Hooks": "Управление хуками",
  "Notification Preferences": "Настройки уведомлений",
  "Enable Notifications": "Включить уведомления",
  "Sound": "Звуки",
  "Danger Zone": "Опасная зона",
  "Reset State": "Сбросить состояние",
  "Copy": "Копировать",
  "Copied": "Скопировано",
  "Cut": "Вырезать",
  "Paste": "Вставить",
  "Delete": "Удалить",
  "Delete Permanently": "Удалить навсегда",
  "Rename": "Переименовать",
  "Share": "Поделиться",
  "Archive": "В архив",
  "Restore": "Восстановить",
  "Archive / Restore": "Архив / Восстановить",
  "Undo": "Отменить",
  "Redo": "Повторить",
  "Select All": "Выбрать все",
  "Edit": "Редактировать",
  "Retry": "Повторить",
  "Cancel": "Отмена",
  "Save": "Сохранить",
  "Close": "Закрыть",
  "Close (Esc)": "Закрыть (Esc)",
  "Stop": "Остановить",
  "Send": "Отправить",
  "Attach": "Прикрепить",
  "Submit": "Отправить",
  "Skip": "Пропустить",
  "Proceed": "Продолжить",
  "Approve": "Разрешить",
  "Always Allow": "Всегда разрешать",
  "Reject": "Отклонить",
  "Accept Step": "Принять шаг",
  "Reject Step": "Отклонить шаг",
  "Proceed with Plan": "Выполнить план",
  "Continue Response": "Продолжить ответ",
  "Quote Selection": "Цитировать",
  "Add to Chat": "Добавить в чат",
  "Comment on Selection": "Комментировать",
  "Open in Code Search": "Поиск по коду",
  "Focus Input": "Поле ввода",
  "Zoom In": "Увеличить",
  "Zoom Out": "Уменьшить",
  "Reset Zoom": "Сбросить масштаб",
  "Find in Pane": "Поиск на панели",
  "Go Back": "Назад",
  "Go Forward": "Вперед",
  "Back": "Назад",
  "Next": "Далее",
  "Previous": "Назад",
  "Ready": "Готово",
  "Pending": "В ожидании",
  "Error": "Ошибка",
  "Success": "Успешно",
  "Failed": "Ошибка",
  "Completed": "Завершено",
  "Cancelled": "Отменено",
  "In progress": "Выполняется",
  "Queued": "В очереди",
  "Mark as Read": "Отметить как прочитанное",
  "Mark as Unread": "Отметить как непрочитанное",
  "Delete Conversation": "Удалить диалог",
  "Rename Conversation": "Переименовать диалог",
  "Clear Conversation": "Очистить диалог",
  "Open Keyboard Shortcuts": "Сочетания клавиш",
  "Download Diagnostics": "Скачать диагностику",
  "Running command": "Выполнение команды",
  "Analyzing directory": "Анализ каталога",
  "Searching the web": "Поиск в интернете",
  "Checking git status": "Проверка статуса git",
  "Running tests": "Запуск тестов",
  "Searching code": "Поиск по коду",
  "Reading file": "Чтение файла",
  "Editing file": "Редактирование файла",
  "Creating file": "Создание файла",
  "Directory analysis": "Анализ каталога",
  "Web search": "Поиск в интернете",
  "Git status check": "Проверка статуса git",
  "Test execution": "Выполнение тестов",
  "Code search": "Поиск по коду",
  "File view": "Просмотр файла",
  "File edit": "Правка файла",
  "File creation": "Создание файла",
  "Ask a question or describe a task...": "Задайте вопрос или опишите задачу...",
  "Ask anything...": "Спросите что угодно...",
  "Ask anything, @ to mention, / for actions": "Спросите что угодно, @ для упоминания, / для действий",
  "Ask anything, @ to mention": "Спросите что угодно, @ для упоминания",
  "Type a message...": "Введите сообщение...",
  "Search conversations...": "Поиск диалогов...",
  "Search file contents...": "Поиск по файлам...",
  "Search for commands...": "Поиск команд...",
  "Search for conversations...": "Поиск диалогов...",
  "Search projects...": "Поиск проектов...",
  "Search skills…": "Поиск навыков…",
  "Search...": "Поиск...",
  "Filter...": "Фильтр...",
  "Conversation name": "Название диалога",
  "Group name": "Название группы",
  "Write a comment...": "Написать комментарий...",
  "Other (write your answer)": "Другое (введите свой ответ)",
  "Prompt to execute on schedule...": "Запрос для выполнения по расписанию...",
  "Enter directory path...": "Введите путь к каталогу...",
  "Enter file or directory path...": "Введите путь к файлу или папке...",
  "Enter project name...": "Введите название проекта...",
  "Enter command (e.g., git, blaze)...": "Введите команду (например, git)...",
  "Artifact": "Артефакт",
  "Changes": "Изменения",
  "Diff": "Различия",
  "Original": "Исходный",
  "Modified": "Измененный",
  "Raw": "Исходный код",
  "Preview": "Предпросмотр",
  "Download": "Скачать",
  "Download SVG": "Скачать SVG",
  "Download PDF": "Скачать PDF",
  "Copy command": "Скопировать команду",
  "Copy output": "Скопировать вывод",
  "Copy path": "Скопировать путь"
};

  var EXCLUDED_TAGS = {
    CODE: true,
    PRE: true,
    SCRIPT: true,
    STYLE: true,
    NOSCRIPT: true,
    SVG: true,
    PATH: true
  };

  function isExcluded(node) {
    if (!node) return true;
    var el = node.nodeType === 1 ? node : node.parentElement;
    if (!el) return false;
    if (EXCLUDED_TAGS[el.tagName]) return true;

    if (el.closest('pre, code, .cm-editor, .monaco-editor, .syntax-highlighter, [data-language], [data-no-translate]')) {
      return true;
    }

    var messageBody = el.closest('.prose, .markdown-content, [data-testid="message-content"]');
    if (messageBody) {
      if (!el.closest('button, [role="button"], [role="menuitem"], .tool-card, [data-testid*="tool"], [data-testid*="step"]')) {
        return true;
      }
    }
    return false;
  }

  var REGEX_RULES = [
    { pattern: /^Thinking for (\d+)s$/i, replace: 'Размышление:  с' },
    { pattern: /^Thinking for (\d+)m (\d+)s$/i, replace: 'Размышление:  мин  с' },
    { pattern: /^(\d+) active modes?$/i, replace: ' акт. режима' },
    { pattern: /^Ask anything.*mention.*actions/i, replace: 'Спросите что угодно, @ для упоминания, / для действий' },
    { pattern: /^Ask anything.*mention/i, replace: 'Спросите что угодно, @ для упоминания' },
    { pattern: /^Last (\d+) days$/i, replace: 'Последние  дней' },
    { pattern: /^Previous (\d+) days$/i, replace: 'Предыдущие  дней' }
  ];

  function translateText(str) {
    if (!str || typeof str !== 'string') return str;
    var trimmed = str.trim();
    if (!trimmed) return str;

    if (DICT[trimmed]) {
      return str.replace(trimmed, DICT[trimmed]);
    }

    for (var i = 0; i < REGEX_RULES.length; i++) {
      var rule = REGEX_RULES[i];
      if (rule.pattern.test(trimmed)) {
        var res = trimmed.replace(rule.pattern, rule.replace);
        return str.replace(trimmed, res);
      }
    }

    return str;
  }

  function translateElementAttributes(el) {
    if (!el || el.nodeType !== 1) return;
    if (el.hasAttribute('placeholder')) {
      var ph = el.getAttribute('placeholder');
      var trPh = translateText(ph);
      if (trPh !== ph) el.setAttribute('placeholder', trPh);
    }
    if (el.hasAttribute('title')) {
      var ti = el.getAttribute('title');
      var trTi = translateText(ti);
      if (trTi !== ti) el.setAttribute('title', trTi);
    }
    if (el.hasAttribute('aria-label')) {
      var al = el.getAttribute('aria-label');
      var trAl = translateText(al);
      if (trAl !== al) el.setAttribute('aria-label', trAl);
    }
  }

  function translateDomNode(node) {
    if (!node) return;
    if (node.nodeType === 3) {
      if (!isExcluded(node)) {
        var val = node.nodeValue;
        if (val && /[a-zA-Z]/.test(val)) {
          var tr = translateText(val);
          if (tr !== val) {
            node.nodeValue = tr;
          }
        }
      }
    } else if (node.nodeType === 1) {
      if (isExcluded(node)) return;
      translateElementAttributes(node);
      for (var c = node.firstChild; c; c = c.nextSibling) {
        translateDomNode(c);
      }
    }
  }

  function hookReact(React) {
    if (!React || React.__i18n_hooked) return;
    React.__i18n_hooked = true;

    function wrapCreateElement(orig) {
      return function(type, props) {
        var args = Array.prototype.slice.call(arguments);
        if (props && typeof props === 'object') {
          if (typeof props.placeholder === 'string') props.placeholder = translateText(props.placeholder);
          if (typeof props.title === 'string') props.title = translateText(props.title);
          if (typeof props['aria-label'] === 'string') props['aria-label'] = translateText(props['aria-label']);
        }
        for (var i = 2; i < args.length; i++) {
          if (typeof args[i] === 'string' && /[a-zA-Z]/.test(args[i])) {
            args[i] = translateText(args[i]);
          }
        }
        return orig.apply(this, args);
      };
    }

    if (React.createElement) {
      React.createElement = wrapCreateElement(React.createElement);
    }

    var _origCreate = React.createElement;
    try {
      Object.defineProperty(React, 'createElement', {
        configurable: true,
        enumerable: true,
        get: function() { return _origCreate; },
        set: function(fn) { _origCreate = wrapCreateElement(fn); }
      });
    } catch (e) {}
  }

  try {
    if (window.React) {
      hookReact(window.React);
    } else {
      var _react = undefined;
      Object.defineProperty(window, 'React', {
        configurable: true,
        enumerable: true,
        get: function() { return _react; },
        set: function(val) {
          _react = val;
          if (val) {
            hookReact(val);
          }
        }
      });
    }
  } catch (e) {}

  var pendingQueue = [];
  var isScheduled = false;

  function flushBatch() {
    isScheduled = false;
    var queue = pendingQueue.splice(0, pendingQueue.length);
    for (var i = 0; i < queue.length; i++) {
      translateDomNode(queue[i]);
    }
  }

  function queueNode(node) {
    pendingQueue.push(node);
    if (!isScheduled) {
      isScheduled = true;
      if (window.requestAnimationFrame) {
        window.requestAnimationFrame(flushBatch);
      } else {
        setTimeout(flushBatch, 16);
      }
    }
  }

  var observer = new MutationObserver(function(mutations) {
    for (var i = 0; i < mutations.length; i++) {
      var mut = mutations[i];
      if (mut.type === 'childList') {
        for (var j = 0; j < mut.addedNodes.length; j++) {
          queueNode(mut.addedNodes[j]);
        }
      } else if (mut.type === 'characterData') {
        queueNode(mut.target);
      } else if (mut.type === 'attributes') {
        if (mut.target && mut.target.nodeType === 1) {
          translateElementAttributes(mut.target);
        }
      }
    }
  });

  function startObserver() {
    if (document.body) {
      observer.observe(document.body, {
        childList: true,
        subtree: true,
        characterData: true,
        attributes: true,
        attributeFilter: ['placeholder', 'title', 'aria-label']
      });
      translateDomNode(document.body);
    } else {
      document.addEventListener('DOMContentLoaded', startObserver);
    }
  }

  startObserver();

  // Periodic fallback sweep every 1.5 seconds
  setInterval(function() {
    if (document.body) translateDomNode(document.body);
  }, 1500);

  document.addEventListener('pointerdown', function(e) {
    var target = e.target;
    if (target && target.nodeType === 1) {
      setTimeout(function() {
        var openMenus = document.querySelectorAll('[role="menu"], [role="dialog"], [role="listbox"], [role="tooltip"], [data-testid*="panel"], [data-testid*="menu"], [data-floating-ui-portal]');
        for (var k = 0; k < openMenus.length; k++) {
          translateDomNode(openMenus[k]);
        }
      }, 50);
    }
  }, { capture: true, passive: true });

  window.__agTranslateUI = function() {
    if (document.body) translateDomNode(document.body);
  };

  console.log('[AGY i18n] Russian UI translation patch active.');
})();
