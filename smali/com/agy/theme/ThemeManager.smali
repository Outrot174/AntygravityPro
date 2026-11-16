.class public final Lcom/agy/theme/ThemeManager;
.super Ljava/lang/Object;
.source "ThemeManager.java"


# instance fields
.field private final controller:Lcom/agy/theme/ThemeController;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Lcom/agy/theme/ThemeController;

    invoke-direct {v0, p1}, Lcom/agy/theme/ThemeController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    .line 17
    return-void
.end method


# virtual methods
.method public applyLauncherIcon()V
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeController;->applyLauncherIcon()V

    .line 66
    return-void
.end method

.method public applyToActivity(Landroid/app/Activity;)V
    .locals 1

    .line 69
    if-eqz p1, :cond_0

    .line 70
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/agy/theme/ActivityPainter;->apply(Landroid/app/Activity;Z)V

    .line 72
    :cond_0
    return-void
.end method

.method public applyToWebView(Landroid/webkit/WebView;)V
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeController;->getBackgroundColor()I

    move-result v0

    invoke-static {p1, v0}, Lcom/agy/theme/WebViewPainter;->apply(Landroid/webkit/WebView;I)V

    .line 76
    return-void
.end method

.method public getBackgroundColor()I
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeController;->getBackgroundColor()I

    move-result v0

    return v0
.end method

.method public getBackgroundHex()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeController;->getBackgroundHex()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getForegroundHex()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeController;->getForegroundHex()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTheme()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeController;->getTheme()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isDark()Z
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result v0

    return v0
.end method

.method public mode()I
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0}, Lcom/agy/theme/ThemeController;->mode()I

    move-result v0

    return v0
.end method

.method public onVisualThemeChanged(Ljava/lang/String;)V
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0, p1}, Lcom/agy/theme/ThemeController;->onVisualThemeChanged(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public setTheme(Ljava/lang/String;)Z
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0, p1}, Lcom/agy/theme/ThemeController;->setTheme(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public setThemeByUser(Ljava/lang/String;)Z
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0, p1}, Lcom/agy/theme/ThemeController;->setThemeByUser(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public updateContext(Landroid/content/Context;)V
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/agy/theme/ThemeManager;->controller:Lcom/agy/theme/ThemeController;

    invoke-virtual {v0, p1}, Lcom/agy/theme/ThemeController;->updateContext(Landroid/content/Context;)V

    .line 21
    return-void
.end method
