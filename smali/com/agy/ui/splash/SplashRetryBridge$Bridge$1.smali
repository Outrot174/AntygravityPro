.class Lcom/agy/ui/splash/SplashRetryBridge$Bridge$1;
.super Ljava/lang/Object;
.source "SplashRetryBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/splash/SplashRetryBridge$Bridge;->retry()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/ui/splash/SplashRetryBridge$Bridge;


# direct methods
.method constructor <init>(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$1;->this$0:Lcom/agy/ui/splash/SplashRetryBridge$Bridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 45
    :try_start_0
    iget-object v0, p0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$1;->this$0:Lcom/agy/ui/splash/SplashRetryBridge$Bridge;

    invoke-static {v0}, Lcom/agy/ui/splash/SplashRetryBridge$Bridge;->access$000(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)Lcom/agy/ui/splash/SplashRetryListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$1;->this$0:Lcom/agy/ui/splash/SplashRetryBridge$Bridge;

    invoke-static {v0}, Lcom/agy/ui/splash/SplashRetryBridge$Bridge;->access$000(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)Lcom/agy/ui/splash/SplashRetryListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/agy/ui/splash/SplashRetryListener;->onRetry()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :cond_0
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 50
    :goto_0
    return-void
.end method
