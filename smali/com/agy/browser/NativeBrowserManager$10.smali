.class Lcom/agy/browser/NativeBrowserManager$10;
.super Landroid/webkit/WebViewClient;
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
  .line 252
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-direct { p0 }, Landroid/webkit/WebViewClient;-><init>()V
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
  .registers 12
  .line 274
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0, p2 }, Lcom/agy/browser/NativeBrowserManager;->access$102(Lcom/agy/browser/NativeBrowserManager;Ljava/lang/String;)Ljava/lang/String;
  .line 275
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->access$202(Lcom/agy/browser/NativeBrowserManager;Z)Z
  .line 276
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;
    move-result-object v1
    invoke-static { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->access$502(Lcom/agy/browser/NativeBrowserManager;Ljava/lang/String;)Ljava/lang/String;
  .line 277
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoBack()Z
    move-result v1
    invoke-static { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->access$302(Lcom/agy/browser/NativeBrowserManager;Z)Z
  .line 278
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoForward()Z
    move-result p1
    invoke-static { v0, p1 }, Lcom/agy/browser/NativeBrowserManager;->access$402(Lcom/agy/browser/NativeBrowserManager;Z)Z
  .line 279
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { p1 }, Lcom/agy/browser/NativeBrowserManager;->access$500(Lcom/agy/browser/NativeBrowserManager;)Ljava/lang/String;
    move-result-object v4
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { p1 }, Lcom/agy/browser/NativeBrowserManager;->access$300(Lcom/agy/browser/NativeBrowserManager;)Z
    move-result v7
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { p1 }, Lcom/agy/browser/NativeBrowserManager;->access$400(Lcom/agy/browser/NativeBrowserManager;)Z
    move-result v8
    const-string v2, "onPageFinished"
    const/16 v5, 100
    const/4 v6, 0
    move-object v3, p2
    invoke-virtual/range { v1 .. v8 }, Lcom/agy/browser/NativeBrowserManager;->notifyState(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZZ)V
  .line 280
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .registers 13
  .line 265
    iget-object p3, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { p3, p2 }, Lcom/agy/browser/NativeBrowserManager;->access$102(Lcom/agy/browser/NativeBrowserManager;Ljava/lang/String;)Ljava/lang/String;
  .line 266
    iget-object p3, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    const/4 v0, 1
    invoke-static { p3, v0 }, Lcom/agy/browser/NativeBrowserManager;->access$202(Lcom/agy/browser/NativeBrowserManager;Z)Z
  .line 267
    iget-object p3, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoBack()Z
    move-result v0
    invoke-static { p3, v0 }, Lcom/agy/browser/NativeBrowserManager;->access$302(Lcom/agy/browser/NativeBrowserManager;Z)Z
  .line 268
    iget-object p3, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoForward()Z
    move-result v0
    invoke-static { p3, v0 }, Lcom/agy/browser/NativeBrowserManager;->access$402(Lcom/agy/browser/NativeBrowserManager;Z)Z
  .line 269
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;
    move-result-object v4
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { p1 }, Lcom/agy/browser/NativeBrowserManager;->access$300(Lcom/agy/browser/NativeBrowserManager;)Z
    move-result v7
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { p1 }, Lcom/agy/browser/NativeBrowserManager;->access$400(Lcom/agy/browser/NativeBrowserManager;)Z
    move-result v8
    const-string v2, "onPageStarted"
    const/16 v5, 10
    const/4 v6, 1
    move-object v3, p2
    invoke-virtual/range { v1 .. v8 }, Lcom/agy/browser/NativeBrowserManager;->notifyState(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZZ)V
  .line 270
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
  .registers 12
  .line 284
    if-eqz p2, :L2
    invoke-interface { p2 }, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z
    move-result v0
    if-eqz v0, :L2
  .line 285
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v1, 23
    if-lt v0, v1, :L0
    if-eqz p3, :L0
    invoke-virtual { p3 }, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;
    move-result-object p3
    invoke-interface { p3 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object p3
    goto :L1
  :L0
    const-string p3, "Network error"
  :L1
    move-object v3, p3
  .line 286
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$10;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-interface { p2 }, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
    move-result-object p2
    invoke-virtual { p2 }, Landroid/net/Uri;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoBack()Z
    move-result v6
    invoke-virtual { p1 }, Landroid/webkit/WebView;->canGoForward()Z
    move-result v7
    const-string v1, "onReceivedError"
    const/4 v4, 0
    const/4 v5, 0
    invoke-virtual/range { v0 .. v7 }, Lcom/agy/browser/NativeBrowserManager;->notifyState(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZZ)V
  :L2
  .line 288
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
  .registers 3
  .line 255
    const/4 p1, 0
    return p1
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
  .registers 3
  .line 260
    const/4 p1, 0
    return p1
.end method
