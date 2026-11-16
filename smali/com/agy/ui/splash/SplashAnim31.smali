.class public final Lcom/agy/ui/splash/SplashAnim31;
.super Ljava/lang/Object;
.source "SplashAnim31.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;Landroid/view/View;)V
    .locals 0

    .line 16
    invoke-static {p0, p1}, Lcom/agy/ui/splash/SplashAnim31;->animateExit(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    .line 16
    invoke-static {p0, p1}, Lcom/agy/ui/splash/SplashAnim31;->reflectVoid(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method private static animateExit(Ljava/lang/Object;Landroid/view/View;)V
    .locals 5

    .line 53
    nop

    .line 54
    if-eqz p0, :cond_0

    .line 55
    :try_start_0
    const-string v0, "getView"

    invoke-static {p0, v0}, Lcom/agy/ui/splash/SplashAnim31;->reflectView(Ljava/lang/Object;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 56
    if-nez v0, :cond_1

    .line 57
    const-string v0, "getIconView"

    invoke-static {p0, v0}, Lcom/agy/ui/splash/SplashAnim31;->reflectView(Ljava/lang/Object;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    goto :goto_2

    .line 54
    :cond_0
    const/4 v0, 0x0

    .line 60
    :cond_1
    :goto_0
    const-wide/16 v1, 0x118

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    .line 61
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 62
    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 63
    const v4, 0x3f59999a    # 0.85f

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 64
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 65
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 66
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v4, Lcom/agy/ui/splash/SplashAnim31$2;

    invoke-direct {v4, p0}, Lcom/agy/ui/splash/SplashAnim31$2;-><init>(Ljava/lang/Object;)V

    .line 67
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    .line 73
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_1

    .line 75
    :cond_2
    const-string v0, "remove"

    invoke-static {p0, v0}, Lcom/agy/ui/splash/SplashAnim31;->reflectVoid(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    :goto_1
    if-eqz p1, :cond_3

    .line 78
    invoke-virtual {p1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 79
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    :cond_3
    nop

    .line 83
    :goto_2
    return-void
.end method

.method public static install(Landroid/app/Activity;Landroid/view/View;)V
    .locals 4

    .line 23
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getSplashScreen()Landroid/window/SplashScreen;

    move-result-object p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    return-void

    .line 27
    :cond_0
    const-string v0, "android.window.SplashScreen$OnExitAnimationListener"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 29
    nop

    .line 30
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    new-instance v0, Lcom/agy/ui/splash/SplashAnim31$1;

    invoke-direct {v0, p1}, Lcom/agy/ui/splash/SplashAnim31$1;-><init>(Landroid/view/View;)V

    .line 29
    invoke-static {v1, v2, v0}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p1

    .line 44
    check-cast p1, Landroid/window/SplashScreen$OnExitAnimationListener;

    invoke-interface {p0, p1}, Landroid/window/SplashScreen;->setOnExitAnimationListener(Landroid/window/SplashScreen$OnExitAnimationListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 49
    :goto_0
    return-void
.end method

.method private static reflectView(Ljava/lang/Object;Ljava/lang/String;)Landroid/view/View;
    .locals 4

    .line 86
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 87
    return-object v0

    .line 90
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v1, p1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 91
    :catchall_0
    move-exception p0

    .line 92
    return-object v0
.end method

.method private static reflectVoid(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3

    .line 97
    if-nez p0, :cond_0

    .line 98
    return-void

    .line 101
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    goto :goto_0

    .line 102
    :catchall_0
    move-exception p0

    .line 104
    :goto_0
    return-void
.end method
