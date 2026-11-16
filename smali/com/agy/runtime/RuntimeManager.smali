.class public final Lcom/agy/runtime/RuntimeManager;
.super Ljava/lang/Object;
.source "RuntimeManager.java"


# static fields
.field public static final CORE_VERSION:Ljava/lang/String; = "2.11.0"


# instance fields
.field private final appContext:Landroid/content/Context;

.field private final csrfToken:Ljava/lang/String;

.field private final envInstallStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final network:Lcom/agy/runtime/NetworkMonitorHolder;

.field private final paths:Lcom/agy/runtime/RuntimePaths;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/agy/runtime/RuntimeManager;->envInstallStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/agy/runtime/RuntimeManager;->appContext:Landroid/content/Context;

    .line 32
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/agy/runtime/RuntimeManager;->csrfToken:Ljava/lang/String;

    .line 33
    new-instance v0, Lcom/agy/runtime/RuntimePaths;

    invoke-direct {v0, p1}, Lcom/agy/runtime/RuntimePaths;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/runtime/RuntimeManager;->paths:Lcom/agy/runtime/RuntimePaths;

    .line 34
    new-instance v0, Lcom/agy/runtime/NetworkMonitorHolder;

    invoke-direct {v0, p1}, Lcom/agy/runtime/NetworkMonitorHolder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/runtime/RuntimeManager;->network:Lcom/agy/runtime/NetworkMonitorHolder;

    .line 35
    return-void
.end method


# virtual methods
.method public appContext()Landroid/content/Context;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->appContext:Landroid/content/Context;

    return-object v0
.end method

.method public applyEnvironment(Ljava/lang/ProcessBuilder;)V
    .locals 0

    .line 146
    invoke-static {p0, p1}, Lcom/agy/core/CoreEnvironment;->apply(Lcom/agy/runtime/RuntimeManager;Ljava/lang/ProcessBuilder;)V

    .line 147
    return-void
.end method

.method public coreCommand()[Ljava/lang/String;
    .locals 5

    .line 101
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getBinDir()Ljava/io/File;

    move-result-object v0

    .line 102
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getLibDir()Ljava/io/File;

    move-result-object v1

    .line 103
    new-instance v2, Ljava/io/File;

    const-string v3, "libloader.so"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 104
    new-instance v3, Ljava/io/File;

    const-string v4, "liblanguage_server.so"

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 105
    new-instance v0, Ljava/io/File;

    const-string v4, "liblse_compat.so"

    invoke-direct {v0, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 106
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 109
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 113
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 114
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    const-string v2, "--library-path"

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 118
    const-string v1, "--preload"

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    const-string v0, "--standalone"

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    const-string v0, "--override_ide_name"

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    const-string v0, "antigravity"

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    const-string v1, "--subclient_type"

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    const-string v1, "hub"

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    const-string v1, "--override_ide_version"

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    const-string v1, "2.11.0"

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    const-string v1, "--override_user_agent_name"

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    const-string v0, "--https_server_port"

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getHttpsPort()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    const-string v0, "--csrf_token"

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->csrfToken:Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    const-string v0, "--app_data_dir"

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    const-string v0, "antigravity-app"

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    const-string v0, "--web_bundle_path"

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getWebDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    const-string v0, "--enable_sidecars"

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0

    .line 110
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "core binary missing: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "glibc loader missing: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAppDataDir()Ljava/io/File;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->paths:Lcom/agy/runtime/RuntimePaths;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimePaths;->getAppDataDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getBinDir()Ljava/io/File;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->paths:Lcom/agy/runtime/RuntimePaths;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimePaths;->getBinDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getCertFile()Ljava/io/File;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->paths:Lcom/agy/runtime/RuntimePaths;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimePaths;->getCertFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getCsrfToken()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->csrfToken:Ljava/lang/String;

    return-object v0
.end method

.method public getGeminiDir()Ljava/io/File;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->paths:Lcom/agy/runtime/RuntimePaths;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimePaths;->getGeminiDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getHttpsPort()I
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->appContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/agy/runtime/RuntimeConfig;->httpsPort(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method public getLibDir()Ljava/io/File;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->paths:Lcom/agy/runtime/RuntimePaths;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimePaths;->getLibDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getProjectsDir()Ljava/io/File;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->paths:Lcom/agy/runtime/RuntimePaths;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimePaths;->getProjectsDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getRuntimeDir()Ljava/io/File;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->paths:Lcom/agy/runtime/RuntimePaths;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimePaths;->getRuntimeDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getWebDir()Ljava/io/File;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->paths:Lcom/agy/runtime/RuntimePaths;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimePaths;->getWebDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized installCore()V
    .locals 1

    monitor-enter p0

    .line 88
    :try_start_0
    invoke-static {p0}, Lcom/agy/runtime/CoreInstaller;->installCore(Lcom/agy/runtime/RuntimeManager;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    monitor-exit p0

    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public installEnvInBackground()V
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->envInstallStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {p0, v0}, Lcom/agy/runtime/EnvInstallScheduler;->schedule(Lcom/agy/runtime/RuntimeManager;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 97
    return-void
.end method

.method public declared-synchronized refreshNetwork()V
    .locals 2

    monitor-enter p0

    .line 167
    :try_start_0
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->writeNetworkConfig()V

    .line 168
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 169
    const-string v0, "RuntimeManager"

    const-string v1, "network changed; rewrote DNS config (core stays up)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 171
    :cond_0
    const-string v0, "RuntimeManager"

    const-string v1, "network changed; DNS config refreshed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    :goto_0
    monitor-exit p0

    return-void

    .line 166
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public startNetworkMonitor()V
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->network:Lcom/agy/runtime/NetworkMonitorHolder;

    invoke-virtual {v0}, Lcom/agy/runtime/NetworkMonitorHolder;->start()V

    .line 154
    return-void
.end method

.method public stopNetworkMonitor()V
    .locals 1

    .line 158
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->network:Lcom/agy/runtime/NetworkMonitorHolder;

    invoke-virtual {v0}, Lcom/agy/runtime/NetworkMonitorHolder;->unregister()V

    .line 159
    return-void
.end method

.method public declared-synchronized writeNetworkConfig()V
    .locals 1

    monitor-enter p0

    .line 176
    :try_start_0
    iget-object v0, p0, Lcom/agy/runtime/RuntimeManager;->appContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/agy/runtime/NetworkConfigWriter;->write(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 177
    monitor-exit p0

    return-void

    .line 175
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
