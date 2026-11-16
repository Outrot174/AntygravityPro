.class Lcom/agy/browser/NativeBrowserManager$7;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "NativeBrowserManager.java"

.annotation system Ldalvik/annotation/EnclosingMethod;
  value = Lcom/agy/browser/NativeBrowserManager;->reload()V
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
  .line 168
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$7;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 2
  .line 171
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$7;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
    move-result-object v0
    if-eqz v0, :L0
  .line 172
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$7;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/webkit/WebView;->reload()V
  :L0
  .line 174
    return-void
.end method
