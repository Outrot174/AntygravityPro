.class Lcom/agy/browser/NativeBrowserManager$3;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "NativeBrowserManager.java"

.annotation system Ldalvik/annotation/EnclosingMethod;
  value = Lcom/agy/browser/NativeBrowserManager;->setVisible(Z)V
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 0
  name = null
.end annotation

.field final synthetic this$0:Lcom/agy/browser/NativeBrowserManager;

.field final synthetic val$visible:Z

.method constructor <init>(Lcom/agy/browser/NativeBrowserManager;Z)V
  .annotation system Ldalvik/annotation/MethodParameters;
    accessFlags = {
      32784,
      4112
    }
    names = {
      null,
      null
    }
  .end annotation
  .annotation system Ldalvik/annotation/Signature;
    value = {
      "()V"
    }
  .end annotation
  .registers 3
  .line 116
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager$3;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iput-boolean p2, p0, Lcom/agy/browser/NativeBrowserManager$3;->val$visible:Z
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 3
  .line 119
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager$3;->this$0:Lcom/agy/browser/NativeBrowserManager;
    iget-boolean v1, p0, Lcom/agy/browser/NativeBrowserManager$3;->val$visible:Z
    invoke-virtual { v0, v1 }, Lcom/agy/browser/NativeBrowserManager;->setVisibleInternal(Z)V
  .line 120
    return-void
.end method
