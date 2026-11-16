.class public final Lcom/agy/ui/webview/DesktopModePrefs;
.super Ljava/lang/Object;
.source "DesktopModePrefs.java"


# static fields
.field private static final KEY_DESKTOP_MODE:Ljava/lang/String; = "desktop_mode"

.field private static final PREFS:Ljava/lang/String; = "agy_prefs"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method public static isDesktopMode(Landroid/content/Context;)Z
    .locals 2

    .line 15
    const-string v0, "agy_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 16
    const-string v0, "desktop_mode"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    .line 15
    return p0
.end method

.method public static setDesktopMode(Landroid/content/Context;Z)V
    .locals 2

    .line 20
    const-string v0, "agy_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 21
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "desktop_mode"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 22
    return-void
.end method
