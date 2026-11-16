.class Lcom/agy/bridge/UiBridge$3;
.super Ljava/lang/Object;
.source "UiBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/bridge/UiBridge;->setDesktopMode(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/bridge/UiBridge;

.field final synthetic val$enabled:Z

.field final synthetic val$host:Lcom/agy/ui/MainActivity;


# direct methods
.method constructor <init>(Lcom/agy/bridge/UiBridge;Lcom/agy/ui/MainActivity;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 63
    iput-object p1, p0, Lcom/agy/bridge/UiBridge$3;->this$0:Lcom/agy/bridge/UiBridge;

    iput-object p2, p0, Lcom/agy/bridge/UiBridge$3;->val$host:Lcom/agy/ui/MainActivity;

    iput-boolean p3, p0, Lcom/agy/bridge/UiBridge$3;->val$enabled:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 66
    iget-object v0, p0, Lcom/agy/bridge/UiBridge$3;->val$host:Lcom/agy/ui/MainActivity;

    iget-boolean v1, p0, Lcom/agy/bridge/UiBridge$3;->val$enabled:Z

    invoke-virtual {v0, v1}, Lcom/agy/ui/MainActivity;->setDesktopMode(Z)V

    .line 67
    return-void
.end method
