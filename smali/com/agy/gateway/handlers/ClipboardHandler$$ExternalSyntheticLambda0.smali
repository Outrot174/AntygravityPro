.class public final synthetic Lcom/agy/gateway/handlers/ClipboardHandler$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/agy/gateway/handlers/ClipboardHandler;

.field public final synthetic f$1:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic f$2:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public synthetic constructor <init>(Lcom/agy/gateway/handlers/ClipboardHandler;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/agy/gateway/handlers/ClipboardHandler$$ExternalSyntheticLambda0;->f$0:Lcom/agy/gateway/handlers/ClipboardHandler;

    iput-object p2, p0, Lcom/agy/gateway/handlers/ClipboardHandler$$ExternalSyntheticLambda0;->f$1:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p3, p0, Lcom/agy/gateway/handlers/ClipboardHandler$$ExternalSyntheticLambda0;->f$2:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/agy/gateway/handlers/ClipboardHandler$$ExternalSyntheticLambda0;->f$0:Lcom/agy/gateway/handlers/ClipboardHandler;

    iget-object v1, p0, Lcom/agy/gateway/handlers/ClipboardHandler$$ExternalSyntheticLambda0;->f$1:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v2, p0, Lcom/agy/gateway/handlers/ClipboardHandler$$ExternalSyntheticLambda0;->f$2:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0, v1, v2}, Lcom/agy/gateway/handlers/ClipboardHandler;->lambda$handle$0$com-agy-gateway-handlers-ClipboardHandler(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V

    return-void
.end method
