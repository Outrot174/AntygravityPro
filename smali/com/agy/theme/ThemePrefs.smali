.class public final Lcom/agy/theme/ThemePrefs;
.super Ljava/lang/Object;
.source "ThemePrefs.java"


# static fields
.field private static final KEY_MODE:Ljava/lang/String; = "theme_mode_v3"

.field private static final PREFS:Ljava/lang/String; = "agy_prefs"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method

.method public static load(Landroid/content/Context;)I
    .locals 2

    .line 16
    const-string v0, "agy_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 17
    const-string v0, "theme_mode_v3"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    .line 16
    return p0
.end method

.method public static save(Landroid/content/Context;I)V
    .locals 2

    .line 21
    const-string v0, "agy_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 22
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "theme_mode_v3"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 23
    return-void
.end method
