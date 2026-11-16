.class public final Lcom/agy/core/CoreServiceLauncher;
.super Ljava/lang/Object;
.source "CoreServiceLauncher.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method

.method public static start(Landroid/content/Context;)V
    .locals 3

    .line 15
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/agy/core/CoreServerService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 16
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    .line 17
    invoke-virtual {p0, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 21
    :goto_0
    return-void
.end method

.method public static stop(Landroid/content/Context;)V
    .locals 2

    .line 25
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/agy/core/CoreServerService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    goto :goto_0

    .line 26
    :catch_0
    move-exception p0

    .line 28
    :goto_0
    return-void
.end method
