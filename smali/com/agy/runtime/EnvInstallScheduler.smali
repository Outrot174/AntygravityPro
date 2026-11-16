.class public final Lcom/agy/runtime/EnvInstallScheduler;
.super Ljava/lang/Object;
.source "EnvInstallScheduler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "EnvInstallScheduler"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    return-void
.end method

.method public static schedule(Lcom/agy/runtime/RuntimeManager;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 3

    .line 24
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    .line 25
    const-string p0, "EnvInstallScheduler"

    const-string p1, "env install already started; skipping duplicate"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    return-void

    .line 28
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lcom/agy/runtime/EnvInstallScheduler$1;

    invoke-direct {v2, p0, p1}, Lcom/agy/runtime/EnvInstallScheduler$1;-><init>(Lcom/agy/runtime/RuntimeManager;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    const-string p0, "EnvInstallThread"

    invoke-direct {v0, v2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 50
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 51
    return-void
.end method
