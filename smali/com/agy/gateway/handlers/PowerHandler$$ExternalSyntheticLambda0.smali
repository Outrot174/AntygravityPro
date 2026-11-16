.class public final synthetic Lcom/agy/gateway/handlers/PowerHandler$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiFunction;


# instance fields
.field public final synthetic f$0:Lcom/agy/gateway/handlers/PowerHandler;


# direct methods
.method public synthetic constructor <init>(Lcom/agy/gateway/handlers/PowerHandler;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/agy/gateway/handlers/PowerHandler$$ExternalSyntheticLambda0;->f$0:Lcom/agy/gateway/handlers/PowerHandler;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/agy/gateway/handlers/PowerHandler$$ExternalSyntheticLambda0;->f$0:Lcom/agy/gateway/handlers/PowerHandler;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0, p1, p2}, Lcom/agy/gateway/handlers/PowerHandler;->lambda$handle$0$com-agy-gateway-handlers-PowerHandler(Ljava/lang/String;Landroid/os/PowerManager$WakeLock;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    return-object p1
.end method
