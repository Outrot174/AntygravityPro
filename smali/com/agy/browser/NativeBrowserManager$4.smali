.class Lcom/agy/browser/NativeBrowserManager$4;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "NativeBrowserManager.java"

.annotation system Ldalvik/annotation/EnclosingMethod;
  value = Lcom/agy/browser/NativeBrowserManager;->navigate(Ljava/lang/String;)V
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 0
  name = null
.end annotation

.field final synthetic this$0:Lcom/agy/browser/NativeBrowserManager;

.field final synthetic val$act:Landroid/app/Activity;

.field final synthetic val$url:Ljava/lang/String;

.method constructor <init>(Lcom/agy/browser/NativeBrowserManager;Landroid/app/Activity;Ljava/lang/String;)V
  .annotation system Ldalvik/annotation/MethodParameters;
    accessFlags = {
      32784,
      4112,
      4112
    }
    names = {
      null,
      null,
      null
    }
  .end annotation
  .annotation system Ldalvik/annotation/Signature;
    value = {
      "()V"
    }
  .end annotation
  .registers 4
  .line 128
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$4;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iput-object p2, p0, Lcom/agy/browser/NativeBrowserManager$4;->val$act:Landroid/app/Activity;
    iput-object p3, p0, Lcom/agy/browser/NativeBrowserManager$4;->val$url:Ljava/lang/String;
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 3
  .line 131
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$4;->this$0:Lcom/agy/browser/NativeBrowserManager;
    invoke-static { v0 }, Lcom/agy/browser/NativeBrowserManager;->access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
    move-result-object v0
    if-nez v0, :L0
  .line 132
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$4;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager$4;->val$act:Landroid/app/Activity;
    invoke-virtual { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->ensureWebView(Landroid/app/Activity;)V
  :L0
  .line 134
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$4;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager$4;->val$url:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->navigateInternal(Ljava/lang/String;)V
  .line 135
    return-void
.end method
