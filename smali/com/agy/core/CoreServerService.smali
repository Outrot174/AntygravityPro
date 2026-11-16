.class public final Lcom/agy/core/CoreServerService;
.super Landroid/app/Service;
.source "CoreServerService.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CoreServer"


# instance fields
.field private volatile destroyed:Z

.field private gatewayServer:Lcom/agy/gateway/SystemGatewayServer;

.field private logBuffer:Lcom/agy/log/LogRingBuffer;

.field private final mainHandler:Landroid/os/Handler;

.field private openUrlWatcher:Lcom/agy/core/OpenUrlWatcher;

.field private runtime:Lcom/agy/runtime/RuntimeManager;

.field private supervisor:Lcom/agy/core/CoreProcessSupervisor;

.field private wakeLock:Lcom/agy/core/WakeLockHolder;


# direct methods
.method public static synthetic $r8$lambda$cHQU6LkxuzSyueE_rvGVNvzrFN8(Lcom/agy/core/CoreServerService;)V
    .locals 0

    invoke-direct {p0}, Lcom/agy/core/CoreServerService;->onSupervisorTerminated()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 20
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 30
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/agy/core/CoreServerService;->mainHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/agy/core/CoreServerService;)Z
    .locals 0

    .line 20
    iget-boolean p0, p0, Lcom/agy/core/CoreServerService;->destroyed:Z

    return p0
.end method

.method static synthetic access$100(Lcom/agy/core/CoreServerService;)Lcom/agy/core/WakeLockHolder;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/agy/core/CoreServerService;->wakeLock:Lcom/agy/core/WakeLockHolder;

    return-object p0
.end method

.method static synthetic access$200(Lcom/agy/core/CoreServerService;)Lcom/agy/runtime/RuntimeManager;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/agy/core/CoreServerService;->runtime:Lcom/agy/runtime/RuntimeManager;

    return-object p0
.end method

.method static synthetic access$300(Lcom/agy/core/CoreServerService;)Lcom/agy/core/OpenUrlWatcher;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/agy/core/CoreServerService;->openUrlWatcher:Lcom/agy/core/OpenUrlWatcher;

    return-object p0
.end method

.method private onSupervisorTerminated()V
    .locals 2

    .line 106
    iget-object v0, p0, Lcom/agy/core/CoreServerService;->mainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/agy/core/CoreServerService$1;

    invoke-direct {v1, p0}, Lcom/agy/core/CoreServerService$1;-><init>(Lcom/agy/core/CoreServerService;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 130
    return-void
.end method

.method private startBackgroundDaemon()V
    .locals 3

    .line 66
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/agy/core/CoreServerService$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/agy/core/CoreServerService$$ExternalSyntheticLambda1;-><init>(Lcom/agy/core/CoreServerService;)V

    const-string v2, "AgyDaemonStarter"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 82
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 83
    return-void
.end method

.method private stopBackgroundDaemon()V
    .locals 6

    .line 87
    const-string v0, "PATH"

    const-string v1, "CoreServer"

    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/core/CoreServerService;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "usr/bin/agy-daemon"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 88
    invoke-virtual {v2}, Ljava/io/File;->canExecute()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 89
    const-string v3, "Stopping autonomous background daemon..."

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    new-instance v3, Ljava/lang/ProcessBuilder;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const-string v2, "stop"

    const/4 v5, 0x1

    aput-object v2, v4, v5

    invoke-direct {v3, v4}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 91
    invoke-virtual {p0}, Lcom/agy/core/CoreServerService;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/ProcessBuilder;->directory(Ljava/io/File;)Ljava/lang/ProcessBuilder;

    .line 92
    invoke-virtual {v3}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/agy/core/CoreServerService;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/usr/bin:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    invoke-virtual {v3}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v0

    const-string v2, "HOME"

    invoke-virtual {p0}, Lcom/agy/core/CoreServerService;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    invoke-virtual {v3}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v0

    .line 95
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x5dc

    invoke-virtual {v0, v3, v4, v2}, Ljava/lang/Process;->waitFor(JLjava/util/concurrent/TimeUnit;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 96
    const-string v2, "agy-daemon stop timed out after 1500ms; destroying forcibly"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    invoke-virtual {v0}, Ljava/lang/Process;->destroyForcibly()Ljava/lang/Process;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    :cond_0
    goto :goto_0

    .line 100
    :catch_0
    move-exception v0

    .line 101
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to stop agy-daemon: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    :goto_0
    return-void
.end method


# virtual methods
.method synthetic lambda$startBackgroundDaemon$0$com-agy-core-CoreServerService()V
    .locals 6

    .line 69
    const-string v0, "PATH"

    const-string v1, "CoreServer"

    const-wide/16 v2, 0x5dc

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 70
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/core/CoreServerService;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "usr/bin/agy-daemon"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 71
    invoke-virtual {v2}, Ljava/io/File;->canExecute()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 72
    const-string v3, "Starting autonomous background daemon..."

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    new-instance v3, Ljava/lang/ProcessBuilder;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const-string v2, "start"

    const/4 v5, 0x1

    aput-object v2, v4, v5

    invoke-direct {v3, v4}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0}, Lcom/agy/core/CoreServerService;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/ProcessBuilder;->directory(Ljava/io/File;)Ljava/lang/ProcessBuilder;

    .line 75
    invoke-virtual {v3}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/agy/core/CoreServerService;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/usr/bin:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    invoke-virtual {v3}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v0

    const-string v2, "HOME"

    invoke-virtual {p0}, Lcom/agy/core/CoreServerService;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    invoke-virtual {v3}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :cond_0
    goto :goto_0

    .line 79
    :catch_0
    move-exception v0

    .line 80
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to start agy-daemon: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    :goto_0
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    .line 166
    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .locals 7

    .line 35
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 36
    new-instance v0, Lcom/agy/runtime/RuntimeManager;

    invoke-direct {v0, p0}, Lcom/agy/runtime/RuntimeManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/core/CoreServerService;->runtime:Lcom/agy/runtime/RuntimeManager;

    .line 37
    new-instance v0, Lcom/agy/log/LogRingBuffer;

    invoke-direct {v0}, Lcom/agy/log/LogRingBuffer;-><init>()V

    iput-object v0, p0, Lcom/agy/core/CoreServerService;->logBuffer:Lcom/agy/log/LogRingBuffer;

    .line 38
    new-instance v1, Lcom/agy/gateway/SystemGatewayServer;

    const v2, 0xb068

    invoke-direct {v1, p0, v0, v2}, Lcom/agy/gateway/SystemGatewayServer;-><init>(Landroid/content/Context;Lcom/agy/log/LogRingBuffer;I)V

    iput-object v1, p0, Lcom/agy/core/CoreServerService;->gatewayServer:Lcom/agy/gateway/SystemGatewayServer;

    .line 39
    invoke-virtual {v1}, Lcom/agy/gateway/SystemGatewayServer;->start()V

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "state paths: HOME="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/agy/core/CoreServerService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " appData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/agy/core/CoreServerService;->runtime:Lcom/agy/runtime/RuntimeManager;

    .line 42
    invoke-virtual {v1}, Lcom/agy/runtime/RuntimeManager;->getAppDataDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " projects="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/agy/core/CoreServerService;->runtime:Lcom/agy/runtime/RuntimeManager;

    .line 43
    invoke-virtual {v1}, Lcom/agy/runtime/RuntimeManager;->getProjectsDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " runtime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/agy/core/CoreServerService;->runtime:Lcom/agy/runtime/RuntimeManager;

    .line 44
    invoke-virtual {v1}, Lcom/agy/runtime/RuntimeManager;->getRuntimeDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 41
    const-string v1, "CoreServer"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    iget-object v0, p0, Lcom/agy/core/CoreServerService;->runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimeManager;->getHttpsPort()I

    move-result v0

    sput v0, Lcom/agy/core/CoreRuntimeState;->httpsPort:I

    .line 46
    iget-object v0, p0, Lcom/agy/core/CoreServerService;->runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimeManager;->getCsrfToken()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/agy/core/CoreRuntimeState;->csrfToken:Ljava/lang/String;

    .line 47
    const/4 v0, 0x0

    sput-boolean v0, Lcom/agy/core/CoreRuntimeState;->restarting:Z

    .line 48
    const/4 v0, 0x0

    sput-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 49
    sput-object v0, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    .line 51
    invoke-static {p0}, Lcom/agy/core/ForegroundNotification;->start(Landroid/app/Service;)V

    .line 52
    new-instance v0, Lcom/agy/core/WakeLockHolder;

    invoke-direct {v0}, Lcom/agy/core/WakeLockHolder;-><init>()V

    iput-object v0, p0, Lcom/agy/core/CoreServerService;->wakeLock:Lcom/agy/core/WakeLockHolder;

    .line 53
    invoke-virtual {v0, p0}, Lcom/agy/core/WakeLockHolder;->acquire(Landroid/content/Context;)V

    .line 55
    new-instance v0, Lcom/agy/core/OpenUrlWatcher;

    invoke-direct {v0, p0}, Lcom/agy/core/OpenUrlWatcher;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/core/CoreServerService;->openUrlWatcher:Lcom/agy/core/OpenUrlWatcher;

    .line 56
    invoke-virtual {v0}, Lcom/agy/core/OpenUrlWatcher;->start()V

    .line 58
    new-instance v0, Lcom/agy/core/CoreProcessSupervisor;

    iget-object v3, p0, Lcom/agy/core/CoreServerService;->runtime:Lcom/agy/runtime/RuntimeManager;

    iget-object v4, p0, Lcom/agy/core/CoreServerService;->openUrlWatcher:Lcom/agy/core/OpenUrlWatcher;

    iget-object v5, p0, Lcom/agy/core/CoreServerService;->logBuffer:Lcom/agy/log/LogRingBuffer;

    new-instance v6, Lcom/agy/core/CoreServerService$$ExternalSyntheticLambda0;

    invoke-direct {v6, p0}, Lcom/agy/core/CoreServerService$$ExternalSyntheticLambda0;-><init>(Lcom/agy/core/CoreServerService;)V

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/agy/core/CoreProcessSupervisor;-><init>(Landroid/content/Context;Lcom/agy/runtime/RuntimeManager;Lcom/agy/core/OpenUrlWatcher;Lcom/agy/log/LogRingBuffer;Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/agy/core/CoreServerService;->supervisor:Lcom/agy/core/CoreProcessSupervisor;

    .line 60
    invoke-virtual {v0}, Lcom/agy/core/CoreProcessSupervisor;->start()V

    .line 62
    invoke-direct {p0}, Lcom/agy/core/CoreServerService;->startBackgroundDaemon()V

    .line 63
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 134
    invoke-direct {p0}, Lcom/agy/core/CoreServerService;->stopBackgroundDaemon()V

    .line 135
    iget-object v0, p0, Lcom/agy/core/CoreServerService;->gatewayServer:Lcom/agy/gateway/SystemGatewayServer;

    if-eqz v0, :cond_0

    .line 136
    invoke-virtual {v0}, Lcom/agy/gateway/SystemGatewayServer;->stop()V

    .line 138
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/agy/core/CoreServerService;->destroyed:Z

    .line 139
    iget-object v0, p0, Lcom/agy/core/CoreServerService;->mainHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 141
    iget-object v0, p0, Lcom/agy/core/CoreServerService;->supervisor:Lcom/agy/core/CoreProcessSupervisor;

    if-eqz v0, :cond_1

    .line 142
    invoke-virtual {v0}, Lcom/agy/core/CoreProcessSupervisor;->stop()V

    .line 144
    :cond_1
    iget-object v0, p0, Lcom/agy/core/CoreServerService;->openUrlWatcher:Lcom/agy/core/OpenUrlWatcher;

    if-eqz v0, :cond_2

    .line 145
    invoke-virtual {v0}, Lcom/agy/core/OpenUrlWatcher;->stop()V

    .line 147
    :cond_2
    iget-object v0, p0, Lcom/agy/core/CoreServerService;->wakeLock:Lcom/agy/core/WakeLockHolder;

    if-eqz v0, :cond_3

    .line 148
    invoke-virtual {v0}, Lcom/agy/core/WakeLockHolder;->release()V

    .line 150
    :cond_3
    iget-object v0, p0, Lcom/agy/core/CoreServerService;->runtime:Lcom/agy/runtime/RuntimeManager;

    if-eqz v0, :cond_4

    .line 151
    invoke-virtual {v0}, Lcom/agy/runtime/RuntimeManager;->stopNetworkMonitor()V

    .line 153
    :cond_4
    sput-object v1, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    .line 154
    sput-object v1, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 155
    const/4 v0, 0x0

    sput-boolean v0, Lcom/agy/core/CoreRuntimeState;->restarting:Z

    .line 156
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 157
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    .line 161
    const/4 p1, 0x1

    return p1
.end method
