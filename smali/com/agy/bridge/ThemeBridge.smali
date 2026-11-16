.class public final Lcom/agy/bridge/ThemeBridge;
.super Ljava/lang/Object;
.source "ThemeBridge.java"


# instance fields
.field private final theme:Lcom/agy/theme/ThemeManager;


# direct methods
.method public constructor <init>(Lcom/agy/theme/ThemeManager;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/agy/bridge/ThemeBridge;->theme:Lcom/agy/theme/ThemeManager;

    .line 12
    return-void
.end method


# virtual methods
.method public getTheme()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/agy/bridge/ThemeBridge;->theme:Lcom/agy/theme/ThemeManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/agy/theme/ThemeManager;->getTheme()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "dark"

    :goto_0
    return-object v0
.end method

.method public onVisualThemeChanged(Ljava/lang/String;)V
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/agy/bridge/ThemeBridge;->theme:Lcom/agy/theme/ThemeManager;

    if-eqz v0, :cond_0

    .line 28
    invoke-virtual {v0, p1}, Lcom/agy/theme/ThemeManager;->onVisualThemeChanged(Ljava/lang/String;)V

    .line 30
    :cond_0
    return-void
.end method

.method public setTheme(Ljava/lang/String;)Z
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/agy/bridge/ThemeBridge;->theme:Lcom/agy/theme/ThemeManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/agy/theme/ThemeManager;->setTheme(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public setThemeByUser(Ljava/lang/String;)Z
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/agy/bridge/ThemeBridge;->theme:Lcom/agy/theme/ThemeManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/agy/theme/ThemeManager;->setThemeByUser(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
