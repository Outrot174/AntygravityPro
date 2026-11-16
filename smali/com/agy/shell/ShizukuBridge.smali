.class public final Lcom/agy/shell/ShizukuBridge;
.super Ljava/lang/Object;
.source "ShizukuBridge.java"


# instance fields
.field private final executor:Lcom/agy/shell/RishExecutor;

.field private final locator:Lcom/agy/shell/RishLocator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Lcom/agy/shell/RishLocator;

    invoke-direct {v0, p1}, Lcom/agy/shell/RishLocator;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/shell/ShizukuBridge;->locator:Lcom/agy/shell/RishLocator;

    .line 16
    new-instance v0, Lcom/agy/shell/RishExecutor;

    invoke-direct {v0, p1}, Lcom/agy/shell/RishExecutor;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/shell/ShizukuBridge;->executor:Lcom/agy/shell/RishExecutor;

    .line 17
    return-void
.end method


# virtual methods
.method public exec(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/agy/shell/ShizukuBridge;->executor:Lcom/agy/shell/RishExecutor;

    invoke-virtual {v0, p1}, Lcom/agy/shell/RishExecutor;->exec(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isAvailable()Z
    .locals 2

    .line 20
    iget-object v0, p0, Lcom/agy/shell/ShizukuBridge;->locator:Lcom/agy/shell/RishLocator;

    invoke-virtual {v0}, Lcom/agy/shell/RishLocator;->rishBinary()Ljava/io/File;

    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->canExecute()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
