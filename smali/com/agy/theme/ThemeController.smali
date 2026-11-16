.class public final Lcom/agy/theme/ThemeController;
.super Ljava/lang/Object;
.source "ThemeController.java"


# instance fields
.field private final appContext:Landroid/content/Context;

.field private currentContext:Landroid/content/Context;

.field private mode:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/agy/theme/ThemeController;->appContext:Landroid/content/Context;

    .line 17
    iput-object p1, p0, Lcom/agy/theme/ThemeController;->currentContext:Landroid/content/Context;

    .line 18
    invoke-static {v0}, Lcom/agy/theme/ThemePrefs;->load(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lcom/agy/theme/ThemeController;->mode:I

    .line 19
    return-void
.end method


# virtual methods
.method public applyLauncherIcon()V
    .locals 2

    .line 130
    iget-object v0, p0, Lcom/agy/theme/ThemeController;->currentContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/agy/theme/ThemeController;->appContext:Landroid/content/Context;

    :goto_0
    invoke-virtual {p0}, Lcom/agy/theme/ThemeController;->isLauncherDark()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/agy/theme/LauncherIconSwitcher;->apply(Landroid/content/Context;Z)V

    .line 131
    return-void
.end method

.method public getBackgroundColor()I
    .locals 1

    .line 114
    invoke-virtual {p0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, -0xefeff0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public getBackgroundHex()Ljava/lang/String;
    .locals 1

    .line 118
    invoke-virtual {p0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "#101010"

    goto :goto_0

    :cond_0
    const-string v0, "#ffffff"

    :goto_0
    return-object v0
.end method

.method public getForegroundHex()Ljava/lang/String;
    .locals 1

    .line 122
    invoke-virtual {p0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "#ffffff"

    goto :goto_0

    :cond_0
    const-string v0, "#101010"

    :goto_0
    return-object v0
.end method

.method public getTheme()Ljava/lang/String;
    .locals 1

    .line 100
    invoke-virtual {p0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "dark"

    goto :goto_0

    :cond_0
    const-string v0, "light"

    :goto_0
    return-object v0
.end method

.method public isDark()Z
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/agy/theme/ThemeController;->currentContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/agy/theme/ThemeController;->appContext:Landroid/content/Context;

    :goto_0
    invoke-virtual {p0, v0}, Lcom/agy/theme/ThemeController;->isDark(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public isDark(Landroid/content/Context;)Z
    .locals 1

    .line 108
    if-eqz p1, :cond_0

    goto :goto_0

    .line 109
    :cond_0
    iget-object p1, p0, Lcom/agy/theme/ThemeController;->currentContext:Landroid/content/Context;

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/agy/theme/ThemeController;->appContext:Landroid/content/Context;

    .line 110
    :goto_0
    iget v0, p0, Lcom/agy/theme/ThemeController;->mode:I

    invoke-static {v0, p1}, Lcom/agy/theme/ThemeResolver;->isDark(ILandroid/content/Context;)Z

    move-result p1

    return p1
.end method

.method public isLauncherDark()Z
    .locals 1

    .line 126
    invoke-virtual {p0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result v0

    return v0
.end method

.method public mode()I
    .locals 1

    .line 28
    iget v0, p0, Lcom/agy/theme/ThemeController;->mode:I

    return v0
.end method

.method public onVisualThemeChanged(Ljava/lang/String;)V
    .locals 2

    .line 83
    const-string v0, "dark"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    .line 84
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    invoke-virtual {p0, v0}, Lcom/agy/theme/ThemeController;->setMode(I)V

    .line 85
    invoke-static {p1}, Lcom/agy/theme/LauncherIconSwitcher;->scheduleSwitch(Z)V

    .line 86
    iget-object v0, p0, Lcom/agy/theme/ThemeController;->currentContext:Landroid/content/Context;

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_1

    .line 87
    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 88
    :goto_1
    if-eqz v0, :cond_2

    .line 89
    new-instance v1, Lcom/agy/theme/ThemeController$2;

    invoke-direct {v1, p0, v0, p1}, Lcom/agy/theme/ThemeController$2;-><init>(Lcom/agy/theme/ThemeController;Landroid/app/Activity;Z)V

    invoke-static {v1}, Lcom/agy/util/MainThreadPost;->post(Ljava/lang/Runnable;)V

    .line 96
    :cond_2
    return-void
.end method

.method public setMode(I)V
    .locals 1

    .line 32
    if-ltz p1, :cond_1

    const/4 v0, 0x2

    if-le p1, v0, :cond_0

    goto :goto_0

    .line 35
    :cond_0
    iput p1, p0, Lcom/agy/theme/ThemeController;->mode:I

    .line 36
    iget-object v0, p0, Lcom/agy/theme/ThemeController;->appContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/agy/theme/ThemePrefs;->save(Landroid/content/Context;I)V

    .line 37
    return-void

    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public setTheme(Ljava/lang/String;)Z
    .locals 3

    .line 44
    const-string v0, "light"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 45
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/agy/theme/ThemeController;->setMode(I)V

    goto :goto_1

    .line 46
    :cond_0
    const-string v0, "dark"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 47
    invoke-virtual {p0, v1}, Lcom/agy/theme/ThemeController;->setMode(I)V

    goto :goto_1

    .line 48
    :cond_1
    const-string v0, "system"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_3

    const-string v0, "default"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    .line 51
    :cond_2
    return v2

    .line 49
    :cond_3
    :goto_0
    invoke-virtual {p0, v2}, Lcom/agy/theme/ThemeController;->setMode(I)V

    .line 56
    :goto_1
    invoke-virtual {p0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result p1

    invoke-static {p1}, Lcom/agy/theme/LauncherIconSwitcher;->scheduleSwitch(Z)V

    .line 57
    iget-object p1, p0, Lcom/agy/theme/ThemeController;->currentContext:Landroid/content/Context;

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_4

    .line 58
    check-cast p1, Landroid/app/Activity;

    goto :goto_2

    :cond_4
    const/4 p1, 0x0

    .line 59
    :goto_2
    if-eqz p1, :cond_5

    .line 60
    invoke-virtual {p0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result v0

    .line 61
    new-instance v2, Lcom/agy/theme/ThemeController$1;

    invoke-direct {v2, p0, p1, v0}, Lcom/agy/theme/ThemeController$1;-><init>(Lcom/agy/theme/ThemeController;Landroid/app/Activity;Z)V

    invoke-static {v2}, Lcom/agy/util/MainThreadPost;->post(Ljava/lang/Runnable;)V

    .line 68
    :cond_5
    return v1
.end method

.method public setThemeByUser(Ljava/lang/String;)Z
    .locals 1

    .line 76
    invoke-virtual {p0, p1}, Lcom/agy/theme/ThemeController;->setTheme(Ljava/lang/String;)Z

    move-result p1

    .line 77
    invoke-virtual {p0}, Lcom/agy/theme/ThemeController;->isDark()Z

    move-result v0

    invoke-static {v0}, Lcom/agy/theme/LauncherIconSwitcher;->scheduleSwitch(Z)V

    .line 78
    return p1
.end method

.method public updateContext(Landroid/content/Context;)V
    .locals 0

    .line 22
    if-eqz p1, :cond_0

    .line 23
    iput-object p1, p0, Lcom/agy/theme/ThemeController;->currentContext:Landroid/content/Context;

    .line 25
    :cond_0
    return-void
.end method
