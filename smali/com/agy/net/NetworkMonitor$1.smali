.class Lcom/agy/net/NetworkMonitor$1;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "NetworkMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/net/NetworkMonitor;->register()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/net/NetworkMonitor;


# direct methods
.method constructor <init>(Lcom/agy/net/NetworkMonitor;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/agy/net/NetworkMonitor$1;->this$0:Lcom/agy/net/NetworkMonitor;

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 0

    .line 54
    iget-object p1, p0, Lcom/agy/net/NetworkMonitor$1;->this$0:Lcom/agy/net/NetworkMonitor;

    invoke-static {p1}, Lcom/agy/net/NetworkMonitor;->access$000(Lcom/agy/net/NetworkMonitor;)V

    .line 55
    return-void
.end method

.method public onLinkPropertiesChanged(Landroid/net/Network;Landroid/net/LinkProperties;)V
    .locals 0

    .line 64
    iget-object p1, p0, Lcom/agy/net/NetworkMonitor$1;->this$0:Lcom/agy/net/NetworkMonitor;

    invoke-static {p1}, Lcom/agy/net/NetworkMonitor;->access$000(Lcom/agy/net/NetworkMonitor;)V

    .line 65
    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 0

    .line 59
    iget-object p1, p0, Lcom/agy/net/NetworkMonitor$1;->this$0:Lcom/agy/net/NetworkMonitor;

    invoke-static {p1}, Lcom/agy/net/NetworkMonitor;->access$000(Lcom/agy/net/NetworkMonitor;)V

    .line 60
    return-void
.end method
