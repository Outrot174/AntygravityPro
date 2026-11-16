.class Lcom/agy/browser/NativeBrowserManager$12;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "NativeBrowserManager.java"

.annotation system Ldalvik/annotation/EnclosingMethod;
  value = Lcom/agy/browser/NativeBrowserManager;->notifyState(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZZ)V
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 0
  name = null
.end annotation

.field final synthetic this$0:Lcom/agy/browser/NativeBrowserManager;

.field final synthetic val$primary:Landroid/webkit/WebView;

.field final synthetic val$script:Ljava/lang/String;

.method constructor <init>(Lcom/agy/browser/NativeBrowserManager;Landroid/webkit/WebView;Ljava/lang/String;)V
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
  .line 388
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$12;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iput-object p2, p0, Lcom/agy/browser/NativeBrowserManager$12;->val$primary:Landroid/webkit/WebView;
    iput-object p3, p0, Lcom/agy/browser/NativeBrowserManager$12;->val$script:Ljava/lang/String;
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 4
  .line 391
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$12;->val$primary:Landroid/webkit/WebView;
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager$12;->val$script:Ljava/lang/String;
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
  .line 392
    return-void
.end method
