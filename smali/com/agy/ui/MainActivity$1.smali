.class Lcom/agy/ui/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/agy/ui/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/ui/MainActivity;


# direct methods
.method constructor <init>(Lcom/agy/ui/MainActivity;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/agy/ui/MainActivity$1;->this$0:Lcom/agy/ui/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 86
    iget-object v0, p0, Lcom/agy/ui/MainActivity$1;->this$0:Lcom/agy/ui/MainActivity;

    invoke-static {v0}, Lcom/agy/ui/MainActivity;->access$000(Lcom/agy/ui/MainActivity;)V

    .line 87
    iget-object v0, p0, Lcom/agy/ui/MainActivity$1;->this$0:Lcom/agy/ui/MainActivity;

    invoke-static {v0}, Lcom/agy/ui/MainActivity;->access$100(Lcom/agy/ui/MainActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/agy/ui/MainActivity$1;->this$0:Lcom/agy/ui/MainActivity;

    invoke-static {v0}, Lcom/agy/ui/MainActivity;->access$300(Lcom/agy/ui/MainActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/agy/ui/MainActivity$1;->this$0:Lcom/agy/ui/MainActivity;

    invoke-static {v1}, Lcom/agy/ui/MainActivity;->access$200(Lcom/agy/ui/MainActivity;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 89
    const-wide/16 v1, 0x3e8

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0x32

    .line 88
    :goto_0
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 91
    :cond_1
    return-void
.end method
