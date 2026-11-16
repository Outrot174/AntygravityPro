# Antigravity Pro (AntygravityPro)

<div align="center">

![Platform](https://img.shields.io/badge/Platform-Android%20ARM64-3DDC84?logo=android&logoColor=white)
![Package](https://img.shields.io/badge/Package-com.agy.pro-blue)
![Build](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?logo=github-actions&logoColor=white)
![UI](https://img.shields.io/badge/Design-Quiet%20Luxury-121418)

**Мощная многооконная рабочая станция нового поколения для Android ARM64 (AGY v2.4+)**

*Параллельная изолированная сборка с поддержкой плавающих окон, проводника файлов с Touch/Pointer Drag & Drop в чат, полнофункционального WebView-браузера, PTY-терминала и встроенного VNC-клиента.*

</div>

---

## 🌟 Ключевые возможности

### 1. 🪟 Десктопный многооконный менеджер (`DesktopWindowManager`)
- **Плавающие окна:** Свободное перемещение, изменение размеров, сворачивание в таскбар и разворачивание на весь экран.
- **Direct Drag Engine (60–120 FPS):** Обработка жестов на `requestAnimationFrame`, аппаратное ускорение `transform: translate3d(...)` и пружинная физика.
- **Многослойный Z-Index:** Автоматический подъем активного окна на передний план при касании или клике.

### 2. 📁 Проводник файлов Android (`module_explorer.js`)
- **Drag & Drop файлов прямо в чат:**
  - Плавное сенсорное перетаскивание (Touch & Pointer) файлов и каталогов из Проводника в активное поле ввода чата.
  - **Smart Mobile Translucency:** В момент перетаскивания окно проводника становится полупрозрачным (`opacity: 0.12`), открывая вид на диалог чата.
  - Плавающий бейдж с именем файла и тактильный виброотклик.
  - Автоматическая вставка тега `@/путь/к/файлу ` в редактор сообщений (Lexical/ContentEditable).
- **Контекстное меню трех точек (`⋮`):**
  - Быстрая кнопка `+ В чат` на каждой записи.
  - Меню операций: Открыть, Вставить в чат, Копировать, Вырезать, Переименовать, Свойства, Удалить.
- **Быстрые каталоги:** Мгновенный переход в Память, Загрузки, Документы, DCIM, Картинки, Музыку, Antigravity, Программы, Linux Userspace (`$PREFIX/usr`) и Home (`$HOME`).

### 3. 🌐 Полнофункциональный браузер (`module_browser.js`)
- Настоящий движок веб-серфинга на базе **Android WebView (Chromium)**.
- Полноценная навигация HTTP/HTTPS, выполнение JavaScript, рендеринг CSS, работа с формами, cookies и DOM Storage.
- Навигационная панель: Назад, Вперед, Обновить, Адресная строка, Поиск.

### 4. 💻 Нативный Linux PTY-терминал (`module_terminal.js`)
- Интеграция с локальным System Gateway через WebSocket (`/pty`) и JSON-RPC (`exec`).
- Корректная настройка путей и линкера (`LD_LIBRARY_PATH`, `$PREFIX/bin`), запуск бинарников ARM64 (`pwd`, `ls`, `whoami`, `uname`, `python`, `git`, `bash`).
- Моноширинный швейцарский шрифт `JetBrains Mono`.

### 5. 🖥️ Встроенный VNC-клиент (`module_vnc.js`)
- Полная реализация протокола **RFB 3.8**: аутентификация VNC, согласование формата пикселей (RGB888/BGR888), кодировки Raw и RRE.
- Интерактивный Canvas 60 FPS с поддержкой масштабирования, кликов, сенсорных жестов и экранной клавиатуры.

### 6. 🖤 Дизайн-система Quiet Luxury
- Благородная матовая палитра: `#0B0C0E` (основной фон), `#121418` (карточки окон), `#181A20` (панели заголовков), `#22242A` (титановые микро-фаски), `#ECEEF2` (контрастная швейцарская типографика).
- Идеальная геометрия вьюпорта: нижняя панель задач (`Taskbar`) 48px со свободным доступом к кнопкам окон и четкая фиксация поля ввода над таскбаром без наложений.

---

## 🏗 Архитектура проекта

```
AntygravityPro/
├── .github/workflows/
│   └── build-apk.yml           # CI/CD автоматическая сборка и подпись APK
├── AndroidManifest.xml         # Манифест приложения (com.agy.pro)
├── apktool.yml                 # Конфигурация декомпиляции/сборки Apktool
├── assets/
│   ├── env/                    # Системное окружение и bootstrap
│   ├── runtime/bin/            # Нативные исполняемые файлы ARM64
│   │   └── liblanguage_server.so.gz  # Сжатый бинарник ядра (173MB -> 51MB)
│   └── web/                    # Веб-интерфейс и движок патчей
│       ├── index.html          # Базовый HTML с <base href="/" />
│       └── generated/patches/
│           ├── drag_drop_bus.js     # Шина перетаскивания файлов в чат
│           ├── window_manager.js    # Оконный менеджер плавающих окон
│           ├── module_explorer.js   # Проводник файлов с меню трех точек
│           ├── module_browser.js    # WebView-браузер
│           ├── module_terminal.js   # Терминал PTY
│           ├── module_vnc.js        # VNC клиент RFB 3.8
│           └── quiet_luxury.css     # Стилизация Quiet Luxury
├── res/                        # Android-ресурсы, иконки, темы
├── smali/                      # Скомпилированный байт-код Dalvik/Smali
└── build_apk.sh                # Автоматический локальный скрипт сборки
```

---

## 🚀 Сборка через GitHub Actions

В репозитории настроен автоматический рабочий процесс **`.github/workflows/build-apk.yml`**:

1. При любом коммите в ветку `main` или отправке тега `v*` GitHub Actions автоматически:
   - Разворачивает JDK 17 и Android Build-Tools.
   - Распаковывает системную библиотеку `liblanguage_server.so.gz`.
   - Собирает APK через `Apktool`.
   - Выравнивает архив по 4-байтовой границе (`zipalign`).
   - Подписывает APK (`apksigner`).
    - Выгружает готовый артефакт **`AntigravityPro.apk`** в раздел Actions Artifacts или создает официальный GitHub Release.
2. Ручной запуск доступен через вкладку **Actions → Run workflow**.

---

## 🛠 Локальная сборка (на устройстве или в Linux)

Сборка выполняется одной командой:

```bash
bash build_apk.sh
```

Либо пошагово:

```bash
# 1. Распаковать системную библиотеку (если еще не распакована)
gunzip -k -f assets/runtime/bin/liblanguage_server.so.gz

# 2. Сборка пакета через Apktool
apktool b . -o app-unsigned.apk

# 3. Выравнивание 4-byte boundaries
zipalign -p -f 4 app-unsigned.apk AntigravityPro_aligned.apk

# 4. Подпись APK
apksigner sign --ks debug.keystore --ks-pass pass:android --key-pass pass:android --out AntigravityPro.apk AntigravityPro_aligned.apk

# 5. Проверка подписи
apksigner verify AntigravityPro.apk
```

---

## 📲 Установка на Android

Установка параллельного пакета на устройство через ADB:

```bash
adb install -r AntigravityPro.apk
```

Приложение устанавливается параллельно с базовым `com.agy` под идентификатором `com.agy.pro` и не конфликтует с существующими версиями.

---

## 👤 Автор

- **Разработчик:** Outrot174 ([GitHub](https://github.com/Outrot174))
- **Проект:** [AntygravityPro](https://github.com/Outrot174/AntygravityPro)
- **Лицензия:** MIT
