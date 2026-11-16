.class Lcom/agy/ui/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/MainActivity;->watchCore()V
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

    .line 114
    iput-object p1, p0, Lcom/agy/ui/MainActivity$2;->this$0:Lcom/agy/ui/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 117
    iget-object v0, p0, Lcom/agy/ui/MainActivity$2;->this$0:Lcom/agy/ui/MainActivity;

    invoke-static {v0}, Lcom/agy/ui/MainActivity;->access$200(Lcom/agy/ui/MainActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/agy/ui/MainActivity$2;->this$0:Lcom/agy/ui/MainActivity;

    invoke-static {v0}, Lcom/agy/ui/MainActivity;->access$400(Lcom/agy/ui/MainActivity;)Lcom/agy/ui/splash/SplashController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/agy/ui/splash/SplashController;->isFatalShown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 118
    const-string v0, "MainActivity"

    const-string v1, "watchdog: auto-dismissing splash after timeout"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    iget-object v0, p0, Lcom/agy/ui/MainActivity$2;->this$0:Lcom/agy/ui/MainActivity;

    invoke-virtual {v0}, Lcom/agy/ui/MainActivity;->dismissSplash()V

    .line 121
    :cond_0
    return-void
.end method
