.class public final Lcom/agy/core/ForegroundNotification;
.super Ljava/lang/Object;
.source "ForegroundNotification.java"


# static fields
.field public static final CHANNEL_ID:Ljava/lang/String; = "core_channel"

.field public static final NOTIFICATION_ID:I = 0x3e9


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method

.method private static build(Landroid/app/Service;Ljava/lang/String;)Landroid/app/Notification;
    .locals 4

    .line 45
    invoke-virtual {p0}, Landroid/app/Service;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 46
    invoke-virtual {p0}, Landroid/app/Service;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 45
    const-string v2, "ic_notification"

    const-string v3, "drawable"

    invoke-virtual {v0, v2, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    const v0, 0x108007c

    .line 50
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_1

    .line 51
    new-instance v1, Landroid/app/Notification$Builder;

    const-string v2, "core_channel"

    invoke-direct {v1, p0, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 52
    :cond_1
    new-instance v1, Landroid/app/Notification$Builder;

    invoke-direct {v1, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 53
    :goto_0
    nop

    .line 54
    const-string p0, "Antigravity"

    invoke-virtual {v1, p0}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 55
    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 56
    invoke-virtual {p0, v0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 57
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 58
    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    .line 53
    return-object p0
.end method

.method public static start(Landroid/app/Service;)V
    .locals 5

    .line 20
    nop

    .line 21
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 22
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    if-eqz v0, :cond_0

    .line 23
    new-instance v1, Landroid/app/NotificationChannel;

    const-string v2, "Core"

    const/4 v3, 0x2

    const-string v4, "core_channel"

    invoke-direct {v1, v4, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 25
    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 27
    :cond_0
    const-string v0, "Core running"

    invoke-static {p0, v0}, Lcom/agy/core/ForegroundNotification;->build(Landroid/app/Service;Ljava/lang/String;)Landroid/app/Notification;

    move-result-object v0

    .line 28
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    const/16 v3, 0x3e9

    if-lt v1, v2, :cond_1

    .line 29
    const/4 v1, 0x1

    invoke-virtual {p0, v3, v0, v1}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;I)V

    goto :goto_0

    .line 32
    :cond_1
    invoke-virtual {p0, v3, v0}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    .line 34
    :goto_0
    return-void
.end method

.method public static update(Landroid/app/Service;Ljava/lang/String;)V
    .locals 2

    .line 37
    nop

    .line 38
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 39
    if-eqz v0, :cond_0

    .line 40
    const/16 v1, 0x3e9

    invoke-static {p0, p1}, Lcom/agy/core/ForegroundNotification;->build(Landroid/app/Service;Ljava/lang/String;)Landroid/app/Notification;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 42
    :cond_0
    return-void
.end method
