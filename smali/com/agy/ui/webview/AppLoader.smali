.class public final Lcom/agy/ui/webview/AppLoader;
.super Ljava/lang/Object;
.source "AppLoader.java"


# static fields
.field private static final APP_ASSET:Ljava/lang/String; = "web/index.html"

.field private static final TAG:Ljava/lang/String; = "WebViewHost"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method public static load(Landroid/content/Context;Landroid/webkit/WebView;Lcom/agy/theme/ThemeManager;Lcom/agy/bridge/AndroidBridge;)V
    .locals 8

    .line 26
    const-string v0, "web/index.html"

    invoke-static {p0, v0}, Lcom/agy/util/AssetReader;->readString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    const-string p0, "WebViewHost"

    const-string p1, "cannot read web/index.html; UI not loaded"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    return-void

    .line 31
    :cond_0
    invoke-virtual {p3}, Lcom/agy/bridge/AndroidBridge;->getEnginePort()I

    move-result v0

    .line 35
    if-eqz p2, :cond_1

    .line 36
    invoke-virtual {p2, p1}, Lcom/agy/theme/ThemeManager;->applyToWebView(Landroid/webkit/WebView;)V

    .line 39
    :cond_1
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/agy/theme/ThemeManager;->mode()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 40
    const-string v1, "dark"

    goto :goto_0

    .line 41
    :cond_2
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lcom/agy/theme/ThemeManager;->mode()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 42
    const-string v1, "light"

    goto :goto_0

    .line 44
    :cond_3
    const-string v1, "system"

    .line 46
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://127.0.0.1:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "?hostTheme="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 48
    invoke-static {p0, p3, p2}, Lcom/agy/ui/webview/AppHtmlInjector;->inject(Ljava/lang/String;Lcom/agy/bridge/AndroidBridge;Lcom/agy/theme/ThemeManager;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "text/html"

    const-string v6, "UTF-8"

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    return-void
.end method
