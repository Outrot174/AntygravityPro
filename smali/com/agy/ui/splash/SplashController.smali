.class public final Lcom/agy/ui/splash/SplashController;
.super Ljava/lang/Object;
.source "SplashController.java"


# static fields
.field public static final MODE_ERROR:I = 0x2

.field public static final MODE_LOADING:I = 0x0

.field public static final MODE_TRANSIENT:I = 0x1


# instance fields
.field private final context:Landroid/content/Context;

.field private dismissed:Z

.field private fatalShown:Z

.field private mode:I

.field private retryListener:Lcom/agy/ui/splash/SplashRetryListener;

.field private final root:Landroid/widget/FrameLayout;

.field private final theme:Lcom/agy/theme/ThemeManager;

.field private final view:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/agy/theme/ThemeManager;Landroid/widget/FrameLayout;)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->dismissed:Z

    .line 29
    iput-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->fatalShown:Z

    .line 30
    iput v0, p0, Lcom/agy/ui/splash/SplashController;->mode:I

    .line 33
    iput-object p1, p0, Lcom/agy/ui/splash/SplashController;->context:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/agy/ui/splash/SplashController;->theme:Lcom/agy/theme/ThemeManager;

    .line 35
    iput-object p3, p0, Lcom/agy/ui/splash/SplashController;->root:Landroid/widget/FrameLayout;

    .line 36
    new-instance p2, Landroid/webkit/WebView;

    invoke-direct {p2, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    .line 37
    invoke-virtual {p2, v0}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 38
    invoke-virtual {p2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p1

    .line 39
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 40
    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 41
    return-void
.end method

.method static synthetic access$000(Lcom/agy/ui/splash/SplashController;)Landroid/webkit/WebView;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    return-object p0
.end method

.method private background()Ljava/lang/String;
    .locals 1

    .line 158
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->theme:Lcom/agy/theme/ThemeManager;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeManager;->getBackgroundHex()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private foreground()Ljava/lang/String;
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->theme:Lcom/agy/theme/ThemeManager;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeManager;->getForegroundHex()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public clearFatal()V
    .locals 1

    .line 103
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->fatalShown:Z

    .line 104
    return-void
.end method

.method public dismiss()V
    .locals 3

    .line 119
    iget-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->dismissed:Z

    if-eqz v0, :cond_0

    .line 120
    return-void

    .line 122
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->dismissed:Z

    .line 123
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 124
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 125
    const-wide/16 v1, 0x118

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/agy/ui/splash/SplashController$1;

    invoke-direct {v1, p0}, Lcom/agy/ui/splash/SplashController$1;-><init>(Lcom/agy/ui/splash/SplashController;)V

    .line 126
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 137
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 138
    return-void
.end method

.method public installExitAnimation(Landroid/app/Activity;)V
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    invoke-static {p1, v0}, Lcom/agy/ui/splash/SplashExitInstaller;->install(Landroid/app/Activity;Landroid/view/View;)V

    .line 151
    return-void
.end method

.method public isFatalShown()Z
    .locals 1

    .line 52
    iget-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->fatalShown:Z

    return v0
.end method

.method public loadInitial()V
    .locals 3

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lcom/agy/ui/splash/SplashController;->mode:I

    .line 63
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->foreground()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->background()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/agy/ui/splash/SplashLoadingHtml;->load(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public mode()I
    .locals 1

    .line 48
    iget v0, p0, Lcom/agy/ui/splash/SplashController;->mode:I

    return v0
.end method

.method public refresh()V
    .locals 3

    .line 142
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 143
    iget v0, p0, Lcom/agy/ui/splash/SplashController;->mode:I

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->dismissed:Z

    if-nez v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->foreground()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->background()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/agy/ui/splash/SplashLoadingHtml;->load(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    :cond_0
    return-void
.end method

.method public setRetryListener(Lcom/agy/ui/splash/SplashRetryListener;)V
    .locals 2

    .line 56
    iput-object p1, p0, Lcom/agy/ui/splash/SplashController;->retryListener:Lcom/agy/ui/splash/SplashRetryListener;

    .line 57
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/agy/ui/splash/SplashController;->context:Landroid/content/Context;

    invoke-static {v0, v1, p1}, Lcom/agy/ui/splash/SplashRetryBridge;->bind(Landroid/webkit/WebView;Landroid/content/Context;Lcom/agy/ui/splash/SplashRetryListener;)V

    .line 58
    return-void
.end method

.method public setVisible()V
    .locals 3

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->dismissed:Z

    .line 108
    iget-object v1, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setAlpha(F)V

    .line 109
    iget-object v1, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_0

    .line 110
    iget-object v1, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->root:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1

    .line 113
    iget-object v1, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->bringChildToFront(Landroid/view/View;)V

    .line 115
    :cond_1
    return-void
.end method

.method public showFatalError(Ljava/lang/String;)V
    .locals 10

    .line 90
    iget-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->fatalShown:Z

    if-eqz v0, :cond_0

    .line 91
    return-void

    .line 93
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->fatalShown:Z

    .line 94
    const/4 v1, 0x2

    iput v1, p0, Lcom/agy/ui/splash/SplashController;->mode:I

    .line 95
    invoke-virtual {p0}, Lcom/agy/ui/splash/SplashController;->setVisible()V

    .line 96
    iget-object v1, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/agy/ui/splash/SplashController;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/agy/ui/splash/SplashController;->retryListener:Lcom/agy/ui/splash/SplashRetryListener;

    invoke-static {v1, v2, v3}, Lcom/agy/ui/splash/SplashRetryBridge;->bind(Landroid/webkit/WebView;Landroid/content/Context;Lcom/agy/ui/splash/SplashRetryListener;)V

    .line 97
    iget-object v4, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    const-string v5, "Antigravity failed to start"

    .line 98
    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->foreground()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->background()Ljava/lang/String;

    move-result-object v8

    iget-object v1, p0, Lcom/agy/ui/splash/SplashController;->retryListener:Lcom/agy/ui/splash/SplashRetryListener;

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    move v9, v0

    .line 97
    move-object v6, p1

    invoke-static/range {v4 .. v9}, Lcom/agy/ui/splash/SplashOverlayHtml;->show(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 99
    return-void
.end method

.method public showLoading()V
    .locals 3

    .line 68
    invoke-virtual {p0}, Lcom/agy/ui/splash/SplashController;->setVisible()V

    .line 69
    iget v0, p0, Lcom/agy/ui/splash/SplashController;->mode:I

    if-eqz v0, :cond_0

    .line 70
    const/4 v0, 0x0

    iput v0, p0, Lcom/agy/ui/splash/SplashController;->mode:I

    .line 71
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->foreground()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->background()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/agy/ui/splash/SplashLoadingHtml;->load(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    :cond_0
    return-void
.end method

.method public showTransient(Ljava/lang/String;)V
    .locals 8

    .line 77
    iget-boolean v0, p0, Lcom/agy/ui/splash/SplashController;->fatalShown:Z

    if-eqz v0, :cond_0

    .line 78
    return-void

    .line 80
    :cond_0
    invoke-virtual {p0}, Lcom/agy/ui/splash/SplashController;->setVisible()V

    .line 81
    iget v0, p0, Lcom/agy/ui/splash/SplashController;->mode:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 82
    iput v1, p0, Lcom/agy/ui/splash/SplashController;->mode:I

    .line 83
    iget-object v2, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    const-string v3, "Restarting Antigravity"

    .line 84
    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->foreground()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0}, Lcom/agy/ui/splash/SplashController;->background()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    .line 83
    move-object v4, p1

    invoke-static/range {v2 .. v7}, Lcom/agy/ui/splash/SplashOverlayHtml;->show(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 86
    :cond_1
    return-void
.end method

.method public view()Landroid/webkit/WebView;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController;->view:Landroid/webkit/WebView;

    return-object v0
.end method
