.class Lcom/agy/browser/NativeBrowserManager$1;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "NativeBrowserManager.java"

.annotation system Ldalvik/annotation/EnclosingMethod;
  value = Lcom/agy/browser/NativeBrowserManager;->open(Ljava/lang/String;FFFF)V
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 0
  name = null
.end annotation

.field final synthetic this$0:Lcom/agy/browser/NativeBrowserManager;

.field final synthetic val$act:Landroid/app/Activity;

.field final synthetic val$cssH:F

.field final synthetic val$cssW:F

.field final synthetic val$cssX:F

.field final synthetic val$cssY:F

.field final synthetic val$initialUrl:Ljava/lang/String;

.method constructor <init>(Lcom/agy/browser/NativeBrowserManager;Landroid/app/Activity;FFFFLjava/lang/String;)V
  .annotation system Ldalvik/annotation/MethodParameters;
    accessFlags = {
      32784,
      4112,
      4112,
      4112,
      4112,
      4112,
      4112
    }
    names = {
      null,
      null,
      null,
      null,
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
  .registers 8
  .line 83
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$1;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iput-object p2, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$act:Landroid/app/Activity;
    iput p3, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$cssX:F
    iput p4, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$cssY:F
    iput p5, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$cssW:F
    iput p6, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$cssH:F
    iput-object p7, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$initialUrl:Ljava/lang/String;
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 9
  :L0
  .line 87
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$1;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$act:Landroid/app/Activity;
    invoke-virtual { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->ensureWebView(Landroid/app/Activity;)V
  .line 88
    iget-object v2, p0, Lcom/agy/browser/NativeBrowserManager$1;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iget-object v3, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$act:Landroid/app/Activity;
    iget v4, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$cssX:F
    iget v5, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$cssY:F
    iget v6, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$cssW:F
    iget v7, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$cssH:F
    invoke-virtual/range { v2 .. v7 }, Lcom/agy/browser/NativeBrowserManager;->updateBoundsInternal(Landroid/app/Activity;FFFF)V
  .line 89
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$1;->this$0:Lcom/agy/browser/NativeBrowserManager;
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->setVisibleInternal(Z)V
  .line 90
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$initialUrl:Ljava/lang/String;
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$initialUrl:Ljava/lang/String;
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :L1
  .line 91
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$1;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager$1;->val$initialUrl:Ljava/lang/String;
    invoke-virtual { v1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->navigateInternal(Ljava/lang/String;)V
  :L1
  .line 95
    goto :L3
  :L2
  .line 93
    move-exception v0
  .line 94
    const-string v1, "NativeBrowserManager"
    const-string v2, "Error in open()"
    invoke-static { v1, v2, v0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
  :L3
  .line 96
    return-void
.end method
