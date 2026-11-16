.class Lcom/agy/runtime/NetworkMonitorHolder$1;
.super Ljava/lang/Object;
.source "NetworkMonitorHolder.java"

# interfaces
.implements Lcom/agy/net/NetworkMonitor$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/runtime/NetworkMonitorHolder;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/runtime/NetworkMonitorHolder;


# direct methods
.method constructor <init>(Lcom/agy/runtime/NetworkMonitorHolder;)V
    .locals 0

    .line 20
    iput-object p1, p0, Lcom/agy/runtime/NetworkMonitorHolder$1;->this$0:Lcom/agy/runtime/NetworkMonitorHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNetworkChanged()V
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/agy/runtime/NetworkMonitorHolder$1;->this$0:Lcom/agy/runtime/NetworkMonitorHolder;

    invoke-static {v0}, Lcom/agy/runtime/NetworkMonitorHolder;->access$000(Lcom/agy/runtime/NetworkMonitorHolder;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/agy/runtime/NetworkConfigWriter;->write(Landroid/content/Context;)V

    .line 24
    return-void
.end method
