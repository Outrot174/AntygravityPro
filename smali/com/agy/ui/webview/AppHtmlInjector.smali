.class public final Lcom/agy/ui/webview/AppHtmlInjector;
.super Ljava/lang/Object;
.source "AppHtmlInjector.java"


# static fields
.field private static final CSP:Ljava/lang/String; = "default-src \'self\' https: data: blob:; script-src \'self\' \'unsafe-inline\' \'unsafe-eval\' blob:; style-src \'self\' \'unsafe-inline\' https:; img-src \'self\' https: data: blob:; font-src \'self\' https: data:; connect-src \'self\' https: wss:; frame-src https: data: blob:; worker-src \'self\' blob:; object-src \'none\'; base-uri \'self\'"

.field private static final READY_SCRIPT:Ljava/lang/String; = "./generated/patches/startup_ready.js"

.field private static final TAG:Ljava/lang/String; = "WebViewHost"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static inject(Ljava/lang/String;Lcom/agy/bridge/AndroidBridge;Lcom/agy/theme/ThemeManager;)Ljava/lang/String;
    .locals 4

    .line 30
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/agy/bridge/AndroidBridge;->getConfig()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 31
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 32
    invoke-virtual {p1}, Lcom/agy/bridge/AndroidBridge;->getEngineBaseUrl()Ljava/lang/String;

    move-result-object v2

    .line 33
    const-string v3, "core"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    const-string v3, "core_http"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    const-string v2, "enginePort"

    invoke-virtual {p1}, Lcom/agy/bridge/AndroidBridge;->getEnginePort()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 36
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<meta http-equiv=\"Content-Security-Policy\" content=\"default-src \'self\' https: data: blob:; script-src \'self\' \'unsafe-inline\' \'unsafe-eval\' blob:; style-src \'self\' \'unsafe-inline\' https:; img-src \'self\' https: data: blob:; font-src \'self\' https: data:; connect-src \'self\' https: wss:; frame-src https: data: blob:; worker-src \'self\' blob:; object-src \'none\'; base-uri \'self\'\"><script>(function(){window.__APP_CONFIG__="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 38
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ";window.__AG_ENDPOINTS__="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 39
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";window.__AG_CSRF__="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 40
    invoke-virtual {p1}, Lcom/agy/bridge/AndroidBridge;->getCsrfToken()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";window.__AG_HOST_THEME__="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    const-string v1, "light"

    if-eqz p2, :cond_0

    :try_start_1
    invoke-virtual {p2}, Lcom/agy/theme/ThemeManager;->mode()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    const-string v2, "dark"

    goto :goto_0

    .line 43
    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/agy/theme/ThemeManager;->mode()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    move-object v2, v1

    goto :goto_0

    :cond_1
    const-string v2, "system"

    .line 42
    :goto_0
    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ";window.__AG_RESOLVED_THEME__="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 45
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/agy/theme/ThemeManager;->getTheme()Ljava/lang/String;

    move-result-object v1

    :cond_2
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, ";window.__AG_NATIVE_BRIDGE_TOKEN__="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 47
    invoke-virtual {p1}, Lcom/agy/bridge/AndroidBridge;->getBlobBridgeToken()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ";window.AndroidBridge=window.Android;window.dialog={showOpenDialog:function(){return new Promise(function(resolve){window.__onDirectoryPicked=function(path){resolve(path);};if(window.Android&&typeof window.Android.openDirectoryPicker===\'function\'){window.Android.openDirectoryPicker();}else{resolve(null);}});}};})();</script><script src=\""

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "./generated/patches/startup_ready.js"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\"></script>"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 57
    nop

    .line 58
    const-string p2, "<head>"

    invoke-virtual {p0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 59
    if-ltz v0, :cond_3

    .line 60
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr v0, p2

    .line 61
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, "\n"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 63
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 54
    :catch_0
    move-exception p1

    .line 55
    const-string p2, "WebViewHost"

    const-string v0, "config injection failed"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    return-object p0
.end method
