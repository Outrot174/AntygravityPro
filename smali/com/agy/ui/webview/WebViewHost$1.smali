.class Lcom/agy/ui/webview/WebViewHost$1;
.super Ljava/lang/Object;
.source "WebViewHost.java"

# interfaces
.implements Lcom/agy/ui/webview/WebViewHost$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/webview/WebViewHost;-><init>(Landroid/content/Context;Lcom/agy/theme/ThemeManager;Lcom/agy/oauth/OAuthManager;Lcom/agy/bridge/AndroidBridge;Lcom/agy/ui/webview/AgyWebChromeClient$FileChooserCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/ui/webview/WebViewHost;


# direct methods
.method constructor <init>(Lcom/agy/ui/webview/WebViewHost;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/agy/ui/webview/WebViewHost$1;->this$0:Lcom/agy/ui/webview/WebViewHost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Ljava/lang/String;)V
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost$1;->this$0:Lcom/agy/ui/webview/WebViewHost;

    invoke-static {v0}, Lcom/agy/ui/webview/WebViewHost;->access$000(Lcom/agy/ui/webview/WebViewHost;)Lcom/agy/ui/webview/WebViewHost$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost$1;->this$0:Lcom/agy/ui/webview/WebViewHost;

    invoke-static {v0}, Lcom/agy/ui/webview/WebViewHost;->access$000(Lcom/agy/ui/webview/WebViewHost;)Lcom/agy/ui/webview/WebViewHost$Listener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/agy/ui/webview/WebViewHost$Listener;->onPageFinished(Ljava/lang/String;)V

    .line 47
    :cond_0
    return-void
.end method
