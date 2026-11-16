.class public Lcom/agy/browser/BrowserBridgeMethods;
.super Ljava/lang/Object;
.source "BrowserBridgeMethods.java"

.method public constructor <init>()V
  .registers 1
  .line 5
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public closeNativeBrowser()V
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 2
  .line 23
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/agy/browser/NativeBrowserManager;->close()V
  .line 24
    return-void
.end method

.method public getNativeBrowserTitle()Ljava/lang/String;
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 2
  .line 58
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/agy/browser/NativeBrowserManager;->getTitle()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public getNativeBrowserUrl()Ljava/lang/String;
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 2
  .line 53
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/agy/browser/NativeBrowserManager;->getUrl()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public isNativeBrowserSupported()Z
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 2
  .line 63
    const/4 v0, 1
    return v0
.end method

.method public nativeBrowserGoBack()V
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 2
  .line 33
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/agy/browser/NativeBrowserManager;->goBack()V
  .line 34
    return-void
.end method

.method public nativeBrowserGoForward()V
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 2
  .line 38
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/agy/browser/NativeBrowserManager;->goForward()V
  .line 39
    return-void
.end method

.method public nativeBrowserNavigate(Ljava/lang/String;)V
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 3
  .line 28
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0, p1 }, Lcom/agy/browser/NativeBrowserManager;->navigate(Ljava/lang/String;)V
  .line 29
    return-void
.end method

.method public nativeBrowserReload()V
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 2
  .line 43
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/agy/browser/NativeBrowserManager;->reload()V
  .line 44
    return-void
.end method

.method public nativeBrowserStop()V
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 2
  .line 48
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/agy/browser/NativeBrowserManager;->stopLoading()V
  .line 49
    return-void
.end method

.method public openNativeBrowser(Ljava/lang/String;FFFF)V
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 12
  .line 8
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    move-object v1, p1
    move v2, p2
    move v3, p3
    move v4, p4
    move v5, p5
    invoke-virtual/range { v0 .. v5 }, Lcom/agy/browser/NativeBrowserManager;->open(Ljava/lang/String;FFFF)V
  .line 9
    return-void
.end method

.method public setNativeBrowserBounds(FFFF)V
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 6
  .line 13
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0, p1, p2, p3, p4 }, Lcom/agy/browser/NativeBrowserManager;->setBounds(FFFF)V
  .line 14
    return-void
.end method

.method public setNativeBrowserVisible(Z)V
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .registers 3
  .line 18
    invoke-static { }, Lcom/agy/browser/NativeBrowserManager;->getInstance()Lcom/agy/browser/NativeBrowserManager;
    move-result-object v0
    invoke-virtual { v0, p1 }, Lcom/agy/browser/NativeBrowserManager;->setVisible(Z)V
  .line 19
    return-void
.end method
