.class public Lcom/agy/ui/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

# interfaces
.implements Lcom/agy/ui/webview/WebViewHost$Listener;
.implements Lcom/agy/ui/webview/AgyWebChromeClient$FileChooserCallback;


# static fields
.field private static final POLL_READY_INTERVAL_MS:J = 0x3e8L

.field private static final POLL_STARTUP_INTERVAL_MS:J = 0x32L

.field public static final REQUEST_DIR_CHOOSER:I = 0x7d2

.field private static final REQUEST_FILE_CHOOSER:I = 0x3ea

.field private static final REQUEST_STORAGE:I = 0x64

.field private static final SPLASH_TIMEOUT_MS:J = 0xea60L

.field private static final TAG:Ljava/lang/String; = "MainActivity"

.field public static volatile activeActivity:Lcom/agy/ui/MainActivity;


# instance fields
.field private activityResumed:Z

.field private androidBridge:Lcom/agy/bridge/AndroidBridge;

.field private appLoaded:Z

.field private filePathCallback:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private final handler:Landroid/os/Handler;

.field private loadedGeneration:I

.field private oauthManager:Lcom/agy/oauth/OAuthManager;

.field private final pollServer:Ljava/lang/Runnable;

.field private rootLayout:Landroid/widget/FrameLayout;

.field private runtimeManager:Lcom/agy/runtime/RuntimeManager;

.field private shizukuBridge:Lcom/agy/shell/ShizukuBridge;

.field private splash:Lcom/agy/ui/splash/SplashController;

.field private splashDeadline:J

.field private themeManager:Lcom/agy/theme/ThemeManager;

.field private webViewHost:Lcom/agy/ui/webview/WebViewHost;


# direct methods
.method public static synthetic $r8$lambda$Qndu6nXNeFHE8tNRWYM0wCYdDzI(Lcom/agy/ui/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/agy/ui/MainActivity;->startCoreService()V

    return-void
.end method

.method public static synthetic $r8$lambda$nHRSsE1RPT7E2-c9hauZKWBtgHU(Lcom/agy/ui/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/agy/ui/MainActivity;->retryCore()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 49
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/ui/MainActivity;->appLoaded:Z

    .line 73
    iput-boolean v0, p0, Lcom/agy/ui/MainActivity;->activityResumed:Z

    .line 74
    const/4 v0, -0x1

    iput v0, p0, Lcom/agy/ui/MainActivity;->loadedGeneration:I

    .line 77
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/agy/ui/MainActivity;->handler:Landroid/os/Handler;

    .line 83
    new-instance v0, Lcom/agy/ui/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/agy/ui/MainActivity$1;-><init>(Lcom/agy/ui/MainActivity;)V

    iput-object v0, p0, Lcom/agy/ui/MainActivity;->pollServer:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/agy/ui/MainActivity;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/agy/ui/MainActivity;->watchCore()V

    return-void
.end method

.method static synthetic access$100(Lcom/agy/ui/MainActivity;)Z
    .locals 0

    .line 49
    iget-boolean p0, p0, Lcom/agy/ui/MainActivity;->activityResumed:Z

    return p0
.end method

.method static synthetic access$200(Lcom/agy/ui/MainActivity;)Z
    .locals 0

    .line 49
    iget-boolean p0, p0, Lcom/agy/ui/MainActivity;->appLoaded:Z

    return p0
.end method

.method static synthetic access$300(Lcom/agy/ui/MainActivity;)Landroid/os/Handler;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/agy/ui/MainActivity;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/agy/ui/MainActivity;)Lcom/agy/ui/splash/SplashController;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    return-object p0
.end method

.method static synthetic access$500(Lcom/agy/ui/MainActivity;)Lcom/agy/ui/webview/WebViewHost;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    return-object p0
.end method

.method private refreshTheme()V
    .locals 4

    .line 308
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->themeManager:Lcom/agy/theme/ThemeManager;

    iget-object v1, p0, Lcom/agy/ui/MainActivity;->rootLayout:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    iget-object v3, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    invoke-static {p0, v0, v1, v2, v3}, Lcom/agy/ui/lifecycle/ThemeRefresher;->refresh(Landroid/app/Activity;Lcom/agy/theme/ThemeManager;Landroid/view/View;Lcom/agy/ui/splash/SplashController;Lcom/agy/ui/webview/WebViewHost;)V

    .line 309
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->themeManager:Lcom/agy/theme/ThemeManager;

    if-eqz v0, :cond_0

    .line 310
    invoke-virtual {v0}, Lcom/agy/theme/ThemeManager;->isDark()Z

    move-result v0

    invoke-static {v0}, Lcom/agy/theme/LauncherIconSwitcher;->scheduleSwitch(Z)V

    .line 312
    :cond_0
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 313
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->themeManager:Lcom/agy/theme/ThemeManager;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/agy/theme/ThemeManager;->getTheme()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, "light"

    .line 314
    :goto_0
    iget-object v1, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    invoke-virtual {v1}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "window.__AG_RESOLVED_THEME__=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'; window.__agOnSystemThemeChanged && window.__agOnSystemThemeChanged();"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 317
    :cond_2
    return-void
.end method

.method private requestStoragePermissions()V
    .locals 3

    .line 327
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1

    .line 329
    :try_start_0
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    if-nez v0, :cond_0

    .line 330
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 332
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "package:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/agy/ui/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 333
    invoke-virtual {p0, v0}, Lcom/agy/ui/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    :cond_0
    :goto_0
    goto :goto_1

    .line 335
    :catch_0
    move-exception v0

    .line 337
    :try_start_1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/agy/ui/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 340
    goto :goto_0

    .line 339
    :catch_1
    move-exception v0

    goto :goto_0

    .line 342
    :cond_1
    nop

    .line 343
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-virtual {p0, v0}, Lcom/agy/ui/MainActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    if-nez v1, :cond_2

    .line 345
    invoke-virtual {p0, v2}, Lcom/agy/ui/MainActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_3

    .line 347
    :cond_2
    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/agy/ui/MainActivity;->requestPermissions([Ljava/lang/String;I)V

    .line 353
    :cond_3
    :goto_1
    return-void
.end method

.method private retryCore()V
    .locals 4

    .line 186
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v0}, Lcom/agy/ui/splash/SplashController;->clearFatal()V

    .line 187
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/ui/MainActivity;->appLoaded:Z

    .line 188
    const/4 v0, -0x1

    iput v0, p0, Lcom/agy/ui/MainActivity;->loadedGeneration:I

    .line 189
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0xea60

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/agy/ui/MainActivity;->splashDeadline:J

    .line 190
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v0}, Lcom/agy/ui/splash/SplashController;->showLoading()V

    .line 191
    invoke-static {p0}, Lcom/agy/core/CoreServiceLauncher;->stop(Landroid/content/Context;)V

    .line 193
    :try_start_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/agy/ui/MainActivity;->runtimeManager:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v1}, Lcom/agy/runtime/RuntimeManager;->getRuntimeDir()Ljava/io/File;

    move-result-object v1

    const-string v2, ".installed"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 194
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 195
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    :cond_0
    goto :goto_0

    .line 197
    :catch_0
    move-exception v0

    .line 199
    :goto_0
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/agy/ui/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/agy/ui/MainActivity$$ExternalSyntheticLambda1;-><init>(Lcom/agy/ui/MainActivity;)V

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 200
    return-void
.end method

.method private startCoreService()V
    .locals 3

    .line 172
    :try_start_0
    invoke-static {p0}, Lcom/agy/core/CoreServiceLauncher;->start(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    goto :goto_1

    .line 173
    :catch_0
    move-exception v0

    .line 174
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot start core service: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 175
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 174
    invoke-virtual {p0, v0}, Lcom/agy/ui/MainActivity;->showFatalError(Ljava/lang/String;)V

    .line 177
    :goto_1
    return-void
.end method

.method private watchCore()V
    .locals 4

    .line 95
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 96
    if-eqz v0, :cond_1

    .line 97
    sget-boolean v1, Lcom/agy/core/CoreRuntimeState;->restarting:Z

    if-eqz v1, :cond_0

    .line 98
    iget-object v1, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v1, v0}, Lcom/agy/ui/splash/SplashController;->showTransient(Ljava/lang/String;)V

    goto :goto_0

    .line 100
    :cond_0
    iget-object v1, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v1, v0}, Lcom/agy/ui/splash/SplashController;->showFatalError(Ljava/lang/String;)V

    .line 102
    :goto_0
    return-void

    .line 104
    :cond_1
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz v0, :cond_5

    .line 105
    sget v0, Lcom/agy/core/CoreRuntimeState;->readyGeneration:I

    .line 106
    iget-boolean v1, p0, Lcom/agy/ui/MainActivity;->appLoaded:Z

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/agy/ui/MainActivity;->loadedGeneration:I

    if-lez v1, :cond_4

    if-eq v0, v1, :cond_4

    .line 107
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/agy/ui/MainActivity;->appLoaded:Z

    .line 108
    iput v0, p0, Lcom/agy/ui/MainActivity;->loadedGeneration:I

    .line 109
    iget-object v2, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v2}, Lcom/agy/ui/splash/SplashController;->clearFatal()V

    .line 110
    if-le v0, v1, :cond_3

    .line 111
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v0}, Lcom/agy/ui/splash/SplashController;->showLoading()V

    .line 113
    :cond_3
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->loadApp()V

    .line 114
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/agy/ui/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/agy/ui/MainActivity$2;-><init>(Lcom/agy/ui/MainActivity;)V

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 124
    :cond_4
    return-void

    .line 126
    :cond_5
    iget-boolean v0, p0, Lcom/agy/ui/MainActivity;->appLoaded:Z

    if-nez v0, :cond_6

    sget-object v0, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v0}, Lcom/agy/ui/splash/SplashController;->isFatalShown()Z

    move-result v0

    if-nez v0, :cond_6

    .line 127
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/agy/ui/MainActivity;->splashDeadline:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_6

    .line 128
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    const-string v1, "core did not start within 60s"

    invoke-virtual {v0, v1}, Lcom/agy/ui/splash/SplashController;->showFatalError(Ljava/lang/String;)V

    .line 130
    :cond_6
    return-void
.end method


# virtual methods
.method public dismissSplash()V
    .locals 2

    .line 214
    const-string v0, "MainActivity"

    const-string v1, "dismissSplash: fading out splashView (280ms)"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v0}, Lcom/agy/ui/splash/SplashController;->dismiss()V

    .line 216
    return-void
.end method

.method public isDesktopMode()Z
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->isDesktopMode()Z

    move-result v0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/agy/ui/webview/DesktopModePrefs;->isDesktopMode(Landroid/content/Context;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method public launchDirectoryPicker()V
    .locals 3

    .line 433
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 434
    const/16 v1, 0x41

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 436
    const/16 v1, 0x7d2

    invoke-virtual {p0, v0, v1}, Lcom/agy/ui/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 442
    goto :goto_0

    .line 437
    :catchall_0
    move-exception v0

    .line 438
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot launch directory picker: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MainActivity"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 440
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    const-string v1, "window.__onDirectoryPicked && window.__onDirectoryPicked(null);"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 443
    :cond_0
    :goto_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5

    .line 447
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 448
    const/16 v0, 0x7d2

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne p1, v0, :cond_2

    .line 449
    nop

    .line 450
    if-ne p2, v1, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 451
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 453
    :try_start_0
    invoke-virtual {p0}, Lcom/agy/ui/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2, p1, v3}, Lcom/agy/ui/MainActivity;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 454
    :catchall_0
    move-exception p2

    :goto_0
    nop

    .line 456
    :try_start_1
    invoke-virtual {p0}, Lcom/agy/ui/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-virtual {p2, p1, v3}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    .line 457
    :catchall_1
    move-exception p2

    :goto_1
    nop

    .line 458
    invoke-static {p0, p1}, Lcom/agy/util/DocumentsContractHelper;->resolveTreeUriToPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 460
    :cond_0
    iget-object p1, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 461
    nop

    .line 462
    iget-object p1, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    invoke-virtual {p1}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object p1

    new-instance p2, Lcom/agy/ui/MainActivity$3;

    invoke-direct {p2, p0, v2}, Lcom/agy/ui/MainActivity$3;-><init>(Lcom/agy/ui/MainActivity;Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->post(Ljava/lang/Runnable;)Z

    .line 471
    :cond_1
    return-void

    .line 473
    :cond_2
    const/16 v0, 0x3ea

    if-ne p1, v0, :cond_8

    .line 474
    iget-object p1, p0, Lcom/agy/ui/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    if-eqz p1, :cond_8

    .line 475
    nop

    .line 477
    :try_start_2
    invoke-static {p2, p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->parseResult(ILandroid/content/Intent;)[Landroid/net/Uri;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 480
    goto :goto_2

    .line 478
    :catchall_2
    move-exception p1

    .line 479
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "parseResult error: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MainActivity"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object p1, v2

    .line 481
    :goto_2
    const/4 v0, 0x0

    if-nez p1, :cond_5

    if-ne p2, v1, :cond_5

    if-eqz p3, :cond_5

    .line 482
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object p2

    .line 483
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Landroid/content/ClipData;->getItemCount()I

    move-result v1

    if-lez v1, :cond_3

    .line 484
    invoke-virtual {p2}, Landroid/content/ClipData;->getItemCount()I

    move-result p1

    new-array p1, p1, [Landroid/net/Uri;

    .line 485
    move p3, v0

    :goto_3
    invoke-virtual {p2}, Landroid/content/ClipData;->getItemCount()I

    move-result v1

    if-ge p3, v1, :cond_5

    .line 486
    invoke-virtual {p2, p3}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v1

    aput-object v1, p1, p3

    .line 485
    add-int/lit8 p3, p3, 0x1

    goto :goto_3

    .line 488
    :cond_3
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-eqz p2, :cond_4

    .line 489
    new-array p1, v3, [Landroid/net/Uri;

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    aput-object p2, p1, v0

    goto :goto_4

    .line 490
    :cond_4
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_5

    .line 491
    new-array p1, v3, [Landroid/net/Uri;

    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    aput-object p2, p1, v0

    .line 494
    :cond_5
    :goto_4
    if-eqz p1, :cond_7

    .line 495
    array-length p2, p1

    :goto_5
    if-ge v0, p2, :cond_7

    aget-object p3, p1, v0

    .line 496
    if-eqz p3, :cond_6

    .line 498
    :try_start_3
    invoke-virtual {p0}, Lcom/agy/ui/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p3, v3}, Lcom/agy/ui/MainActivity;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    goto :goto_6

    .line 499
    :catchall_3
    move-exception v1

    :goto_6
    nop

    .line 501
    :try_start_4
    invoke-virtual {p0}, Lcom/agy/ui/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p3, v3}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    goto :goto_7

    .line 502
    :catchall_4
    move-exception p3

    :goto_7
    nop

    .line 495
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 506
    :cond_7
    iget-object p2, p0, Lcom/agy/ui/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    invoke-interface {p2, p1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 507
    iput-object v2, p0, Lcom/agy/ui/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    .line 510
    :cond_8
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 321
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/agy/ui/lifecycle/BackNavigator;->handle(Landroid/webkit/WebView;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 322
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 324
    :cond_1
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 274
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 275
    invoke-direct {p0}, Lcom/agy/ui/MainActivity;->refreshTheme()V

    .line 276
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9

    .line 134
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 135
    sput-object p0, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    .line 136
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/agy/ui/MainActivity;->requestWindowFeature(I)Z

    .line 137
    invoke-virtual {p0}, Lcom/agy/ui/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, -0x80000000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 139
    new-instance p1, Lcom/agy/theme/ThemeManager;

    invoke-direct {p1, p0}, Lcom/agy/theme/ThemeManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/agy/ui/MainActivity;->themeManager:Lcom/agy/theme/ThemeManager;

    .line 140
    invoke-virtual {p1, p0}, Lcom/agy/theme/ThemeManager;->applyToActivity(Landroid/app/Activity;)V

    .line 143
    new-instance p1, Lcom/agy/oauth/OAuthManager;

    invoke-direct {p1}, Lcom/agy/oauth/OAuthManager;-><init>()V

    iput-object p1, p0, Lcom/agy/ui/MainActivity;->oauthManager:Lcom/agy/oauth/OAuthManager;

    .line 144
    new-instance p1, Lcom/agy/runtime/RuntimeManager;

    invoke-direct {p1, p0}, Lcom/agy/runtime/RuntimeManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/agy/ui/MainActivity;->runtimeManager:Lcom/agy/runtime/RuntimeManager;

    .line 145
    new-instance p1, Lcom/agy/shell/ShizukuBridge;

    invoke-direct {p1, p0}, Lcom/agy/shell/ShizukuBridge;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/agy/ui/MainActivity;->shizukuBridge:Lcom/agy/shell/ShizukuBridge;

    .line 146
    new-instance v0, Lcom/agy/bridge/AndroidBridge;

    iget-object v1, p0, Lcom/agy/ui/MainActivity;->runtimeManager:Lcom/agy/runtime/RuntimeManager;

    iget-object v2, p0, Lcom/agy/ui/MainActivity;->themeManager:Lcom/agy/theme/ThemeManager;

    invoke-direct {v0, p0, v1, p1, v2}, Lcom/agy/bridge/AndroidBridge;-><init>(Landroid/content/Context;Lcom/agy/runtime/RuntimeManager;Lcom/agy/shell/ShizukuBridge;Lcom/agy/theme/ThemeManager;)V

    iput-object v0, p0, Lcom/agy/ui/MainActivity;->androidBridge:Lcom/agy/bridge/AndroidBridge;

    .line 147
    invoke-virtual {v0, p0}, Lcom/agy/bridge/AndroidBridge;->setActivity(Lcom/agy/ui/MainActivity;)V

    .line 148
    new-instance p1, Lcom/agy/ui/webview/WebViewHost;

    iget-object v5, p0, Lcom/agy/ui/MainActivity;->themeManager:Lcom/agy/theme/ThemeManager;

    iget-object v6, p0, Lcom/agy/ui/MainActivity;->oauthManager:Lcom/agy/oauth/OAuthManager;

    iget-object v7, p0, Lcom/agy/ui/MainActivity;->androidBridge:Lcom/agy/bridge/AndroidBridge;

    move-object v3, p1

    move-object v4, p0

    move-object v8, p0

    invoke-direct/range {v3 .. v8}, Lcom/agy/ui/webview/WebViewHost;-><init>(Landroid/content/Context;Lcom/agy/theme/ThemeManager;Lcom/agy/oauth/OAuthManager;Lcom/agy/bridge/AndroidBridge;Lcom/agy/ui/webview/AgyWebChromeClient$FileChooserCallback;)V

    iput-object p1, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    .line 149
    invoke-virtual {p1, p0}, Lcom/agy/ui/webview/WebViewHost;->setListener(Lcom/agy/ui/webview/WebViewHost$Listener;)V

    .line 151
    new-instance p1, Landroid/widget/FrameLayout;

    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/agy/ui/MainActivity;->rootLayout:Landroid/widget/FrameLayout;

    .line 152
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->themeManager:Lcom/agy/theme/ThemeManager;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeManager;->getBackgroundColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 153
    iget-object p1, p0, Lcom/agy/ui/MainActivity;->rootLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Lcom/agy/ui/MainActivity;->setContentView(Landroid/view/View;)V

    .line 155
    iget-object p1, p0, Lcom/agy/ui/MainActivity;->rootLayout:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    invoke-static {}, Lcom/agy/util/ViewParams;->full()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    new-instance p1, Lcom/agy/ui/splash/SplashController;

    iget-object v0, p0, Lcom/agy/ui/MainActivity;->themeManager:Lcom/agy/theme/ThemeManager;

    iget-object v1, p0, Lcom/agy/ui/MainActivity;->rootLayout:Landroid/widget/FrameLayout;

    invoke-direct {p1, p0, v0, v1}, Lcom/agy/ui/splash/SplashController;-><init>(Landroid/content/Context;Lcom/agy/theme/ThemeManager;Landroid/widget/FrameLayout;)V

    iput-object p1, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    .line 158
    new-instance v0, Lcom/agy/ui/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/agy/ui/MainActivity$$ExternalSyntheticLambda0;-><init>(Lcom/agy/ui/MainActivity;)V

    invoke-virtual {p1, v0}, Lcom/agy/ui/splash/SplashController;->setRetryListener(Lcom/agy/ui/splash/SplashRetryListener;)V

    .line 159
    iget-object p1, p0, Lcom/agy/ui/MainActivity;->rootLayout:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v0}, Lcom/agy/ui/splash/SplashController;->view()Landroid/webkit/WebView;

    move-result-object v0

    invoke-static {}, Lcom/agy/util/ViewParams;->full()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 160
    iget-object p1, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {p1}, Lcom/agy/ui/splash/SplashController;->loadInitial()V

    .line 162
    iget-object p1, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {p1, p0}, Lcom/agy/ui/splash/SplashController;->installExitAnimation(Landroid/app/Activity;)V

    .line 164
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0xea60

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/agy/ui/MainActivity;->splashDeadline:J

    .line 165
    invoke-direct {p0}, Lcom/agy/ui/MainActivity;->requestStoragePermissions()V

    .line 167
    invoke-direct {p0}, Lcom/agy/ui/MainActivity;->startCoreService()V

    .line 168
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .line 232
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/ui/MainActivity;->activityResumed:Z

    .line 233
    sget-object v0, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    const/4 v1, 0x0

    if-ne v0, p0, :cond_0

    .line 234
    sput-object v1, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->handler:Landroid/os/Handler;

    invoke-static {v0}, Lcom/agy/ui/lifecycle/AppLifecycle;->destroy(Landroid/os/Handler;)V

    .line 237
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->androidBridge:Lcom/agy/bridge/AndroidBridge;

    if-eqz v0, :cond_1

    .line 238
    invoke-virtual {v0, v1}, Lcom/agy/bridge/AndroidBridge;->setActivity(Lcom/agy/ui/MainActivity;)V

    .line 240
    :cond_1
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->rootLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_2

    .line 241
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 243
    :cond_2
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz v0, :cond_3

    .line 244
    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 245
    if-eqz v0, :cond_3

    .line 247
    :try_start_0
    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 248
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 249
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 250
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 251
    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    goto :goto_0

    .line 252
    :catch_0
    move-exception v0

    .line 253
    const-string v1, "MainActivity"

    const-string v2, "error destroying webView"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 257
    :cond_3
    :goto_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 258
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 268
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 269
    invoke-virtual {p0, p1}, Lcom/agy/ui/MainActivity;->setIntent(Landroid/content/Intent;)V

    .line 270
    return-void
.end method

.method public onPageFinished(Ljava/lang/String;)V
    .locals 2

    .line 209
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPageFinished "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MainActivity"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 280
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/ui/MainActivity;->activityResumed:Z

    .line 281
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/agy/ui/MainActivity;->pollServer:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 282
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz v0, :cond_0

    .line 283
    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    invoke-static {v0}, Lcom/agy/ui/lifecycle/AppLifecycle;->pause(Landroid/webkit/WebView;)V

    .line 285
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 286
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    .line 514
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 515
    const/16 p2, 0x7d1

    if-ne p1, p2, :cond_1

    .line 516
    iget-object p2, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 517
    :goto_0
    invoke-static {p0, p2, p1, p3}, Lcom/agy/ui/download/FileDownloader;->onPermissionResult(Landroid/app/Activity;Landroid/webkit/WebView;I[I)V

    .line 519
    :cond_1
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 296
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 297
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/agy/ui/MainActivity;->activityResumed:Z

    .line 298
    sput-object p0, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    .line 299
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz v0, :cond_0

    .line 300
    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    invoke-static {v0}, Lcom/agy/ui/lifecycle/AppLifecycle;->resume(Landroid/webkit/WebView;)V

    .line 302
    :cond_0
    invoke-direct {p0}, Lcom/agy/ui/MainActivity;->refreshTheme()V

    .line 303
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/agy/ui/MainActivity;->pollServer:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 304
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/agy/ui/MainActivity;->pollServer:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 305
    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .line 358
    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/agy/ui/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 359
    invoke-interface {v0, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 360
    iput-object v2, v1, Lcom/agy/ui/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    .line 362
    :cond_0
    move-object/from16 v0, p2

    iput-object v0, v1, Lcom/agy/ui/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    .line 364
    nop

    .line 367
    const-string v3, "Select Media / Files"

    const-string v4, "MainActivity"

    if-eqz p3, :cond_2

    .line 369
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    move-result-object v0

    .line 370
    if-eqz v0, :cond_1

    .line 371
    invoke-static {v0, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 370
    :cond_1
    move-object v0, v2

    .line 375
    :goto_0
    goto :goto_1

    .line 373
    :catchall_0
    move-exception v0

    .line 374
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fileChooserParams.createIntent failed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    :cond_2
    move-object v0, v2

    :goto_1
    const-string v5, "android.intent.extra.ALLOW_MULTIPLE"

    const-string v6, "*/*"

    const-string v7, "android.intent.category.OPENABLE"

    const-string v8, "android.intent.action.GET_CONTENT"

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-nez v0, :cond_7

    .line 380
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 381
    invoke-virtual {v0, v7}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 382
    invoke-virtual {v0, v6}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 383
    if-eqz p3, :cond_6

    .line 384
    invoke-virtual/range {p3 .. p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    move-result-object v11

    .line 385
    if-eqz v11, :cond_5

    array-length v12, v11

    if-lez v12, :cond_5

    .line 386
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 387
    array-length v13, v11

    move v14, v9

    :goto_2
    if-ge v14, v13, :cond_4

    aget-object v15, v11, v14

    .line 388
    if-eqz v15, :cond_3

    const-string v2, "/"

    invoke-virtual {v15, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 389
    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v12, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 387
    :cond_3
    add-int/lit8 v14, v14, 0x1

    const/4 v2, 0x0

    goto :goto_2

    .line 392
    :cond_4
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 393
    new-array v2, v9, [Ljava/lang/String;

    invoke-interface {v12, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    const-string v11, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v0, v11, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 396
    :cond_5
    invoke-virtual/range {p3 .. p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->getMode()I

    move-result v2

    if-ne v2, v10, :cond_6

    .line 397
    invoke-virtual {v0, v5, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 400
    :cond_6
    invoke-static {v0, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    .line 404
    :cond_7
    const/16 v2, 0x3ea

    :try_start_1
    invoke-virtual {v1, v0, v2}, Lcom/agy/ui/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 405
    return v10

    .line 406
    :catchall_1
    move-exception v0

    move-object v3, v0

    .line 407
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Chooser failed, fallback to plain GET_CONTENT: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    :try_start_2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 410
    invoke-virtual {v0, v7}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 411
    invoke-virtual {v0, v6}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 412
    if-eqz p3, :cond_8

    .line 413
    invoke-virtual/range {p3 .. p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->getMode()I

    move-result v3

    if-ne v3, v10, :cond_8

    .line 414
    invoke-virtual {v0, v5, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 416
    :cond_8
    invoke-virtual {v1, v0, v2}, Lcom/agy/ui/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 417
    return v10

    .line 418
    :catchall_2
    move-exception v0

    .line 419
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot launch file chooser: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    iget-object v0, v1, Lcom/agy/ui/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    if-eqz v0, :cond_9

    .line 421
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 422
    iput-object v2, v1, Lcom/agy/ui/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    .line 424
    :cond_9
    return v9
.end method

.method protected onStop()V
    .locals 0

    .line 290
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 291
    invoke-static {p0}, Lcom/agy/theme/LauncherIconSwitcher;->onAppBackgrounded(Landroid/content/Context;)V

    .line 292
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 2

    .line 262
    invoke-super {p0, p1}, Landroid/app/Activity;->onTrimMemory(I)V

    .line 263
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    invoke-static {p1, v0, v1}, Lcom/agy/ui/lifecycle/AppLifecycle;->trimMemory(ILandroid/os/Handler;Lcom/agy/ui/webview/WebViewHost;)V

    .line 264
    return-void
.end method

.method public setDesktopMode(Z)V
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->webViewHost:Lcom/agy/ui/webview/WebViewHost;

    if-eqz v0, :cond_0

    .line 224
    invoke-virtual {v0, p1}, Lcom/agy/ui/webview/WebViewHost;->setDesktopMode(Z)V

    goto :goto_0

    .line 226
    :cond_0
    invoke-static {p0, p1}, Lcom/agy/ui/webview/DesktopModePrefs;->setDesktopMode(Landroid/content/Context;Z)V

    .line 228
    :goto_0
    return-void
.end method

.method public showFatalError(Ljava/lang/String;)V
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/agy/ui/MainActivity;->splash:Lcom/agy/ui/splash/SplashController;

    invoke-virtual {v0, p1}, Lcom/agy/ui/splash/SplashController;->showFatalError(Ljava/lang/String;)V

    .line 182
    return-void
.end method
