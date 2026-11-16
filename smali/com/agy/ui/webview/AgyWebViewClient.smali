.class public final Lcom/agy/ui/webview/AgyWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "AgyWebViewClient.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "WebViewHost"


# instance fields
.field private final assetServer:Lcom/agy/ui/webview/LocalAssetServer;

.field private final bridge:Lcom/agy/bridge/AndroidBridge;

.field private final context:Landroid/content/Context;

.field private final listener:Lcom/agy/ui/webview/WebViewHost$Listener;

.field private final oauth:Lcom/agy/oauth/OAuthManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/agy/oauth/OAuthManager;Lcom/agy/ui/webview/LocalAssetServer;Lcom/agy/bridge/AndroidBridge;Lcom/agy/ui/webview/WebViewHost$Listener;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/agy/ui/webview/AgyWebViewClient;->context:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/agy/ui/webview/AgyWebViewClient;->oauth:Lcom/agy/oauth/OAuthManager;

    .line 35
    iput-object p3, p0, Lcom/agy/ui/webview/AgyWebViewClient;->assetServer:Lcom/agy/ui/webview/LocalAssetServer;

    .line 36
    iput-object p4, p0, Lcom/agy/ui/webview/AgyWebViewClient;->bridge:Lcom/agy/bridge/AndroidBridge;

    .line 37
    iput-object p5, p0, Lcom/agy/ui/webview/AgyWebViewClient;->listener:Lcom/agy/ui/webview/WebViewHost$Listener;

    .line 38
    return-void
.end method

.method private handleNavigation(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 4

    .line 76
    const-string p1, "WebViewHost"

    if-eqz p2, :cond_6

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "about:blank"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 80
    :cond_0
    const/4 v0, 0x1

    :try_start_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 81
    iget-object v2, p0, Lcom/agy/ui/webview/AgyWebViewClient;->bridge:Lcom/agy/bridge/AndroidBridge;

    invoke-virtual {v2}, Lcom/agy/bridge/AndroidBridge;->getEnginePort()I

    move-result v2

    invoke-static {v1, v2}, Lcom/agy/util/TrustedCoreOrigin;->matches(Landroid/net/Uri;I)Z

    move-result v2

    if-nez v2, :cond_5

    .line 82
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 83
    const-string v2, "http"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "https"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 85
    :cond_1
    const-string v1, "googleapis.com/oauth2/v2/userinfo"

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "googleapis.com/auth"

    .line 86
    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 89
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "non-core navigation -> external browser: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 90
    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 89
    invoke-static {p1, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    iget-object v1, p0, Lcom/agy/ui/webview/AgyWebViewClient;->oauth:Lcom/agy/oauth/OAuthManager;

    iget-object v2, p0, Lcom/agy/ui/webview/AgyWebViewClient;->context:Landroid/content/Context;

    invoke-virtual {v1, v2, p2}, Lcom/agy/oauth/OAuthManager;->openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    :cond_3
    return v0

    .line 87
    :cond_4
    :goto_0
    return v0

    .line 100
    :cond_5
    nop

    .line 101
    iget-object p1, p0, Lcom/agy/ui/webview/AgyWebViewClient;->oauth:Lcom/agy/oauth/OAuthManager;

    iget-object v0, p0, Lcom/agy/ui/webview/AgyWebViewClient;->context:Landroid/content/Context;

    invoke-virtual {p1, v0, p2}, Lcom/agy/oauth/OAuthManager;->intercept(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    return p1

    .line 97
    :catch_0
    move-exception v1

    .line 98
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot parse uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    return v0

    .line 77
    :cond_6
    :goto_1
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 172
    iget-object p1, p0, Lcom/agy/ui/webview/AgyWebViewClient;->listener:Lcom/agy/ui/webview/WebViewHost$Listener;

    if-eqz p1, :cond_0

    .line 173
    invoke-interface {p1, p2}, Lcom/agy/ui/webview/WebViewHost$Listener;->onPageFinished(Ljava/lang/String;)V

    .line 175
    :cond_0
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3

    .line 110
    if-eqz p2, :cond_5

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_5

    const-string p3, "about:blank"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    goto/16 :goto_0

    .line 114
    :cond_0
    :try_start_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    .line 115
    iget-object v0, p0, Lcom/agy/ui/webview/AgyWebViewClient;->bridge:Lcom/agy/bridge/AndroidBridge;

    invoke-virtual {v0}, Lcom/agy/bridge/AndroidBridge;->getEnginePort()I

    move-result v0

    invoke-static {p3, v0}, Lcom/agy/util/TrustedCoreOrigin;->matches(Landroid/net/Uri;I)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "WebViewHost"

    if-nez v0, :cond_3

    .line 116
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPageStarted intercepted non-core url: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 117
    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 116
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 119
    invoke-virtual {p3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p3

    .line 120
    const-string v0, "http"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "https"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 121
    :cond_1
    const-string p3, "googleapis.com/oauth2/v2/userinfo"

    invoke-virtual {p2, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_2

    const-string p3, "googleapis.com/auth"

    .line 122
    invoke-virtual {p2, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_2

    .line 123
    iget-object p3, p0, Lcom/agy/ui/webview/AgyWebViewClient;->oauth:Lcom/agy/oauth/OAuthManager;

    iget-object v0, p0, Lcom/agy/ui/webview/AgyWebViewClient;->context:Landroid/content/Context;

    invoke-virtual {p3, v0, p2}, Lcom/agy/oauth/OAuthManager;->openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 126
    :cond_2
    return-void

    .line 131
    :cond_3
    nop

    .line 132
    iget-object p3, p0, Lcom/agy/ui/webview/AgyWebViewClient;->oauth:Lcom/agy/oauth/OAuthManager;

    iget-object v0, p0, Lcom/agy/ui/webview/AgyWebViewClient;->context:Landroid/content/Context;

    invoke-virtual {p3, v0, p2}, Lcom/agy/oauth/OAuthManager;->intercept(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 133
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onPageStarted stopped auth url="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    .line 134
    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 133
    invoke-static {v1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 137
    :cond_4
    return-void

    .line 128
    :catch_0
    move-exception p2

    .line 129
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 130
    return-void

    .line 111
    :cond_5
    :goto_0
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 1

    .line 42
    if-eqz p2, :cond_1

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 43
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Resource load error: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 44
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " err="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 45
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    move-result-object p2

    goto :goto_0

    :cond_0
    const-string p2, "unknown"

    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 43
    const-string p2, "WebViewHost"

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    :cond_1
    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 1

    .line 141
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "rejecting TLS error in WebView: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 142
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/net/http/SslError;->getUrl()Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    invoke-static {p3}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 141
    const-string p3, "WebViewHost"

    invoke-static {p3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->cancel()V

    .line 146
    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 3

    .line 150
    if-eqz p2, :cond_1

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 153
    :cond_0
    iget-object p1, p0, Lcom/agy/ui/webview/AgyWebViewClient;->assetServer:Lcom/agy/ui/webview/LocalAssetServer;

    iget-object v0, p0, Lcom/agy/ui/webview/AgyWebViewClient;->context:Landroid/content/Context;

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    move-result-object p2

    iget-object v2, p0, Lcom/agy/ui/webview/AgyWebViewClient;->bridge:Lcom/agy/bridge/AndroidBridge;

    .line 154
    invoke-virtual {v2}, Lcom/agy/bridge/AndroidBridge;->getEnginePort()I

    move-result v2

    .line 153
    invoke-virtual {p1, v0, v1, p2, v2}, Lcom/agy/ui/webview/LocalAssetServer;->intercept(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;I)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1

    .line 151
    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 4

    .line 160
    const/4 p1, 0x0

    if-nez p2, :cond_0

    .line 161
    return-object p1

    .line 164
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/agy/ui/webview/AgyWebViewClient;->assetServer:Lcom/agy/ui/webview/LocalAssetServer;

    iget-object v1, p0, Lcom/agy/ui/webview/AgyWebViewClient;->context:Landroid/content/Context;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string v2, "GET"

    iget-object v3, p0, Lcom/agy/ui/webview/AgyWebViewClient;->bridge:Lcom/agy/bridge/AndroidBridge;

    invoke-virtual {v3}, Lcom/agy/bridge/AndroidBridge;->getEnginePort()I

    move-result v3

    invoke-virtual {v0, v1, p2, v2, v3}, Lcom/agy/ui/webview/LocalAssetServer;->intercept(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;I)Landroid/webkit/WebResourceResponse;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 165
    :catch_0
    move-exception p2

    .line 166
    return-object p1
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 4

    .line 51
    const/4 v0, 0x1

    if-eqz p2, :cond_3

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 54
    :cond_0
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "shouldOverrideUrlLoading url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 56
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 55
    const-string v3, "WebViewHost"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result p2

    if-nez p2, :cond_2

    .line 60
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    .line 61
    const-string p2, "https"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 62
    const-string p2, "about"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 61
    :goto_0
    return v0

    .line 64
    :cond_2
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/agy/ui/webview/AgyWebViewClient;->handleNavigation(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    return p1

    .line 52
    :cond_3
    :goto_1
    return v0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "shouldOverrideUrlLoading(deprecated) url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 71
    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    const-string v1, "WebViewHost"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    invoke-direct {p0, p1, p2}, Lcom/agy/ui/webview/AgyWebViewClient;->handleNavigation(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
