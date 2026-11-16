.class Lcom/agy/ui/webview/PopupWindowHandler$1;
.super Landroid/webkit/WebViewClient;
.source "PopupWindowHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/webview/PopupWindowHandler;->handle(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/ui/webview/PopupWindowHandler;

.field final synthetic val$popup:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/agy/ui/webview/PopupWindowHandler;Landroid/webkit/WebView;)V
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->this$0:Lcom/agy/ui/webview/PopupWindowHandler;

    iput-object p2, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->val$popup:Landroid/webkit/WebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 70
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_0

    const-string p3, "about:blank"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_0

    .line 71
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "popup onPageStarted opened in browser url="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    .line 72
    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 71
    const-string v0, "WebViewHost"

    invoke-static {v0, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 74
    iget-object p1, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->this$0:Lcom/agy/ui/webview/PopupWindowHandler;

    invoke-static {p1}, Lcom/agy/ui/webview/PopupWindowHandler;->access$100(Lcom/agy/ui/webview/PopupWindowHandler;)Lcom/agy/oauth/OAuthManager;

    move-result-object p1

    iget-object p3, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->this$0:Lcom/agy/ui/webview/PopupWindowHandler;

    invoke-static {p3}, Lcom/agy/ui/webview/PopupWindowHandler;->access$000(Lcom/agy/ui/webview/PopupWindowHandler;)Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p1, p3, p2}, Lcom/agy/oauth/OAuthManager;->openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z

    .line 76
    :try_start_0
    iget-object p1, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->val$popup:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    goto :goto_0

    .line 77
    :catch_0
    move-exception p1

    .line 80
    :cond_0
    :goto_0
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 1

    .line 37
    if-eqz p2, :cond_0

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 38
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 39
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "popup shouldOverrideUrlLoading url="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 40
    invoke-static {p1}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 39
    const-string v0, "WebViewHost"

    invoke-static {v0, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "about:blank"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 42
    iget-object p2, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->this$0:Lcom/agy/ui/webview/PopupWindowHandler;

    invoke-static {p2}, Lcom/agy/ui/webview/PopupWindowHandler;->access$100(Lcom/agy/ui/webview/PopupWindowHandler;)Lcom/agy/oauth/OAuthManager;

    move-result-object p2

    iget-object v0, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->this$0:Lcom/agy/ui/webview/PopupWindowHandler;

    invoke-static {v0}, Lcom/agy/ui/webview/PopupWindowHandler;->access$000(Lcom/agy/ui/webview/PopupWindowHandler;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0, p1}, Lcom/agy/oauth/OAuthManager;->openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z

    .line 44
    :try_start_0
    iget-object p1, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->val$popup:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    goto :goto_1

    .line 45
    :catch_0
    move-exception p1

    .line 47
    :goto_1
    const/4 p1, 0x1

    return p1

    .line 49
    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1

    .line 55
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "popup shouldOverrideUrlLoading(deprecated) url="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 56
    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 55
    const-string v0, "WebViewHost"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "about:blank"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 58
    iget-object p1, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->this$0:Lcom/agy/ui/webview/PopupWindowHandler;

    invoke-static {p1}, Lcom/agy/ui/webview/PopupWindowHandler;->access$100(Lcom/agy/ui/webview/PopupWindowHandler;)Lcom/agy/oauth/OAuthManager;

    move-result-object p1

    iget-object v0, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->this$0:Lcom/agy/ui/webview/PopupWindowHandler;

    invoke-static {v0}, Lcom/agy/ui/webview/PopupWindowHandler;->access$000(Lcom/agy/ui/webview/PopupWindowHandler;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lcom/agy/oauth/OAuthManager;->openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z

    .line 60
    :try_start_0
    iget-object p1, p0, Lcom/agy/ui/webview/PopupWindowHandler$1;->val$popup:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    goto :goto_0

    .line 61
    :catch_0
    move-exception p1

    .line 63
    :goto_0
    const/4 p1, 0x1

    return p1

    .line 65
    :cond_0
    const/4 p1, 0x0

    return p1
.end method
