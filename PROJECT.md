# Паспорт проекта: Antigravity Pro (AntygravityPro)

---

## 1. Общие сведения о проекте

- **Название проекта:** Antigravity Pro
- **Имя репозитория GitHub:** `AntygravityPro`
- **Официальный GitHub:** [https://github.com/Outrot174/AntygravityPro](https://github.com/Outrot174/AntygravityPro)
- **Идентификатор пакета (Package ID):** `com.agy.pro`
- **Целевая платформа:** Android ARM64 (Linux Kernel 6.1+, aarch64, ARMv8.0-A+)
- **Тип приложения:** Мобильная рабочая станция / IDE для разработчиков с многооконным интерфейсом
- **Архитектурный стек:**
  - **Android Native Layer:** Smali / Dalvik bytecode, `AndroidBridge`, `DesktopNativeBridge`, `Runtime.getRuntime().exec()`.
  - **Web Viewport & UI:** HTML5, CSS3 (Quiet Luxury Design System), ES2022 JavaScript, Tailwind CSS.
  - **Linux Userspace Runtime:** Python 3.14+, Bash, PTY (Pseudo-Terminal), WebSocket Gateway (`:45170`, `:45175`).
  - **CI/CD:** GitHub Actions (`.github/workflows/build-apk.yml`), Apktool 2.10.0, zipalign, apksigner.

---

## 2. Ключевые компоненты и архитектура модулей

### 2.1. Оконный менеджер (`DesktopWindowManager`)
- **Файл:** `assets/web/generated/patches/window_manager.js`
- **Функционал:**
  - Управление жизненным циклом плавающих окон (создание, фокус, сворачивание, разворачивание, закрытие).
  - **Direct Drag Engine (60–120 FPS):** Обработка сенсорных событий через `requestAnimationFrame` и `transform: translate3d(...)` без лагов рендеринга.
  - **Динамический Z-Index:** Автоматический подъем активного окна над остальными при касании.
  - **Taskbar Docking:** Нижняя панель задач высотой 48px со свободным доступом к переключению окон («Студия», «Файлы», «Терминал», «Браузер», «aVNC»).
  - **Containing Block:** Четкая геометрия `#root` (`calc(100dvh - 48px)`) с защитой строки ввода от перекрытий.

### 2.2. Межоконная шина Drag & Drop (`UnifiedDragDropBus`)
- **Файл:** `assets/web/generated/patches/drag_drop_bus.js`
- **Функционал:**
  - Сенсорный и мышиный движок переноса файлов из Проводника в активный диалог Чита.
  - **Smart Mobile Translucency:** В момент перетаскивания окно проводника приобретает класс `.ag-dragging-translucent` (`opacity: 0.12`), открывая обзор на текстовое поле чата под ним.
  - **Интерактивный плавающий бейдж:** `📎 <имя_файла>` с тактильным откликом (Haptic Vibration).
  - **Прямая вставка в Lexical / ContentEditable:** Надежная вставка тега `@/путь/к/файлу ` со схлопыванием каретки и диспетчеризацией `ClipboardEvent('paste')` и `InputEvent('beforeinput')`.

### 2.3. Десктопный Проводник файлов (`module_explorer.js`)
- **Файл:** `assets/web/generated/patches/module_explorer.js`
- **Функционал:**
  - Быстрая навигация по структуре каталогов Android (`/storage/emulated/0`, `/data/user/0/...`).
  - **Меню трех точек (`⋮`):** Полноценное контекстное меню на каждом файле и папке (Открыть, Вставить в чат, Копировать, Вырезать, Переименовать, Свойства, Удалить).
  - Кнопка быстрого прикрепления: `+ В чат`.
  - Быстрые закладки: Память, Загрузки, Документы, DCIM, Картинки, Видео, Музыка, Antigravity, Linux Userspace, Home.

### 2.4. Полнофункциональный браузер (`module_browser.js`)
- **Файл:** `assets/web/generated/patches/module_browser.js`
- **Функционал:**
  - Полноценный браузерный движок на базе Chromium Android WebView.
  - Навигация HTTP/HTTPS, рендеринг DOM, выполнение JavaScript, сохранение cookies и сессий.
  - Панель управления: Назад, Вперед, Перезагрузить, Адресная строка, Поиск.

### 2.5. Нативный Linux PTY-терминал (`module_terminal.js`)
- **Файл:** `assets/web/generated/patches/module_terminal.js`
- **Функционал:**
  - Подключение к WebSocket шлюзу ядра (`/pty` на порту 45170) и прямому JSON-RPC мосту.
  - Запуск стандартных утилит Linux (`pwd`, `ls`, `uname -a`, `id`, `python`, `git`, `bash`).
  - Поддержка перетаскивания файлов прямо в терминал с автоматической экранировкой путей.

### 2.6. Встроенный VNC-клиент (`module_vnc.js`)
- **Файл:** `assets/web/generated/patches/module_vnc.js`
- **Функционал:**
  - Клиент удаленного рабочего стола по спецификации протокола **RFB 3.8**.
  - Поддержка аутентификации, согласования форматов пикселей (RGB888/BGR888), кодировок Raw и RRE.
  - Рендеринг на интерактивном Canvas 60 FPS с поддержкой масштабирования, кликов и экранной клавиатуры.

### 2.7. Дизайн-система Quiet Luxury
- **Файл:** `assets/web/generated/patches/quiet_luxury.css`
- **Палитра:**
  - Фон холста: `#0B0C0E` (Matte Carbon)
  - Тело плавающих окон: `#121418` (Titanium Dark)
  - Панели заголовков: `#181A20`
  - Тонкие микро-фаски: `#22242A`
  - Типографика: `#ECEEF2` (Bone-White) + `JetBrains Mono` (`tabular-nums`)

---

## 3. Сборка, упаковка и релиз

### Локальная сборка
Скрипт [`build_apk.sh`](build_apk.sh) автоматизирует полный цикл:
```bash
bash build_apk.sh
```
1. Распаковка системного бинарника `assets/runtime/bin/liblanguage_server.so.gz` (173 МБ).
2. Сборка APK через `Apktool`.
3. 4-байтовое выравнивание архива через `zipalign`.
4. Подписание схемы v2/v3 через `apksigner`.
5. Верификация подписи. Готовый файл: `AntigravityPro.apk`.

### Облачная сборка (CI/CD GitHub Actions)
Файл workflow: [`.github/workflows/build-apk.yml`](.github/workflows/build-apk.yml)
- Срабатывает автоматически при push в `main` или отправке релизного тега `v*`.
- Собирает, подписывает и выгружает `AntigravityPro.apk` в артефакты и релизы GitHub.

---

## 4. Безопасность и деперсонализация
- В кодовой базе отсутствуют приватные токены, ключи и личные данные.
- Имя устройства и версия Android определяются динамически через вызовы `android.os.Build.MODEL` и `android.os.Build.VERSION.RELEASE`.
