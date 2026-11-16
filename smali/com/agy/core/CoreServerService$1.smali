.class Lcom/agy/core/CoreServerService$1;
.super Ljava/lang/Object;
.source "CoreServerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/core/CoreServerService;->onSupervisorTerminated()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/core/CoreServerService;


# direct methods
.method constructor <init>(Lcom/agy/core/CoreServerService;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/agy/core/CoreServerService$1;->this$0:Lcom/agy/core/CoreServerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/agy/core/CoreServerService$1;->this$0:Lcom/agy/core/CoreServerService;

    invoke-static {v0}, Lcom/agy/core/CoreServerService;->access$000(Lcom/agy/core/CoreServerService;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    return-void

    .line 112
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    .line 113
    const/4 v0, 0x0

    sput-boolean v0, Lcom/agy/core/CoreRuntimeState;->restarting:Z

    .line 114
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 115
    const-string v0, "core supervisor stopped unexpectedly"

    sput-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 117
    :cond_1
    iget-object v0, p0, Lcom/agy/core/CoreServerService$1;->this$0:Lcom/agy/core/CoreServerService;

    invoke-static {v0}, Lcom/agy/core/CoreServerService;->access$100(Lcom/agy/core/CoreServerService;)Lcom/agy/core/WakeLockHolder;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 118
    iget-object v0, p0, Lcom/agy/core/CoreServerService$1;->this$0:Lcom/agy/core/CoreServerService;

    invoke-static {v0}, Lcom/agy/core/CoreServerService;->access$100(Lcom/agy/core/CoreServerService;)Lcom/agy/core/WakeLockHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/agy/core/WakeLockHolder;->release()V

    .line 120
    :cond_2
    iget-object v0, p0, Lcom/agy/core/CoreServerService$1;->this$0:Lcom/agy/core/CoreServerService;

    invoke-static {v0}, Lcom/agy/core/CoreServerService;->access$200(Lcom/agy/core/CoreServerService;)Lcom/agy/runtime/RuntimeManager;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 121
    iget-object v0, p0, Lcom/agy/core/CoreServerService$1;->this$0:Lcom/agy/core/CoreServerService;

    invoke-static {v0}, Lcom/agy/core/CoreServerService;->access$200(Lcom/agy/core/CoreServerService;)Lcom/agy/runtime/RuntimeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimeManager;->stopNetworkMonitor()V

    .line 123
    :cond_3
    iget-object v0, p0, Lcom/agy/core/CoreServerService$1;->this$0:Lcom/agy/core/CoreServerService;

    invoke-static {v0}, Lcom/agy/core/CoreServerService;->access$300(Lcom/agy/core/CoreServerService;)Lcom/agy/core/OpenUrlWatcher;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 124
    iget-object v0, p0, Lcom/agy/core/CoreServerService$1;->this$0:Lcom/agy/core/CoreServerService;

    invoke-static {v0}, Lcom/agy/core/CoreServerService;->access$300(Lcom/agy/core/CoreServerService;)Lcom/agy/core/OpenUrlWatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/agy/core/OpenUrlWatcher;->stop()V

    .line 126
    :cond_4
    iget-object v0, p0, Lcom/agy/core/CoreServerService$1;->this$0:Lcom/agy/core/CoreServerService;

    const-string v1, "Core stopped \u2014 open app to retry"

    invoke-static {v0, v1}, Lcom/agy/core/ForegroundNotification;->update(Landroid/app/Service;Ljava/lang/String;)V

    .line 128
    return-void
.end method
