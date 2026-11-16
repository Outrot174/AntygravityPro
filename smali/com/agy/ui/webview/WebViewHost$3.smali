.class Lcom/agy/ui/webview/WebViewHost$3;
.super Ljava/lang/Object;
.source "WebViewHost.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/webview/WebViewHost;->setDesktopMode(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/ui/webview/WebViewHost;

.field final synthetic val$enabled:Z


# direct methods
.method constructor <init>(Lcom/agy/ui/webview/WebViewHost;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 94
    iput-object p1, p0, Lcom/agy/ui/webview/WebViewHost$3;->this$0:Lcom/agy/ui/webview/WebViewHost;

    iput-boolean p2, p0, Lcom/agy/ui/webview/WebViewHost$3;->val$enabled:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 97
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost$3;->this$0:Lcom/agy/ui/webview/WebViewHost;

    invoke-static {v0}, Lcom/agy/ui/webview/WebViewHost;->access$100(Lcom/agy/ui/webview/WebViewHost;)Landroid/webkit/WebView;

    move-result-object v0

    iget-boolean v1, p0, Lcom/agy/ui/webview/WebViewHost$3;->val$enabled:Z

    invoke-static {v0, v1}, Lcom/agy/ui/webview/WebSettingsFactory;->applyDesktopMode(Landroid/webkit/WebView;Z)V

    .line 98
    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost$3;->this$0:Lcom/agy/ui/webview/WebViewHost;

    invoke-static {v0}, Lcom/agy/ui/webview/WebViewHost;->access$100(Lcom/agy/ui/webview/WebViewHost;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->reload()V

    .line 99
    return-void
.end method
