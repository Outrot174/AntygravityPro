.class public final Lcom/agy/bridge/EngineConfigJson;
.super Ljava/lang/Object;
.source "EngineConfigJson.java"


# instance fields
.field private final appContext:Landroid/content/Context;

.field private final engine:Lcom/agy/bridge/EngineBridge;

.field private final runtime:Lcom/agy/runtime/RuntimeManager;

.field private final shizuku:Lcom/agy/shell/ShizukuBridge;

.field private final theme:Lcom/agy/bridge/ThemeBridge;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/agy/runtime/RuntimeManager;Lcom/agy/bridge/EngineBridge;Lcom/agy/shell/ShizukuBridge;Lcom/agy/bridge/ThemeBridge;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/agy/bridge/EngineConfigJson;->appContext:Landroid/content/Context;

    .line 23
    iput-object p2, p0, Lcom/agy/bridge/EngineConfigJson;->runtime:Lcom/agy/runtime/RuntimeManager;

    .line 24
    iput-object p3, p0, Lcom/agy/bridge/EngineConfigJson;->engine:Lcom/agy/bridge/EngineBridge;

    .line 25
    iput-object p4, p0, Lcom/agy/bridge/EngineConfigJson;->shizuku:Lcom/agy/shell/ShizukuBridge;

    .line 26
    iput-object p5, p0, Lcom/agy/bridge/EngineConfigJson;->theme:Lcom/agy/bridge/ThemeBridge;

    .line 27
    return-void
.end method


# virtual methods
.method public get()Ljava/lang/String;
    .locals 3

    .line 31
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 32
    const-string v1, "productName"

    const-string v2, "antigravity-app"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    const-string v1, "csrfToken"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->engine:Lcom/agy/bridge/EngineBridge;

    invoke-virtual {v2}, Lcom/agy/bridge/EngineBridge;->getCsrfToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    const-string v1, "appVersion"

    const-string v2, "2.4.1"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    const-string v1, "appVersionCode"

    const/16 v2, 0x11

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 36
    const-string v1, "coreVersion"

    const-string v2, "2.11.0"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 37
    const-string v1, "releaseChannel"

    const-string v2, "stable"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 38
    const-string v1, "devMode"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 39
    const-string v1, "enginePort"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v2}, Lcom/agy/runtime/RuntimeManager;->getHttpsPort()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 40
    const-string v1, "engineBaseUrl"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->engine:Lcom/agy/bridge/EngineBridge;

    invoke-virtual {v2}, Lcom/agy/bridge/EngineBridge;->getBaseUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    const-string v1, "filesDir"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->appContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    const-string v1, "runtimeDir"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v2}, Lcom/agy/runtime/RuntimeManager;->getRuntimeDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    const-string v1, "home"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->appContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    const-string v1, "tmpDir"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->appContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    const-string v1, "appDataDir"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v2}, Lcom/agy/runtime/RuntimeManager;->getAppDataDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    const-string v1, "shizukuAvailable"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->shizuku:Lcom/agy/shell/ShizukuBridge;

    invoke-virtual {v2}, Lcom/agy/shell/ShizukuBridge;->isAvailable()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 47
    const-string v1, "theme"

    iget-object v2, p0, Lcom/agy/bridge/EngineConfigJson;->theme:Lcom/agy/bridge/ThemeBridge;

    invoke-virtual {v2}, Lcom/agy/bridge/ThemeBridge;->getTheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    const-string v0, "{}"

    return-object v0
.end method
