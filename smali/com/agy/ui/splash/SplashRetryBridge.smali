.class public final Lcom/agy/ui/splash/SplashRetryBridge;
.super Ljava/lang/Object;
.source "SplashRetryBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/agy/ui/splash/SplashRetryBridge$Bridge;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field public static final RETRY_BRIDGE:Ljava/lang/String; = "SplashRetry"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 13
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/agy/ui/splash/SplashRetryBridge;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method static synthetic access$100()Landroid/os/Handler;
    .locals 1

    .line 9
    sget-object v0, Lcom/agy/ui/splash/SplashRetryBridge;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method public static bind(Landroid/webkit/WebView;Landroid/content/Context;Lcom/agy/ui/splash/SplashRetryListener;)V
    .locals 1

    .line 20
    if-nez p0, :cond_0

    .line 21
    return-void

    .line 23
    :cond_0
    new-instance v0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge;

    invoke-direct {v0, p1, p2}, Lcom/agy/ui/splash/SplashRetryBridge$Bridge;-><init>(Landroid/content/Context;Lcom/agy/ui/splash/SplashRetryListener;)V

    const-string p1, "SplashRetry"

    invoke-virtual {p0, v0, p1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method public static bind(Landroid/webkit/WebView;Lcom/agy/ui/splash/SplashRetryListener;)V
    .locals 1

    .line 27
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/agy/ui/splash/SplashRetryBridge;->bind(Landroid/webkit/WebView;Landroid/content/Context;Lcom/agy/ui/splash/SplashRetryListener;)V

    .line 28
    return-void
.end method
