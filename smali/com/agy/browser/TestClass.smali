.class public Lcom/agy/browser/TestClass;
.super Ljava/lang/Object;
.source "TestClass.java"

.method public constructor <init>()V
  .registers 1
  .line 2
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static getHello()Ljava/lang/String;
  .registers 1
  .line 3
    const-string v0, "Native Android Browser Engine Ready"
    return-object v0
.end method
