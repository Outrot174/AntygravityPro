.class public final synthetic Lcom/agy/gateway/handlers/ExecHandler$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Process;

.field public final synthetic f$1:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Process;Ljava/lang/StringBuilder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/agy/gateway/handlers/ExecHandler$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Process;

    iput-object p2, p0, Lcom/agy/gateway/handlers/ExecHandler$$ExternalSyntheticLambda1;->f$1:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/agy/gateway/handlers/ExecHandler$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Process;

    iget-object v1, p0, Lcom/agy/gateway/handlers/ExecHandler$$ExternalSyntheticLambda1;->f$1:Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lcom/agy/gateway/handlers/ExecHandler;->lambda$handle$1(Ljava/lang/Process;Ljava/lang/StringBuilder;)V

    return-void
.end method
