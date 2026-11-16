.class final Lcom/agy/ui/splash/SplashRetryBridge$Bridge;
.super Ljava/lang/Object;
.source "SplashRetryBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/agy/ui/splash/SplashRetryBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Bridge"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final listener:Lcom/agy/ui/splash/SplashRetryListener;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/agy/ui/splash/SplashRetryListener;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge;->context:Landroid/content/Context;

    .line 36
    iput-object p2, p0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge;->listener:Lcom/agy/ui/splash/SplashRetryListener;

    .line 37
    return-void
.end method

.method static synthetic access$000(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)Lcom/agy/ui/splash/SplashRetryListener;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge;->listener:Lcom/agy/ui/splash/SplashRetryListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)Landroid/content/Context;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge;->context:Landroid/content/Context;

    return-object p0
.end method


# virtual methods
.method public copyLogs()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 56
    invoke-static {}, Lcom/agy/ui/splash/SplashRetryBridge;->access$100()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$2;

    invoke-direct {v1, p0}, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$2;-><init>(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 62
    return-void
.end method

.method public retry()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 41
    invoke-static {}, Lcom/agy/ui/splash/SplashRetryBridge;->access$100()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$1;

    invoke-direct {v1, p0}, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$1;-><init>(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 52
    return-void
.end method

.method public saveLogs()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 66
    invoke-static {}, Lcom/agy/ui/splash/SplashRetryBridge;->access$100()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$3;

    invoke-direct {v1, p0}, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$3;-><init>(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 72
    return-void
.end method
