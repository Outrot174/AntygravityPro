.class public final Lcom/agy/ui/webview/WebViewHost;
.super Ljava/lang/Object;
.source "WebViewHost.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/agy/ui/webview/WebViewHost$Listener;
    }
.end annotation


# static fields
.field public static final DESKTOP_UA:Ljava/lang/String; = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Antigravity/2.11.0"


# instance fields
.field private final bridge:Lcom/agy/bridge/AndroidBridge;

.field private final context:Landroid/content/Context;

.field private listener:Lcom/agy/ui/webview/WebViewHost$Listener;

.field private final oauth:Lcom/agy/oauth/OAuthManager;

.field private final theme:Lcom/agy/theme/ThemeManager;

.field private final webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/agy/theme/ThemeManager;Lcom/agy/oauth/OAuthManager;Lcom/agy/bridge/AndroidBridge;)V
    .locals 6

    .line 64
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/agy/ui/webview/WebViewHost;-><init>(Landroid/content/Context;Lcom/agy/theme/ThemeManager;Lcom/agy/oauth/OAuthManager;Lcom/agy/bridge/AndroidBridge;Lcom/agy/ui/webview/AgyWebChromeClient$FileChooserCallback;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/agy/theme/ThemeManager;Lcom/agy/oauth/OAuthManager;Lcom/agy/bridge/AndroidBridge;Lcom/agy/ui/webview/AgyWebChromeClient$FileChooserCallback;)V
    .locals 8

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/agy/ui/webview/WebViewHost;->context:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/agy/ui/webview/WebViewHost;->theme:Lcom/agy/theme/ThemeManager;

    .line 35
    iput-object p3, p0, Lcom/agy/ui/webview/WebViewHost;->oauth:Lcom/agy/oauth/OAuthManager;

    .line 36
    iput-object p4, p0, Lcom/agy/ui/webview/WebViewHost;->bridge:Lcom/agy/bridge/AndroidBridge;

    .line 37
    invoke-static {p1, p4, p2}, Lcom/agy/ui/webview/WebViewFactory;->create(Landroid/content/Context;Lcom/agy/bridge/AndroidBridge;Lcom/agy/theme/ThemeManager;)Landroid/webkit/WebView;

    move-result-object p2

    iput-object p2, p0, Lcom/agy/ui/webview/WebViewHost;->webView:Landroid/webkit/WebView;

    .line 38
    new-instance v0, Lcom/agy/ui/webview/AgyWebChromeClient;

    new-instance v1, Lcom/agy/ui/webview/PopupWindowHandler;

    invoke-direct {v1, p1, p3}, Lcom/agy/ui/webview/PopupWindowHandler;-><init>(Landroid/content/Context;Lcom/agy/oauth/OAuthManager;)V

    invoke-direct {v0, v1, p5}, Lcom/agy/ui/webview/AgyWebChromeClient;-><init>(Lcom/agy/ui/webview/PopupWindowHandler;Lcom/agy/ui/webview/AgyWebChromeClient$FileChooserCallback;)V

    invoke-virtual {p2, v0}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 40
    new-instance p5, Lcom/agy/ui/webview/AgyWebViewClient;

    new-instance v5, Lcom/agy/ui/webview/LocalAssetServer;

    invoke-direct {v5}, Lcom/agy/ui/webview/LocalAssetServer;-><init>()V

    new-instance v7, Lcom/agy/ui/webview/WebViewHost$1;

    invoke-direct {v7, p0}, Lcom/agy/ui/webview/WebViewHost$1;-><init>(Lcom/agy/ui/webview/WebViewHost;)V

    move-object v2, p5

    move-object v3, p1

    move-object v4, p3

    move-object v6, p4

    invoke-direct/range {v2 .. v7}, Lcom/agy/ui/webview/AgyWebViewClient;-><init>(Landroid/content/Context;Lcom/agy/oauth/OAuthManager;Lcom/agy/ui/webview/LocalAssetServer;Lcom/agy/bridge/AndroidBridge;Lcom/agy/ui/webview/WebViewHost$Listener;)V

    invoke-virtual {p2, p5}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 49
    new-instance p1, Lcom/agy/ui/webview/WebViewHost$2;

    invoke-direct {p1, p0}, Lcom/agy/ui/webview/WebViewHost$2;-><init>(Lcom/agy/ui/webview/WebViewHost;)V

    invoke-virtual {p2, p1}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 60
    return-void
.end method

.method static synthetic access$000(Lcom/agy/ui/webview/WebViewHost;)Lcom/agy/ui/webview/WebViewHost$Listener;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/agy/ui/webview/WebViewHost;->listener:Lcom/agy/ui/webview/WebViewHost$Listener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/agy/ui/webview/WebViewHost;)Landroid/webkit/WebView;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/agy/ui/webview/WebViewHost;->webView:Landroid/webkit/WebView;

    return-object p0
.end method

.method public static startUrl(I)Ljava/lang/String;
    .locals 0

    .line 81
    invoke-static {p0}, Lcom/agy/util/CoreUrl;->startUrl(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static startUrl(ILjava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 85
    invoke-static {p0, p1}, Lcom/agy/util/CoreUrl;->startUrl(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public freeMemory()V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost;->webView:Landroid/webkit/WebView;

    invoke-static {v0}, Lcom/agy/ui/webview/WebViewLifecycle;->freeMemory(Landroid/webkit/WebView;)V

    .line 74
    return-void
.end method

.method public getWebView()Landroid/webkit/WebView;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method public isDesktopMode()Z
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/agy/ui/webview/DesktopModePrefs;->isDesktopMode(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public loadApp()V
    .locals 4

    .line 105
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/agy/ui/webview/WebViewHost;->webView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/agy/ui/webview/WebViewHost;->theme:Lcom/agy/theme/ThemeManager;

    iget-object v3, p0, Lcom/agy/ui/webview/WebViewHost;->bridge:Lcom/agy/bridge/AndroidBridge;

    invoke-static {v0, v1, v2, v3}, Lcom/agy/ui/webview/AppLoader;->load(Landroid/content/Context;Landroid/webkit/WebView;Lcom/agy/theme/ThemeManager;Lcom/agy/bridge/AndroidBridge;)V

    .line 106
    return-void
.end method

.method public setDesktopMode(Z)V
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/agy/ui/webview/DesktopModePrefs;->setDesktopMode(Landroid/content/Context;Z)V

    .line 94
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost;->webView:Landroid/webkit/WebView;

    new-instance v1, Lcom/agy/ui/webview/WebViewHost$3;

    invoke-direct {v1, p0, p1}, Lcom/agy/ui/webview/WebViewHost$3;-><init>(Lcom/agy/ui/webview/WebViewHost;Z)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->post(Ljava/lang/Runnable;)Z

    .line 101
    return-void
.end method

.method public setListener(Lcom/agy/ui/webview/WebViewHost$Listener;)V
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/agy/ui/webview/WebViewHost;->listener:Lcom/agy/ui/webview/WebViewHost$Listener;

    .line 78
    return-void
.end method
