.class Lcom/agy/browser/NativeBrowserManager$5;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "NativeBrowserManager.java"

.annotation system Ldalvik/annotation/EnclosingMethod;
  value = Lcom/agy/browser/NativeBrowserManager;->goBack()V
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
  .line 142
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$5;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 2
  .line 145
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$5;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
    move-result-object v0
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$5;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/webkit/WebView;->canGoBack()Z
    move-result v0
    if-eqz v0, :L0
  .line 146
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$5;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/webkit/WebView;->goBack()V
  :L0
  .line 148
    return-void
.end method
