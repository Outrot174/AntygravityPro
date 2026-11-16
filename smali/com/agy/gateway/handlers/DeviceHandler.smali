.class public final Lcom/agy/gateway/handlers/DeviceHandler;
.super Ljava/lang/Object;
.source "DeviceHandler.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private final mainHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/agy/gateway/handlers/DeviceHandler;->context:Landroid/content/Context;

    .line 30
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/agy/gateway/handlers/DeviceHandler;->mainHandler:Landroid/os/Handler;

    .line 31
    return-void
.end method


# virtual methods
.method public handleSystemInfo()Lorg/json/JSONObject;
    .locals 13

    .line 34
    const-string v0, "ok"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 36
    const/4 v2, 0x0

    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {v1, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 39
    iget-object v4, p0, Lcom/agy/gateway/handlers/DeviceHandler;->context:Landroid/content/Context;

    new-instance v5, Landroid/content/IntentFilter;

    const-string v6, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v5, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v4

    .line 40
    if-eqz v4, :cond_3

    .line 41
    const-string v5, "level"

    const/4 v6, -0x1

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 42
    const-string v7, "scale"

    invoke-virtual {v4, v7, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    .line 43
    const-string v8, "status"

    invoke-virtual {v4, v8, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 44
    const/4 v6, 0x2

    if-eq v4, v6, :cond_1

    const/4 v6, 0x5

    if-ne v4, v6, :cond_0

    goto :goto_0

    :cond_0
    move v3, v2

    .line 46
    :cond_1
    :goto_0
    const-string v4, "battery"

    if-lez v7, :cond_2

    int-to-float v5, v5

    int-to-float v6, v7

    div-float/2addr v5, v6

    const/high16 v6, 0x42c80000    # 100.0f

    mul-float/2addr v5, v6

    float-to-int v5, v5

    :cond_2
    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 47
    const-string v4, "charging"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 51
    :cond_3
    iget-object v3, p0, Lcom/agy/gateway/handlers/DeviceHandler;->context:Landroid/content/Context;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/ConnectivityManager;

    .line 52
    if-eqz v3, :cond_5

    .line 53
    invoke-virtual {v3}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    const-string v4, "network"

    if-eqz v3, :cond_4

    :try_start_1
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 55
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 57
    :cond_4
    const-string v3, "offline"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    :cond_5
    :goto_1
    iget-object v3, p0, Lcom/agy/gateway/handlers/DeviceHandler;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    .line 63
    const-string v4, "storage_free_mb"

    invoke-virtual {v3}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v5

    const-wide/32 v7, 0x100000

    div-long/2addr v5, v7

    invoke-virtual {v1, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 66
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    .line 67
    const-string v4, "memory_free_mb"

    invoke-virtual {v3}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v5

    invoke-virtual {v3}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v9

    invoke-virtual {v3}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v11

    sub-long/2addr v9, v11

    sub-long/2addr v5, v9

    div-long/2addr v5, v7

    invoke-virtual {v1, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 73
    goto :goto_3

    .line 68
    :catch_0
    move-exception v3

    .line 70
    :try_start_2
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 71
    const-string v0, "error"

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 72
    :catch_1
    move-exception v0

    :goto_2
    nop

    .line 74
    :goto_3
    return-object v1
.end method

.method public handleToast(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 5

    .line 103
    const-string v0, "ok"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 105
    :try_start_0
    const-string v2, "message"

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 106
    const-string v3, "long"

    const-string v4, "duration"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    .line 107
    iget-object v3, p0, Lcom/agy/gateway/handlers/DeviceHandler;->mainHandler:Landroid/os/Handler;

    new-instance v4, Lcom/agy/gateway/handlers/DeviceHandler$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0, v2, p1}, Lcom/agy/gateway/handlers/DeviceHandler$$ExternalSyntheticLambda0;-><init>(Lcom/agy/gateway/handlers/DeviceHandler;Ljava/lang/String;Z)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 108
    const/4 p1, 0x1

    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    goto :goto_1

    .line 109
    :catch_0
    move-exception p1

    .line 111
    const/4 v2, 0x0

    :try_start_1
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 112
    const-string v0, "error"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 113
    :catch_1
    move-exception p1

    :goto_0
    nop

    .line 115
    :goto_1
    return-object v1
.end method

.method public handleVibrate(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 8

    .line 78
    const-string v0, "error"

    const-string v1, "ok"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 80
    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Lcom/agy/gateway/handlers/DeviceHandler;->context:Landroid/content/Context;

    const-string v5, "vibrator"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Vibrator;

    .line 81
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 82
    const-string v5, "duration_ms"

    const-wide/16 v6, 0x64

    invoke-virtual {p1, v5, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 83
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1a

    if-lt p1, v7, :cond_0

    .line 84
    const/4 p1, -0x1

    invoke-static {v5, v6, p1}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object p1

    invoke-virtual {v4, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {v4, v5, v6}, Landroid/os/Vibrator;->vibrate(J)V

    .line 88
    :goto_0
    const/4 p1, 0x1

    invoke-virtual {v2, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 89
    goto :goto_1

    .line 90
    :cond_1
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 91
    const-string p1, "vibrator not available"

    invoke-virtual {v2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    :goto_1
    goto :goto_3

    .line 93
    :catch_0
    move-exception p1

    .line 95
    :try_start_1
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 96
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 97
    :catch_1
    move-exception p1

    :goto_2
    nop

    .line 99
    :goto_3
    return-object v2
.end method

.method synthetic lambda$handleToast$0$com-agy-gateway-handlers-DeviceHandler(Ljava/lang/String;Z)V
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/agy/gateway/handlers/DeviceHandler;->context:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
