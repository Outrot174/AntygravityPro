.class Lcom/agy/bridge/UiBridge$2;
.super Ljava/lang/Object;
.source "UiBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/bridge/UiBridge;->onUiError(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/bridge/UiBridge;

.field final synthetic val$host:Lcom/agy/ui/MainActivity;

.field final synthetic val$safeError:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/agy/bridge/UiBridge;Lcom/agy/ui/MainActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 45
    iput-object p1, p0, Lcom/agy/bridge/UiBridge$2;->this$0:Lcom/agy/bridge/UiBridge;

    iput-object p2, p0, Lcom/agy/bridge/UiBridge$2;->val$host:Lcom/agy/ui/MainActivity;

    iput-object p3, p0, Lcom/agy/bridge/UiBridge$2;->val$safeError:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 48
    iget-object v0, p0, Lcom/agy/bridge/UiBridge$2;->val$host:Lcom/agy/ui/MainActivity;

    iget-object v1, p0, Lcom/agy/bridge/UiBridge$2;->val$safeError:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/agy/ui/MainActivity;->showFatalError(Ljava/lang/String;)V

    .line 49
    return-void
.end method
