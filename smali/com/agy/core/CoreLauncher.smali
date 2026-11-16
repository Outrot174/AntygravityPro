.class public final Lcom/agy/core/CoreLauncher;
.super Ljava/lang/Object;
.source "CoreLauncher.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CoreLauncher"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method public static killOrphanCoreProcesses()V
    .locals 10

    .line 24
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    .line 25
    new-instance v1, Ljava/io/File;

    const-string v2, "/proc"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 26
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    return-void

    .line 30
    :cond_0
    nop

    .line 31
    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v4, v2, :cond_6

    aget-object v6, v1, v4

    .line 32
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    .line 33
    const-string v8, "\\d+"

    invoke-virtual {v7, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 34
    goto :goto_2

    .line 37
    :cond_1
    :try_start_0
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 38
    if-ne v7, v0, :cond_2

    .line 39
    goto :goto_2

    .line 41
    :cond_2
    new-instance v8, Ljava/io/File;

    const-string v9, "cmdline"

    invoke-direct {v8, v6, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 42
    invoke-virtual {v8}, Ljava/io/File;->canRead()Z

    move-result v6

    if-nez v6, :cond_3

    .line 43
    goto :goto_2

    .line 45
    :cond_3
    const/16 v6, 0x200

    new-array v6, v6, [B

    .line 47
    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    :try_start_1
    invoke-virtual {v9, v6}, Ljava/io/FileInputStream;->read([B)I

    move-result v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    :try_start_2
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V

    .line 50
    if-lez v8, :cond_5

    .line 51
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v6, v3, v8}, Ljava/lang/String;-><init>([BII)V

    .line 52
    const-string v6, "language_server"

    invoke-virtual {v9, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_4

    const-string v6, "liblanguage_server"

    invoke-virtual {v9, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 53
    :cond_4
    const-string v6, "CoreLauncher"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Terminating orphan core process (PID "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    const/16 v6, 0x9

    invoke-static {v7, v6}, Landroid/os/Process;->sendSignal(II)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 55
    const/4 v5, 0x1

    .line 59
    :cond_5
    goto :goto_2

    .line 47
    :catchall_0
    move-exception v6

    :try_start_3
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v7

    :try_start_4
    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v6
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 58
    :catch_0
    move-exception v6

    .line 31
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 61
    :cond_6
    if-eqz v5, :cond_7

    .line 62
    const-wide/16 v0, 0xc8

    invoke-static {v0, v1}, Lcom/agy/util/ProcessUtils;->sleep(J)V

    .line 64
    :cond_7
    return-void
.end method

.method public static launch(Lcom/agy/runtime/RuntimeManager;Ljava/io/File;)Ljava/lang/Process;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    invoke-static {}, Lcom/agy/core/CoreLauncher;->killOrphanCoreProcesses()V

    .line 72
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->installCore()V

    .line 75
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/agy/core/CoreLauncher$1;

    invoke-direct {v1, p0}, Lcom/agy/core/CoreLauncher$1;-><init>(Lcom/agy/runtime/RuntimeManager;)V

    const-wide/16 v2, 0xdac

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 81
    new-instance v0, Ljava/lang/ProcessBuilder;

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->coreCommand()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 82
    invoke-virtual {v0, p1}, Ljava/lang/ProcessBuilder;->directory(Ljava/io/File;)Ljava/lang/ProcessBuilder;

    .line 83
    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    .line 84
    invoke-virtual {p0, v0}, Lcom/agy/runtime/RuntimeManager;->applyEnvironment(Ljava/lang/ProcessBuilder;)V

    .line 85
    invoke-virtual {v0}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object p0

    return-object p0
.end method
