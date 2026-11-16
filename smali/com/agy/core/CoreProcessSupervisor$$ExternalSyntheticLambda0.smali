.class public final synthetic Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/agy/core/CoreProcessSupervisor;

.field public final synthetic f$1:Ljava/lang/Process;

.field public final synthetic f$2:Ljava/io/Writer;


# direct methods
.method public synthetic constructor <init>(Lcom/agy/core/CoreProcessSupervisor;Ljava/lang/Process;Ljava/io/Writer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda0;->f$0:Lcom/agy/core/CoreProcessSupervisor;

    iput-object p2, p0, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Process;

    iput-object p3, p0, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda0;->f$2:Ljava/io/Writer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda0;->f$0:Lcom/agy/core/CoreProcessSupervisor;

    iget-object v1, p0, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Process;

    iget-object v2, p0, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda0;->f$2:Ljava/io/Writer;

    invoke-virtual {v0, v1, v2}, Lcom/agy/core/CoreProcessSupervisor;->lambda$runCoreLoop$0$com-agy-core-CoreProcessSupervisor(Ljava/lang/Process;Ljava/io/Writer;)V

    return-void
.end method
