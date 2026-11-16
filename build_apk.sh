#!/usr/bin/env bash
# ==============================================================================
# Antigravity Pro — Automated APK Assembly & Signing Script
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=== [1/5] Проверка сжатых системных библиотек ==="
if [ -f "assets/runtime/bin/liblanguage_server.so.gz" ]; then
    if [ ! -f "assets/runtime/bin/liblanguage_server.so" ] || [ $(wc -c < "assets/runtime/bin/liblanguage_server.so") -lt 100000000 ]; then
        echo "Распаковка assets/runtime/bin/liblanguage_server.so.gz (173 MB)..."
        gunzip -k -f assets/runtime/bin/liblanguage_server.so.gz
    fi
fi

echo "=== [2/5] Сборка APK через Apktool ==="
rm -f app-unsigned.apk AntigravityPro_aligned.apk AntigravityPro_Parallel.apk
apktool b . -o app-unsigned.apk

echo "=== [3/5] Выравнивание (zipalign 4-byte) ==="
zipalign -p -f 4 app-unsigned.apk AntigravityPro_aligned.apk

echo "=== [4/5] Подписание APK (apksigner) ==="
KEYSTORE="/data/user/0/com.agy/files/android-sdk/debug.keystore"
if [ ! -f "$KEYSTORE" ]; then
    KEYSTORE="./debug.keystore"
    if [ ! -f "$KEYSTORE" ]; then
        echo "Генерация локального debug.keystore..."
        keytool -genkeypair -v -keystore "$KEYSTORE" -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Antigravity,O=AGY,C=RU"
    fi
fi

apksigner sign --ks "$KEYSTORE" --ks-pass pass:android --key-pass pass:android --out AntigravityPro_Parallel.apk AntigravityPro_aligned.apk

echo "=== [5/5] Проверка подписи ==="
apksigner verify AntigravityPro_Parallel.apk
echo "Готово! Собранный подписанный пакет: $PWD/AntigravityPro_Parallel.apk"
