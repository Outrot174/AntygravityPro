.class public final Lcom/agy/gateway/handlers/NotificationHandler;
.super Ljava/lang/Object;
.source "NotificationHandler.java"


# static fields
.field public static final CHANNEL_ALERTS:Ljava/lang/String; = "agy_alerts"

.field public static final CHANNEL_TASKS:Ljava/lang/String; = "agy_tasks"

.field private static final TAG:Ljava/lang/String; = "NotificationHandler"


# instance fields
.field private final context:Landroid/content/Context;

.field private final manager:Landroid/app/NotificationManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/agy/gateway/handlers/NotificationHandler;->context:Landroid/content/Context;

    .line 26
    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    iput-object p1, p0, Lcom/agy/gateway/handlers/NotificationHandler;->manager:Landroid/app/NotificationManager;

    .line 27
    invoke-direct {p0}, Lcom/agy/gateway/handlers/NotificationHandler;->initChannels()V

    .line 28
    return-void
.end method

.method private initChannels()V
    .locals 4

    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/agy/gateway/handlers/NotificationHandler;->manager:Landroid/app/NotificationManager;

    if-eqz v0, :cond_0

    .line 32
    new-instance v0, Landroid/app/NotificationChannel;

    const-string v1, "Antigravity Tasks"

    const/4 v2, 0x3

    const-string v3, "agy_tasks"

    invoke-direct {v0, v3, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 34
    const-string v1, "Notifications for ongoing AI agent and environment tasks"

    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 35
    iget-object v1, p0, Lcom/agy/gateway/handlers/NotificationHandler;->manager:Landroid/app/NotificationManager;

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 37
    new-instance v0, Landroid/app/NotificationChannel;

    const-string v1, "Antigravity Alerts"

    const/4 v2, 0x4

    const-string v3, "agy_alerts"

    invoke-direct {v0, v3, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 39
    const-string v1, "High-priority alerts and task completions"

    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 40
    iget-object v1, p0, Lcom/agy/gateway/handlers/NotificationHandler;->manager:Landroid/app/NotificationManager;

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 42
    :cond_0
    return-void
.end method


# virtual methods
.method public handle(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 18

    .line 45
    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const-string v2, "id"

    const-string v3, "error"

    const-string v4, "tag"

    const-string v5, "ok"

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 47
    const/4 v7, 0x0

    :try_start_0
    const-string v8, "action"

    const-string v9, "post"

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 48
    const-string v9, "agy_task"

    invoke-virtual {v0, v4, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    const-wide/32 v12, 0x186a0

    rem-long/2addr v10, v12

    long-to-int v10, v10

    invoke-virtual {v0, v2, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v10

    .line 51
    const-string v11, "cancel"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    const/4 v11, 0x1

    if-eqz v8, :cond_1

    .line 52
    iget-object v0, v1, Lcom/agy/gateway/handlers/NotificationHandler;->manager:Landroid/app/NotificationManager;

    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {v0, v9, v10}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    .line 55
    :cond_0
    invoke-virtual {v6, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 56
    const-string v0, "cancelled"

    invoke-virtual {v6, v0, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 57
    return-object v6

    .line 60
    :cond_1
    const-string v8, "title"

    const-string v12, "Antigravity"

    invoke-virtual {v0, v8, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 61
    const-string v12, "message"

    const-string v13, ""

    invoke-virtual {v0, v12, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 62
    const-string v13, "progress"

    const/4 v14, -0x1

    invoke-virtual {v0, v13, v14}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v13

    .line 63
    const-string v14, "ongoing"

    invoke-virtual {v0, v14, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v14

    .line 64
    const-string v15, "channel"

    const-string v11, "agy_tasks"

    invoke-virtual {v0, v15, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 66
    iget-object v15, v1, Lcom/agy/gateway/handlers/NotificationHandler;->manager:Landroid/app/NotificationManager;

    if-nez v15, :cond_2

    .line 67
    invoke-virtual {v6, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 68
    const-string v0, "NotificationManager unavailable"

    invoke-virtual {v6, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    return-object v6

    .line 72
    :cond_2
    iget-object v15, v1, Lcom/agy/gateway/handlers/NotificationHandler;->context:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const-string v7, "ic_notification"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v16, v3

    :try_start_1
    const-string v3, "drawable"

    move-object/from16 v17, v2

    iget-object v2, v1, Lcom/agy/gateway/handlers/NotificationHandler;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15, v7, v3, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 73
    if-nez v2, :cond_3

    .line 74
    const v2, 0x108009b

    .line 77
    :cond_3
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1a

    if-lt v3, v7, :cond_4

    .line 78
    new-instance v3, Landroid/app/Notification$Builder;

    iget-object v7, v1, Lcom/agy/gateway/handlers/NotificationHandler;->context:Landroid/content/Context;

    invoke-direct {v3, v7, v11}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 79
    :cond_4
    new-instance v3, Landroid/app/Notification$Builder;

    iget-object v7, v1, Lcom/agy/gateway/handlers/NotificationHandler;->context:Landroid/content/Context;

    invoke-direct {v3, v7}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 81
    :goto_0
    invoke-virtual {v3, v8}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 82
    invoke-virtual {v7, v12}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    .line 83
    invoke-virtual {v7, v2}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 84
    invoke-virtual {v2, v14}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    if-nez v14, :cond_5

    const/4 v7, 0x1

    goto :goto_1

    :cond_5
    const/4 v7, 0x0

    .line 85
    :goto_1
    invoke-virtual {v2, v7}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    .line 87
    if-ltz v13, :cond_6

    .line 88
    const/4 v2, 0x0

    invoke-static {v2, v13}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v7, 0x64

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {v3, v7, v0, v2}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    goto :goto_2

    .line 89
    :cond_6
    const-string v2, "indeterminate"

    const-string v7, "progress_mode"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 90
    const/4 v0, 0x1

    const/4 v2, 0x0

    invoke-virtual {v3, v2, v2, v0}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 93
    :cond_7
    :goto_2
    iget-object v0, v1, Lcom/agy/gateway/handlers/NotificationHandler;->manager:Landroid/app/NotificationManager;

    invoke-virtual {v3}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {v0, v9, v10, v2}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 95
    const/4 v0, 0x1

    invoke-virtual {v6, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 96
    invoke-virtual {v6, v4, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    move-object/from16 v0, v17

    invoke-virtual {v6, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 104
    goto :goto_5

    .line 98
    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    move-object/from16 v16, v3

    .line 99
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Notification error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "NotificationHandler"

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    const/4 v2, 0x0

    :try_start_2
    invoke-virtual {v6, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 102
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v2, v16

    invoke-virtual {v6, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_4

    .line 103
    :catch_2
    move-exception v0

    :goto_4
    nop

    .line 105
    :goto_5
    return-object v6
.end method
