.class public final synthetic Lcom/agy/core/CoreServerService$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/agy/core/CoreServerService;


# direct methods
.method public synthetic constructor <init>(Lcom/agy/core/CoreServerService;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/agy/core/CoreServerService$$ExternalSyntheticLambda1;->f$0:Lcom/agy/core/CoreServerService;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/agy/core/CoreServerService$$ExternalSyntheticLambda1;->f$0:Lcom/agy/core/CoreServerService;

    invoke-virtual {v0}, Lcom/agy/core/CoreServerService;->lambda$startBackgroundDaemon$0$com-agy-core-CoreServerService()V

    return-void
.end method
