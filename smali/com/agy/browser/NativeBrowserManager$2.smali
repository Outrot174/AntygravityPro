.class Lcom/agy/browser/NativeBrowserManager$2;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "NativeBrowserManager.java"

.annotation system Ldalvik/annotation/EnclosingMethod;
  value = Lcom/agy/browser/NativeBrowserManager;->setBounds(FFFF)V
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

.method constructor <init>(Lcom/agy/browser/NativeBrowserManager;Landroid/app/Activity;FFFF)V
  .annotation system Ldalvik/annotation/MethodParameters;
    accessFlags = {
      32784,
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
      null
    }
  .end annotation
  .annotation system Ldalvik/annotation/Signature;
    value = {
      "()V"
    }
  .end annotation
  .registers 7
  .line 104
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$2;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iput-object p2, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$act:Landroid/app/Activity;
    iput p3, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$cssX:F
    iput p4, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$cssY:F
    iput p5, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$cssW:F
    iput p6, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$cssH:F
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 7
  .line 107
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$2;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$act:Landroid/app/Activity;
    iget v2, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$cssX:F
    iget v3, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$cssY:F
    iget v4, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$cssW:F
    iget v5, p0, Lcom/agy/browser/NativeBrowserManager$2;->val$cssH:F
    invoke-virtual/range { v0 .. v5 }, Lcom/agy/browser/NativeBrowserManager;->updateBoundsInternal(Landroid/app/Activity;FFFF)V
  .line 108
    return-void
.end method
