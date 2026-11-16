.class public final synthetic Lcom/agy/bridge/NativeExecBridge$0;
.super Ljava/lang/Object;
.implements Ljava/util/Comparator;
.source "D8$$SyntheticClass"

.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
  holder = "Lcom/agy/bridge/NativeExecBridge;"
  method = "lambda$listDirJson$0"
  proto = "(Ljava/io/File;Ljava/io/File;)I"
.end annotation

.method public synthetic constructor <init>()V
  .registers 1
  .line 0
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
  .registers 3
  .line 0
    check-cast p1, Ljava/io/File;
    check-cast p2, Ljava/io/File;
    invoke-static { p1, p2 }, Lcom/agy/bridge/NativeExecBridge;->lambda$listDirJson$0(Ljava/io/File;Ljava/io/File;)I
    move-result p1
    return p1
.end method
