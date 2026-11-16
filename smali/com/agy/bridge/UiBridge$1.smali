.class Lcom/agy/bridge/UiBridge$1;
.super Ljava/lang/Object;
.source "UiBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/bridge/UiBridge;->onUiReady()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/bridge/UiBridge;

.field final synthetic val$host:Lcom/agy/ui/MainActivity;


# direct methods
.method constructor <init>(Lcom/agy/bridge/UiBridge;Lcom/agy/ui/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 30
    iput-object p1, p0, Lcom/agy/bridge/UiBridge$1;->this$0:Lcom/agy/bridge/UiBridge;

    iput-object p2, p0, Lcom/agy/bridge/UiBridge$1;->val$host:Lcom/agy/ui/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/agy/bridge/UiBridge$1;->val$host:Lcom/agy/ui/MainActivity;

    invoke-virtual {v0}, Lcom/agy/ui/MainActivity;->dismissSplash()V

    .line 34
    return-void
.end method
