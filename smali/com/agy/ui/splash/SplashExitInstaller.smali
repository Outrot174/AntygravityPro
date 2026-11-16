.class public final Lcom/agy/ui/splash/SplashExitInstaller;
.super Ljava/lang/Object;
.source "SplashExitInstaller.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public static install(Landroid/app/Activity;Landroid/view/View;)V
    .locals 2

    .line 17
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 18
    invoke-static {p0, p1}, Lcom/agy/ui/splash/SplashAnim31;->install(Landroid/app/Activity;Landroid/view/View;)V

    .line 20
    :cond_0
    return-void
.end method
