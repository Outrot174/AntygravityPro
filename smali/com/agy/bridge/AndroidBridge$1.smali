.class Lcom/agy/bridge/AndroidBridge$1;
.super Ljava/lang/Object;
.source "AndroidBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/bridge/AndroidBridge;->openDirectoryPicker()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/bridge/AndroidBridge;

.field final synthetic val$act:Lcom/agy/ui/MainActivity;


# direct methods
.method constructor <init>(Lcom/agy/bridge/AndroidBridge;Lcom/agy/ui/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 55
    iput-object p1, p0, Lcom/agy/bridge/AndroidBridge$1;->this$0:Lcom/agy/bridge/AndroidBridge;

    iput-object p2, p0, Lcom/agy/bridge/AndroidBridge$1;->val$act:Lcom/agy/ui/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/agy/bridge/AndroidBridge$1;->val$act:Lcom/agy/ui/MainActivity;

    invoke-virtual {v0}, Lcom/agy/ui/MainActivity;->launchDirectoryPicker()V

    .line 59
    return-void
.end method
