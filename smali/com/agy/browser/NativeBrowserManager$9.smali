.class Lcom/agy/browser/NativeBrowserManager$9;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "NativeBrowserManager.java"

.annotation system Ldalvik/annotation/EnclosingMethod;
  value = Lcom/agy/browser/NativeBrowserManager;->close()V
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
  .line 194
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$9;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 3
  .line 197
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$9;->this$0:Lcom/agy/browser/NativeBrowserManager;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->setVisibleInternal(Z)V
  .line 198
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$9;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
    move-result-object v0
    if-eqz v0, :L0
  .line 199
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$9;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/webkit/WebView;->stopLoading()V
  .line 200
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$9;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
    move-result-object v0
    const-string v1, "about:blank"
    invoke-virtual { v0, v1 }, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
  :L0
  .line 202
    return-void
.end method
