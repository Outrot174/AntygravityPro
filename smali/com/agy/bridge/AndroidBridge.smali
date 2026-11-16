.class public final Lcom/agy/bridge/AndroidBridge;
.super Ljava/lang/Object;
.source "AndroidBridge.java"


# instance fields
.field private volatile activityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/agy/ui/MainActivity;",
            ">;"
        }
    .end annotation
.end field

.field private final blobBridgeToken:Ljava/lang/String;

.field private final config:Lcom/agy/bridge/EngineConfigJson;

.field private final engine:Lcom/agy/bridge/EngineBridge;

.field private final themeBridge:Lcom/agy/bridge/ThemeBridge;

.field private final ui:Lcom/agy/bridge/UiBridge;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/agy/runtime/RuntimeManager;Lcom/agy/shell/ShizukuBridge;Lcom/agy/theme/ThemeManager;)V
    .locals 7

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/agy/bridge/UiBridge;

    invoke-direct {v0}, Lcom/agy/bridge/UiBridge;-><init>()V

    iput-object v0, p0, Lcom/agy/bridge/AndroidBridge;->ui:Lcom/agy/bridge/UiBridge;

    .line 27
    invoke-static {}, Lcom/agy/bridge/AndroidBridge;->createBlobBridgeToken()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/agy/bridge/AndroidBridge;->blobBridgeToken:Ljava/lang/String;

    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 33
    new-instance v6, Lcom/agy/bridge/ThemeBridge;

    invoke-direct {v6, p4}, Lcom/agy/bridge/ThemeBridge;-><init>(Lcom/agy/theme/ThemeManager;)V

    iput-object v6, p0, Lcom/agy/bridge/AndroidBridge;->themeBridge:Lcom/agy/bridge/ThemeBridge;

    .line 34
    new-instance v4, Lcom/agy/bridge/EngineBridge;

    invoke-direct {v4, p2}, Lcom/agy/bridge/EngineBridge;-><init>(Lcom/agy/runtime/RuntimeManager;)V

    iput-object v4, p0, Lcom/agy/bridge/AndroidBridge;->engine:Lcom/agy/bridge/EngineBridge;

    .line 35
    new-instance p1, Lcom/agy/bridge/EngineConfigJson;

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/agy/bridge/EngineConfigJson;-><init>(Landroid/content/Context;Lcom/agy/runtime/RuntimeManager;Lcom/agy/bridge/EngineBridge;Lcom/agy/shell/ShizukuBridge;Lcom/agy/bridge/ThemeBridge;)V

    iput-object p1, p0, Lcom/agy/bridge/AndroidBridge;->config:Lcom/agy/bridge/EngineConfigJson;

    .line 36
    return-void
.end method

.method private static createBlobBridgeToken()Ljava/lang/String;
    .locals 8

    .line 154
    const/16 v0, 0x20

    new-array v1, v0, [B

    .line 155
    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 156
    const-string v2, "0123456789abcdef"

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 157
    const/16 v3, 0x40

    new-array v3, v3, [C

    .line 158
    const/4 v4, 0x0

    :goto_0
    if-ge v4, v0, :cond_0

    .line 159
    aget-byte v5, v1, v4

    and-int/lit16 v5, v5, 0xff

    .line 160
    mul-int/lit8 v6, v4, 0x2

    ushr-int/lit8 v7, v5, 0x4

    aget-char v7, v2, v7

    aput-char v7, v3, v6

    .line 161
    add-int/lit8 v6, v6, 0x1

    and-int/lit8 v5, v5, 0xf

    aget-char v5, v2, v5

    aput-char v5, v3, v6

    .line 158
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 163
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

.method private matchesNativeBridgeToken(Ljava/lang/String;)Z
    .locals 4

    .line 141
    const-string v0, "UTF-8"

    const/4 v1, 0x0

    if-nez p1, :cond_0

    .line 142
    return v1

    .line 145
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/agy/bridge/AndroidBridge;->blobBridgeToken:Ljava/lang/String;

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 146
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 147
    invoke-static {v2, p1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 148
    :catch_0
    move-exception p1

    .line 149
    return v1
.end method


# virtual methods
.method public getBlobBridgeToken()Ljava/lang/String;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->blobBridgeToken:Ljava/lang/String;

    return-object v0
.end method

.method public getConfig()Ljava/lang/String;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->config:Lcom/agy/bridge/EngineConfigJson;

    invoke-virtual {v0}, Lcom/agy/bridge/EngineConfigJson;->get()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCsrfToken()Ljava/lang/String;
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->engine:Lcom/agy/bridge/EngineBridge;

    invoke-virtual {v0}, Lcom/agy/bridge/EngineBridge;->getCsrfToken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEngineBaseUrl()Ljava/lang/String;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->engine:Lcom/agy/bridge/EngineBridge;

    invoke-virtual {v0}, Lcom/agy/bridge/EngineBridge;->getBaseUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEnginePort()I
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->engine:Lcom/agy/bridge/EngineBridge;

    invoke-virtual {v0}, Lcom/agy/bridge/EngineBridge;->getPort()I

    move-result v0

    return v0
.end method

.method public getTheme()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->themeBridge:Lcom/agy/bridge/ThemeBridge;

    invoke-virtual {v0}, Lcom/agy/bridge/ThemeBridge;->getTheme()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isDesktopMode()Z
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->ui:Lcom/agy/bridge/UiBridge;

    invoke-virtual {v0}, Lcom/agy/bridge/UiBridge;->isDesktopMode()Z

    move-result v0

    return v0
.end method

.method public isEngineReady()Z
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->engine:Lcom/agy/bridge/EngineBridge;

    invoke-virtual {v0}, Lcom/agy/bridge/EngineBridge;->isReady()Z

    move-result v0

    return v0
.end method

.method public onUiError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 66
    invoke-direct {p0, p1}, Lcom/agy/bridge/AndroidBridge;->matchesNativeBridgeToken(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 67
    iget-object p1, p0, Lcom/agy/bridge/AndroidBridge;->ui:Lcom/agy/bridge/UiBridge;

    invoke-virtual {p1, p2}, Lcom/agy/bridge/UiBridge;->onUiError(Ljava/lang/String;)V

    .line 69
    :cond_0
    return-void
.end method

.method public onUiReady(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 46
    invoke-direct {p0, p1}, Lcom/agy/bridge/AndroidBridge;->matchesNativeBridgeToken(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 47
    iget-object p1, p0, Lcom/agy/bridge/AndroidBridge;->ui:Lcom/agy/bridge/UiBridge;

    invoke-virtual {p1}, Lcom/agy/bridge/UiBridge;->onUiReady()V

    .line 49
    :cond_0
    return-void
.end method

.method public onVisualThemeChanged(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->themeBridge:Lcom/agy/bridge/ThemeBridge;

    invoke-virtual {v0, p1}, Lcom/agy/bridge/ThemeBridge;->onVisualThemeChanged(Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method public openDirectoryPicker()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->activityRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/agy/ui/MainActivity;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    .line 54
    :goto_0
    if-eqz v0, :cond_1

    .line 55
    new-instance v1, Lcom/agy/bridge/AndroidBridge$1;

    invoke-direct {v1, p0, v0}, Lcom/agy/bridge/AndroidBridge$1;-><init>(Lcom/agy/bridge/AndroidBridge;Lcom/agy/ui/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/agy/ui/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 62
    :cond_1
    return-void
.end method

.method public saveBlob(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 130
    invoke-direct {p0, p1}, Lcom/agy/bridge/AndroidBridge;->matchesNativeBridgeToken(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 131
    return-void

    .line 133
    :cond_0
    iget-object p1, p0, Lcom/agy/bridge/AndroidBridge;->activityRef:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/agy/bridge/AndroidBridge;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/agy/ui/MainActivity;

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    .line 134
    :goto_0
    if-eqz p1, :cond_2

    .line 135
    invoke-static {p1, p2, p3, p4}, Lcom/agy/ui/download/FileDownloader;->handleBlobData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    :cond_2
    return-void
.end method

.method public setActivity(Lcom/agy/ui/MainActivity;)V
    .locals 1

    .line 40
    if-eqz p1, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/agy/bridge/AndroidBridge;->activityRef:Ljava/lang/ref/WeakReference;

    .line 41
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->ui:Lcom/agy/bridge/UiBridge;

    invoke-virtual {v0, p1}, Lcom/agy/bridge/UiBridge;->setActivity(Lcom/agy/ui/MainActivity;)V

    .line 42
    return-void
.end method

.method public setDesktopMode(Z)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 98
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->ui:Lcom/agy/bridge/UiBridge;

    invoke-virtual {v0, p1}, Lcom/agy/bridge/UiBridge;->setDesktopMode(Z)V

    .line 99
    return-void
.end method

.method public setTheme(Ljava/lang/String;)Z
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 73
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->themeBridge:Lcom/agy/bridge/ThemeBridge;

    invoke-virtual {v0, p1}, Lcom/agy/bridge/ThemeBridge;->setTheme(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public setThemeByUser(Ljava/lang/String;)Z
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 78
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge;->themeBridge:Lcom/agy/bridge/ThemeBridge;

    invoke-virtual {v0, p1}, Lcom/agy/bridge/ThemeBridge;->setThemeByUser(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public execShell(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    new-instance v0, Lcom/agy/bridge/NativeExecBridge;

    invoke-direct {v0}, Lcom/agy/bridge/NativeExecBridge;-><init>()V

    invoke-virtual {v0, p1}, Lcom/agy/bridge/NativeExecBridge;->execShell(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public listDirJson(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    new-instance v0, Lcom/agy/bridge/NativeExecBridge;

    invoke-direct {v0}, Lcom/agy/bridge/NativeExecBridge;-><init>()V

    invoke-virtual {v0, p1}, Lcom/agy/bridge/NativeExecBridge;->listDirJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    new-instance v0, Lcom/agy/bridge/NativeExecBridge;

    invoke-direct {v0}, Lcom/agy/bridge/NativeExecBridge;-><init>()V

    invoke-virtual {v0, p1}, Lcom/agy/bridge/NativeExecBridge;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    new-instance v0, Lcom/agy/bridge/NativeExecBridge;

    invoke-direct {v0}, Lcom/agy/bridge/NativeExecBridge;-><init>()V

    invoke-virtual {v0, p1, p2}, Lcom/agy/bridge/NativeExecBridge;->writeFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
