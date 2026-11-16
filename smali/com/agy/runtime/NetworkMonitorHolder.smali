.class public final Lcom/agy/runtime/NetworkMonitorHolder;
.super Ljava/lang/Object;
.source "NetworkMonitorHolder.java"


# instance fields
.field private final appContext:Landroid/content/Context;

.field private monitor:Lcom/agy/net/NetworkMonitor;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/agy/runtime/NetworkMonitorHolder;->appContext:Landroid/content/Context;

    .line 15
    return-void
.end method

.method static synthetic access$000(Lcom/agy/runtime/NetworkMonitorHolder;)Landroid/content/Context;
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/agy/runtime/NetworkMonitorHolder;->appContext:Landroid/content/Context;

    return-object p0
.end method


# virtual methods
.method public declared-synchronized start()V
    .locals 3

    monitor-enter p0

    .line 19
    :try_start_0
    iget-object v0, p0, Lcom/agy/runtime/NetworkMonitorHolder;->monitor:Lcom/agy/net/NetworkMonitor;

    if-nez v0, :cond_0

    .line 20
    new-instance v0, Lcom/agy/net/NetworkMonitor;

    iget-object v1, p0, Lcom/agy/runtime/NetworkMonitorHolder;->appContext:Landroid/content/Context;

    new-instance v2, Lcom/agy/runtime/NetworkMonitorHolder$1;

    invoke-direct {v2, p0}, Lcom/agy/runtime/NetworkMonitorHolder$1;-><init>(Lcom/agy/runtime/NetworkMonitorHolder;)V

    invoke-direct {v0, v1, v2}, Lcom/agy/net/NetworkMonitor;-><init>(Landroid/content/Context;Lcom/agy/net/NetworkMonitor$Listener;)V

    iput-object v0, p0, Lcom/agy/runtime/NetworkMonitorHolder;->monitor:Lcom/agy/net/NetworkMonitor;

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/agy/runtime/NetworkMonitorHolder;->monitor:Lcom/agy/net/NetworkMonitor;

    invoke-virtual {v0}, Lcom/agy/net/NetworkMonitor;->register()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    monitor-exit p0

    return-void

    .line 18
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unregister()V
    .locals 1

    monitor-enter p0

    .line 32
    :try_start_0
    iget-object v0, p0, Lcom/agy/runtime/NetworkMonitorHolder;->monitor:Lcom/agy/net/NetworkMonitor;

    if-eqz v0, :cond_0

    .line 33
    invoke-virtual {v0}, Lcom/agy/net/NetworkMonitor;->unregister()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    :cond_0
    monitor-exit p0

    return-void

    .line 31
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
