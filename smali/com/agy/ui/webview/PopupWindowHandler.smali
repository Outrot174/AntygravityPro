.class public final Lcom/agy/ui/webview/PopupWindowHandler;
.super Ljava/lang/Object;
.source "PopupWindowHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "WebViewHost"


# instance fields
.field private final context:Landroid/content/Context;

.field private final oauth:Lcom/agy/oauth/OAuthManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/agy/oauth/OAuthManager;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/agy/ui/webview/PopupWindowHandler;->context:Landroid/content/Context;

    .line 26
    iput-object p2, p0, Lcom/agy/ui/webview/PopupWindowHandler;->oauth:Lcom/agy/oauth/OAuthManager;

    .line 27
    return-void
.end method

.method static synthetic access$000(Lcom/agy/ui/webview/PopupWindowHandler;)Landroid/content/Context;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/agy/ui/webview/PopupWindowHandler;->context:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lcom/agy/ui/webview/PopupWindowHandler;)Lcom/agy/oauth/OAuthManager;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/agy/ui/webview/PopupWindowHandler;->oauth:Lcom/agy/oauth/OAuthManager;

    return-object p0
.end method


# virtual methods
.method public handle(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
    .locals 1

    .line 31
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCreateWindow isDialog="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " isUserGesture="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "WebViewHost"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    new-instance p1, Landroid/webkit/WebView;

    iget-object p2, p0, Lcom/agy/ui/webview/PopupWindowHandler;->context:Landroid/content/Context;

    invoke-direct {p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 33
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p2

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 34
    new-instance p2, Lcom/agy/ui/webview/PopupWindowHandler$1;

    invoke-direct {p2, p0, p1}, Lcom/agy/ui/webview/PopupWindowHandler$1;-><init>(Lcom/agy/ui/webview/PopupWindowHandler;Landroid/webkit/WebView;)V

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 82
    if-eqz p4, :cond_0

    iget-object p2, p4, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of p2, p2, Landroid/webkit/WebView$WebViewTransport;

    if-eqz p2, :cond_0

    .line 83
    iget-object p2, p4, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p2, Landroid/webkit/WebView$WebViewTransport;

    invoke-virtual {p2, p1}, Landroid/webkit/WebView$WebViewTransport;->setWebView(Landroid/webkit/WebView;)V

    .line 84
    invoke-virtual {p4}, Landroid/os/Message;->sendToTarget()V

    .line 86
    :cond_0
    return p3
.end method
