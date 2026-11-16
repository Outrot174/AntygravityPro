.class public final Lcom/agy/theme/LauncherIconSwitcher;
.super Ljava/lang/Object;
.source "LauncherIconSwitcher.java"


# static fields
.field private static pendingDark:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/agy/theme/LauncherIconSwitcher;->pendingDark:Ljava/lang/Boolean;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static declared-synchronized apply(Landroid/content/Context;Z)V
    .locals 5

    const-class v0, Lcom/agy/theme/LauncherIconSwitcher;

    monitor-enter v0

    .line 32
    if-nez p0, :cond_0

    monitor-exit v0

    return-void

    .line 33
    :cond_0
    const/4 v1, 0x0

    :try_start_0
    sput-object v1, Lcom/agy/theme/LauncherIconSwitcher;->pendingDark:Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 37
    new-instance v2, Landroid/content/ComponentName;

    .line 38
    if-eqz p1, :cond_1

    const-class v3, Lcom/agy/ui/launcher/LauncherDarkActivity;

    goto :goto_0

    :cond_1
    const-class v3, Lcom/agy/ui/launcher/LauncherLightActivity;

    :goto_0
    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 39
    new-instance v3, Landroid/content/ComponentName;

    .line 40
    if-eqz p1, :cond_2

    const-class v4, Lcom/agy/ui/launcher/LauncherLightActivity;

    goto :goto_1

    :cond_2
    const-class v4, Lcom/agy/ui/launcher/LauncherDarkActivity;

    :goto_1
    invoke-direct {v3, p0, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 42
    invoke-static {v1, v2, p1}, Lcom/agy/theme/LauncherIconSwitcher;->isComponentEffectivelyEnabled(Landroid/content/pm/PackageManager;Landroid/content/ComponentName;Z)Z

    move-result p0

    .line 43
    const/4 v4, 0x1

    if-nez p1, :cond_3

    move p1, v4

    goto :goto_2

    :cond_3
    const/4 p1, 0x0

    :goto_2
    invoke-static {v1, v3, p1}, Lcom/agy/theme/LauncherIconSwitcher;->isComponentEffectivelyEnabled(Landroid/content/pm/PackageManager;Landroid/content/ComponentName;Z)Z

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    if-eqz p0, :cond_4

    if-nez p1, :cond_4

    .line 46
    monitor-exit v0

    return-void

    .line 50
    :cond_4
    :try_start_2
    invoke-virtual {v1, v2, v4, v4}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 55
    const/4 p0, 0x2

    invoke-virtual {v1, v3, p0, v4}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 59
    goto :goto_3

    .line 58
    :catch_0
    move-exception p0

    .line 60
    :goto_3
    monitor-exit v0

    return-void

    .line 31
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static isComponentEffectivelyEnabled(Landroid/content/pm/PackageManager;Landroid/content/ComponentName;Z)Z
    .locals 0

    .line 63
    invoke-virtual {p0, p1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result p0

    .line 64
    const/4 p1, 0x1

    if-ne p0, p1, :cond_0

    .line 65
    return p1

    .line 67
    :cond_0
    const/4 p1, 0x2

    if-eq p0, p1, :cond_2

    const/4 p1, 0x3

    if-eq p0, p1, :cond_2

    const/4 p1, 0x4

    if-ne p0, p1, :cond_1

    goto :goto_0

    .line 72
    :cond_1
    return p2

    .line 70
    :cond_2
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public static declared-synchronized onAppBackgrounded(Landroid/content/Context;)V
    .locals 2

    const-class v0, Lcom/agy/theme/LauncherIconSwitcher;

    monitor-enter v0

    .line 77
    :try_start_0
    sget-object v1, Lcom/agy/theme/LauncherIconSwitcher;->pendingDark:Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    if-eqz p0, :cond_0

    .line 78
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {p0, v1}, Lcom/agy/theme/LauncherIconSwitcher;->apply(Landroid/content/Context;Z)V

    .line 79
    const/4 p0, 0x0

    sput-object p0, Lcom/agy/theme/LauncherIconSwitcher;->pendingDark:Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    :cond_0
    monitor-exit v0

    return-void

    .line 76
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized scheduleSwitch(Z)V
    .locals 1

    const-class v0, Lcom/agy/theme/LauncherIconSwitcher;

    monitor-enter v0

    .line 28
    :try_start_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    sput-object p0, Lcom/agy/theme/LauncherIconSwitcher;->pendingDark:Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    monitor-exit v0

    return-void

    .line 27
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
