.class public final Lcom/agy/net/NetworkMonitor;
.super Ljava/lang/Object;
.source "NetworkMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/agy/net/NetworkMonitor$Listener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "NetworkMonitor"


# instance fields
.field private final appContext:Landroid/content/Context;

.field private callback:Landroid/net/ConnectivityManager$NetworkCallback;

.field private connectivityManager:Landroid/net/ConnectivityManager;

.field private final listener:Lcom/agy/net/NetworkMonitor$Listener;

.field private registered:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/agy/net/NetworkMonitor$Listener;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/agy/net/NetworkMonitor;->appContext:Landroid/content/Context;

    .line 32
    iput-object p2, p0, Lcom/agy/net/NetworkMonitor;->listener:Lcom/agy/net/NetworkMonitor$Listener;

    .line 33
    return-void
.end method

.method static synthetic access$000(Lcom/agy/net/NetworkMonitor;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/agy/net/NetworkMonitor;->notifyChanged()V

    return-void
.end method

.method private notifyChanged()V
    .locals 3

    .line 99
    :try_start_0
    iget-object v0, p0, Lcom/agy/net/NetworkMonitor;->listener:Lcom/agy/net/NetworkMonitor$Listener;

    invoke-interface {v0}, Lcom/agy/net/NetworkMonitor$Listener;->onNetworkChanged()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    goto :goto_0

    .line 100
    :catch_0
    move-exception v0

    .line 101
    const-string v1, "NetworkMonitor"

    const-string v2, "network change listener failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 103
    :goto_0
    return-void
.end method


# virtual methods
.method public declared-synchronized register()V
    .locals 3

    monitor-enter p0

    .line 37
    :try_start_0
    iget-boolean v0, p0, Lcom/agy/net/NetworkMonitor;->registered:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 38
    monitor-exit p0

    return-void

    .line 40
    :cond_0
    nop

    .line 45
    :try_start_1
    iget-object v0, p0, Lcom/agy/net/NetworkMonitor;->appContext:Landroid/content/Context;

    const-string v1, "connectivity"

    .line 46
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 47
    if-nez v0, :cond_1

    .line 48
    const-string v0, "NetworkMonitor"

    const-string v1, "ConnectivityManager unavailable; DNS refresh disabled"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    monitor-exit p0

    return-void

    .line 51
    :cond_1
    :try_start_2
    new-instance v1, Lcom/agy/net/NetworkMonitor$1;

    invoke-direct {v1, p0}, Lcom/agy/net/NetworkMonitor$1;-><init>(Lcom/agy/net/NetworkMonitor;)V

    .line 67
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 68
    iput-object v0, p0, Lcom/agy/net/NetworkMonitor;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 69
    iput-object v1, p0, Lcom/agy/net/NetworkMonitor;->callback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/agy/net/NetworkMonitor;->registered:Z

    .line 71
    const-string v0, "NetworkMonitor"

    const-string v1, "registered default network callback"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 75
    :try_start_3
    const-string v1, "NetworkMonitor"

    const-string v2, "cannot register network callback; DNS refresh disabled"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 72
    :catch_1
    move-exception v0

    .line 73
    const-string v1, "NetworkMonitor"

    const-string v2, "ACCESS_NETWORK_STATE missing; DNS refresh disabled"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 76
    :goto_0
    nop

    .line 77
    :goto_1
    monitor-exit p0

    return-void

    .line 36
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unregister()V
    .locals 5

    monitor-enter p0

    .line 81
    :try_start_0
    iget-boolean v0, p0, Lcom/agy/net/NetworkMonitor;->registered:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/agy/net/NetworkMonitor;->connectivityManager:Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/agy/net/NetworkMonitor;->callback:Landroid/net/ConnectivityManager$NetworkCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v3, :cond_0

    goto :goto_2

    .line 87
    :cond_0
    :try_start_1
    invoke-virtual {v0, v3}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    :try_start_2
    iput-boolean v1, p0, Lcom/agy/net/NetworkMonitor;->registered:Z

    .line 92
    iput-object v2, p0, Lcom/agy/net/NetworkMonitor;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 93
    :goto_0
    iput-object v2, p0, Lcom/agy/net/NetworkMonitor;->callback:Landroid/net/ConnectivityManager$NetworkCallback;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 94
    goto :goto_1

    .line 88
    :catch_0
    move-exception v0

    .line 89
    :try_start_3
    const-string v3, "NetworkMonitor"

    const-string v4, "cannot unregister network callback"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    :try_start_4
    iput-boolean v1, p0, Lcom/agy/net/NetworkMonitor;->registered:Z

    .line 92
    iput-object v2, p0, Lcom/agy/net/NetworkMonitor;->connectivityManager:Landroid/net/ConnectivityManager;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    .line 95
    :goto_1
    monitor-exit p0

    return-void

    .line 91
    :catchall_0
    move-exception v0

    :try_start_5
    iput-boolean v1, p0, Lcom/agy/net/NetworkMonitor;->registered:Z

    .line 92
    iput-object v2, p0, Lcom/agy/net/NetworkMonitor;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 93
    iput-object v2, p0, Lcom/agy/net/NetworkMonitor;->callback:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 94
    throw v0

    .line 82
    :cond_1
    :goto_2
    iput-boolean v1, p0, Lcom/agy/net/NetworkMonitor;->registered:Z

    .line 83
    iput-object v2, p0, Lcom/agy/net/NetworkMonitor;->callback:Landroid/net/ConnectivityManager$NetworkCallback;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 84
    monitor-exit p0

    return-void

    .line 80
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method
