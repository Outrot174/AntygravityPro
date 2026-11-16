.class public final Lcom/agy/ui/webview/WebViewFactory;
.super Ljava/lang/Object;
.source "WebViewFactory.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method

.method public static create(Landroid/content/Context;Lcom/agy/bridge/AndroidBridge;Lcom/agy/theme/ThemeManager;)Landroid/webkit/WebView;
    .locals 2

    .line 20
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 21
    invoke-virtual {p2}, Lcom/agy/theme/ThemeManager;->getBackgroundColor()I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 22
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->setFocusable(Z)V

    .line 23
    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->setFocusableInTouchMode(Z)V

    .line 24
    const/16 p0, 0x82

    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->requestFocus(I)Z

    .line 26
    const/4 p0, 0x2

    const/4 p2, 0x0

    invoke-virtual {v0, p0, p2}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 27
    const-string p0, "Android"

    invoke-virtual {v0, p1, p0}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "AndroidBridge"

    invoke-virtual {v0, p1, p0}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/agy/bridge/DesktopNativeBridge;

    invoke-direct {v1}, Lcom/agy/bridge/DesktopNativeBridge;-><init>()V

    const-string p0, "DesktopNativeBridge"

    invoke-virtual {v0, v1, p0}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    new-instance p0, Lcom/agy/ui/webview/WebViewFactory$1;

    invoke-direct {p0}, Lcom/agy/ui/webview/WebViewFactory$1;-><init>()V

    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 39
    invoke-static {v0}, Lcom/agy/ui/webview/WebSettingsFactory;->configure(Landroid/webkit/WebView;)V

    .line 41
    nop

    .line 44
    return-object v0
.end method
