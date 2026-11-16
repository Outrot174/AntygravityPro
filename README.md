# Antigravity Pro (com.agy.pro)

Боевая параллельная сборка среды **Antigravity Pro** для Android ARM64 с многооконным оконным менеджером, нативным системным шлюзом и дизайн-системой Quiet Luxury.

---

## Архитектура проекта

1. **Ядро и многооконная среда:**
   - **`DesktopWindowManager`:** Управление Z-index, регистрация окон, Direct Drag Engine на `requestAnimationFrame`, Snap-to-Edge физика.
   - **`Taskbar` (48px):** Горизонтально скроллящаяся лента модулей («Студия», «Файлы», «Терминал», «Браузер», «aVNC»).
   - **Вьюпорт и Containing Block:** Точная калибровка геометрии `#root` (`calc(100dvh - 48px)`), `transform: translateZ(0)` и `contain: layout paint style`. Нулевое наложение поля ввода на панель задач.

2. **Нативные мосты (Android Bridge & Gateway):**
   - **`NativeExecBridge`:** Прямое выполнение shell-команд через `Runtime.getRuntime().exec()`.
   - **`AndroidBridge`:** Проброс CSRF-токена, базового порта ядра (`45170`), шлюза (`45175`) и выборки директорий.

3. **Стилистика (Quiet Luxury):**
   - Цветовая палитра: `#0B0C0E` (холст), `#121418` (окна), `#181A20` (заголовки), `#22242A` (границы), `#ECEEF2` (текст).
   - Шрифт консоли: `JetBrains Mono`.

---

## Инструкция по сборке

```bash
# 1. Сборка APK через Apktool
apktool -JDjava.io.tmpdir=/data/local/tmp b -o /storage/emulated/0/Antigravity/программы/AntigravityPro_unsigned.apk /storage/emulated/0/Antigravity/anty_decompiled

# 2. Выравнивание 4-byte boundaries
zipalign -f -p 4 /storage/emulated/0/Antigravity/программы/AntigravityPro_unsigned.apk /storage/emulated/0/Antigravity/программы/AntigravityPro_aligned.apk

# 3. Подпись APK (схемы v2 и v3)
apksigner sign --ks /data/user/0/com.agy/files/android-sdk/debug.keystore --ks-pass pass:android --key-pass pass:android --out /storage/emulated/0/Antigravity/программы/AntigravityPro_Parallel.apk /storage/emulated/0/Antigravity/программы/AntigravityPro_aligned.apk

# 4. Верификация подписи
apksigner verify -v /storage/emulated/0/Antigravity/программы/AntigravityPro_Parallel.apk
```
