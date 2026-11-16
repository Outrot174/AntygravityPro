.class Lcom/agy/browser/NativeBrowserManager$11;
.super Landroid/webkit/WebChromeClient;
.source "NativeBrowserManager.java"

.annotation system Ldalvik/annotation/EnclosingMethod;
  value = Lcom/agy/browser/NativeBrowserManager;->ensureWebView(Landroid/app/Activity;)V
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 0
  name = null
.end annotation

.field final synthetic this$0:Lcom/agy/browser/NativeBrowserManager;

.method constructor <init>(Lcom/agy/browser/NativeBrowserManager;)V
  .annotation system Ldalvik/annotation/MethodParameters;
    accessFlags = {
      32784
    }
    names = {
      null
    }
  .end annotation
  .registers 2
  .line 291
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$11;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-direct { p0 }, Landroid/webkit/WebChromeClient;-><init>()V
    return-void
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
  .registers 11
  .line 294
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$11;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1 }, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;
    move-result-object v3
    const/16 v1, 100
    if-ge p2, v1, :L0
    const/4 v1, 1
    const/4 v5, 1
    goto :L1
  :L0
    const/4 v1, 0
    const/4 v5, 0
  :L1
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoBack()Z
    move-result v6
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoForward()Z
    move-result v7
    const-string v1, "onProgressChanged"
    move v4, p2
    invoke-virtual/range { v0 .. v7 }, Lcom/agy/browser/NativeBrowserManager;->notifyState(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZZ)V
  .line 295
    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
  .registers 12
  .line 299
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$11;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0, p2 }, Lcom/agy/browser/NativeBrowserManager;->access$502(Lcom/agy/browser/NativeBrowserManager;Ljava/lang/String;)Ljava/lang/String;
  .line 300
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager$11;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;
    move-result-object v3
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$11;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$200(Lcom/agy/browser/NativeBrowserManager;)Z
    move-result v6
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoBack()Z
    move-result v7
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoForward()Z
    move-result v8
    const-string v2, "onReceivedTitle"
    const/4 v5, -1
    move-object v4, p2
    invoke-virtual/range { v1 .. v8 }, Lcom/agy/browser/NativeBrowserManager;->notifyState(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZZ)V
  .line 301
    return-void
.end method
