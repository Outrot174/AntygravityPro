.class public final Lcom/agy/gateway/GatewayDispatcher;
.super Ljava/lang/Object;
.source "GatewayDispatcher.java"


# instance fields
.field private final browserHandler:Lcom/agy/gateway/handlers/BrowserHandler;

.field private final clipboardHandler:Lcom/agy/gateway/handlers/ClipboardHandler;

.field private final commandHistory:Lcom/agy/log/CommandHistory;

.field private final deviceHandler:Lcom/agy/gateway/handlers/DeviceHandler;

.field private final execHandler:Lcom/agy/gateway/handlers/ExecHandler;

.field private final logBuffer:Lcom/agy/log/LogRingBuffer;

.field private final notificationHandler:Lcom/agy/gateway/handlers/NotificationHandler;

.field private final powerHandler:Lcom/agy/gateway/handlers/PowerHandler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/agy/log/LogRingBuffer;)V
    .locals 2

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lcom/agy/gateway/handlers/NotificationHandler;

    invoke-direct {v0, p1}, Lcom/agy/gateway/handlers/NotificationHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->notificationHandler:Lcom/agy/gateway/handlers/NotificationHandler;

    .line 25
    new-instance v0, Lcom/agy/gateway/handlers/BrowserHandler;

    invoke-direct {v0, p1}, Lcom/agy/gateway/handlers/BrowserHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->browserHandler:Lcom/agy/gateway/handlers/BrowserHandler;

    .line 26
    new-instance v0, Lcom/agy/gateway/handlers/PowerHandler;

    invoke-direct {v0, p1}, Lcom/agy/gateway/handlers/PowerHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->powerHandler:Lcom/agy/gateway/handlers/PowerHandler;

    .line 27
    new-instance v0, Lcom/agy/gateway/handlers/ClipboardHandler;

    invoke-direct {v0, p1}, Lcom/agy/gateway/handlers/ClipboardHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->clipboardHandler:Lcom/agy/gateway/handlers/ClipboardHandler;

    .line 28
    new-instance v0, Lcom/agy/gateway/handlers/DeviceHandler;

    invoke-direct {v0, p1}, Lcom/agy/gateway/handlers/DeviceHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->deviceHandler:Lcom/agy/gateway/handlers/DeviceHandler;

    .line 29
    iput-object p2, p0, Lcom/agy/gateway/GatewayDispatcher;->logBuffer:Lcom/agy/log/LogRingBuffer;

    .line 30
    new-instance v0, Lcom/agy/log/CommandHistory;

    invoke-direct {v0}, Lcom/agy/log/CommandHistory;-><init>()V

    iput-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->commandHistory:Lcom/agy/log/CommandHistory;

    .line 31
    new-instance v1, Lcom/agy/gateway/handlers/ExecHandler;

    invoke-direct {v1, p1, v0, p2}, Lcom/agy/gateway/handlers/ExecHandler;-><init>(Landroid/content/Context;Lcom/agy/log/CommandHistory;Lcom/agy/log/LogRingBuffer;)V

    iput-object v1, p0, Lcom/agy/gateway/GatewayDispatcher;->execHandler:Lcom/agy/gateway/handlers/ExecHandler;

    .line 32
    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 7

    .line 35
    if-nez p2, :cond_0

    .line 36
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 39
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const-string v1, "crash"

    const-string v2, "logs"

    const-string v3, "commands"

    const/4 v4, 0x0

    const/4 v5, 0x1

    sparse-switch v0, :sswitch_data_0

    :cond_1
    goto/16 :goto_0

    :sswitch_0
    const-string v0, "vibrate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x6

    goto/16 :goto_1

    :sswitch_1
    const-string v0, "wakelock"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    goto/16 :goto_1

    :sswitch_2
    const-string v0, "clipboard_set"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x4

    goto/16 :goto_1

    :sswitch_3
    const-string v0, "toast"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x7

    goto :goto_1

    :sswitch_4
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xc

    goto :goto_1

    :sswitch_5
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x8

    goto :goto_1

    :sswitch_6
    const-string v0, "exec"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x9

    goto :goto_1

    :sswitch_7
    const-string v0, "open_url"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v5

    goto :goto_1

    :sswitch_8
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xa

    goto :goto_1

    :sswitch_9
    const-string v0, "notify"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v4

    goto :goto_1

    :sswitch_a
    const-string v0, "command_get"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xb

    goto :goto_1

    :sswitch_b
    const-string v0, "system_info"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x5

    goto :goto_1

    :sswitch_c
    const-string v0, "clipboard"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    goto :goto_1

    :goto_0
    const/4 v0, -0x1

    :goto_1
    const-string v6, "ok"

    packed-switch v0, :pswitch_data_0

    .line 91
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    goto/16 :goto_8

    .line 83
    :pswitch_0
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 85
    :try_start_0
    invoke-static {}, Lcom/agy/log/CrashRecorder;->getLatestCrash()Lorg/json/JSONObject;

    move-result-object p2

    .line 86
    invoke-virtual {p1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 87
    if-eqz p2, :cond_2

    goto :goto_2

    :cond_2
    sget-object p2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :goto_2
    invoke-virtual {p1, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 88
    :catch_0
    move-exception p2

    :goto_3
    nop

    .line 89
    return-object p1

    .line 74
    :pswitch_1
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 76
    :try_start_1
    const-string v0, "id"

    const-string v1, ""

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 77
    iget-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->commandHistory:Lcom/agy/log/CommandHistory;

    invoke-virtual {v0, p2}, Lcom/agy/log/CommandHistory;->getById(Ljava/lang/String;)Lcom/agy/log/CommandRecord;

    move-result-object p2

    .line 78
    if-eqz p2, :cond_3

    move v4, v5

    :cond_3
    invoke-virtual {p1, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 79
    const-string v0, "command"

    if-eqz p2, :cond_4

    invoke-virtual {p2}, Lcom/agy/log/CommandRecord;->toJson()Lorg/json/JSONObject;

    move-result-object p2

    goto :goto_4

    :cond_4
    sget-object p2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :goto_4
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_5

    .line 80
    :catch_1
    move-exception p2

    :goto_5
    nop

    .line 81
    return-object p1

    .line 66
    :pswitch_2
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 68
    :try_start_2
    const-string v0, "limit"

    const/16 v1, 0x14

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p2

    .line 69
    invoke-virtual {p1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 70
    iget-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->commandHistory:Lcom/agy/log/CommandHistory;

    invoke-virtual {v0, p2}, Lcom/agy/log/CommandHistory;->getRecent(I)Ljava/util/List;

    move-result-object p2

    invoke-static {p2}, Lcom/agy/log/CommandHistory;->toJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {p1, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_6

    .line 71
    :catch_2
    move-exception p2

    :goto_6
    nop

    .line 72
    return-object p1

    .line 64
    :pswitch_3
    iget-object p1, p0, Lcom/agy/gateway/GatewayDispatcher;->execHandler:Lcom/agy/gateway/handlers/ExecHandler;

    invoke-virtual {p1, p2}, Lcom/agy/gateway/handlers/ExecHandler;->handle(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 56
    :pswitch_4
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 58
    :try_start_3
    const-string v0, "tail"

    const/16 v1, 0x32

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p2

    .line 59
    invoke-virtual {p1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 60
    iget-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->logBuffer:Lcom/agy/log/LogRingBuffer;

    invoke-virtual {v0, p2}, Lcom/agy/log/LogRingBuffer;->getRecent(I)Ljava/util/List;

    move-result-object p2

    invoke-static {p2}, Lcom/agy/log/LogRingBuffer;->toJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {p1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_7

    .line 61
    :catch_3
    move-exception p2

    :goto_7
    nop

    .line 62
    return-object p1

    .line 54
    :pswitch_5
    iget-object p1, p0, Lcom/agy/gateway/GatewayDispatcher;->deviceHandler:Lcom/agy/gateway/handlers/DeviceHandler;

    invoke-virtual {p1, p2}, Lcom/agy/gateway/handlers/DeviceHandler;->handleToast(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 52
    :pswitch_6
    iget-object p1, p0, Lcom/agy/gateway/GatewayDispatcher;->deviceHandler:Lcom/agy/gateway/handlers/DeviceHandler;

    invoke-virtual {p1, p2}, Lcom/agy/gateway/handlers/DeviceHandler;->handleVibrate(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 50
    :pswitch_7
    iget-object p1, p0, Lcom/agy/gateway/GatewayDispatcher;->deviceHandler:Lcom/agy/gateway/handlers/DeviceHandler;

    invoke-virtual {p1}, Lcom/agy/gateway/handlers/DeviceHandler;->handleSystemInfo()Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 48
    :pswitch_8
    iget-object p1, p0, Lcom/agy/gateway/GatewayDispatcher;->clipboardHandler:Lcom/agy/gateway/handlers/ClipboardHandler;

    invoke-virtual {p1, p2}, Lcom/agy/gateway/handlers/ClipboardHandler;->handle(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 45
    :pswitch_9
    iget-object p1, p0, Lcom/agy/gateway/GatewayDispatcher;->powerHandler:Lcom/agy/gateway/handlers/PowerHandler;

    invoke-virtual {p1, p2}, Lcom/agy/gateway/handlers/PowerHandler;->handle(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 43
    :pswitch_a
    iget-object p1, p0, Lcom/agy/gateway/GatewayDispatcher;->browserHandler:Lcom/agy/gateway/handlers/BrowserHandler;

    invoke-virtual {p1, p2}, Lcom/agy/gateway/handlers/BrowserHandler;->handle(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 41
    :pswitch_b
    iget-object p1, p0, Lcom/agy/gateway/GatewayDispatcher;->notificationHandler:Lcom/agy/gateway/handlers/NotificationHandler;

    invoke-virtual {p1, p2}, Lcom/agy/gateway/handlers/NotificationHandler;->handle(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 93
    :goto_8
    :try_start_4
    invoke-virtual {p2, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 94
    const-string v0, "error"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown command: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_9

    .line 95
    :catch_4
    move-exception p1

    :goto_9
    nop

    .line 96
    return-object p2

    nop

    :sswitch_data_0
    .sparse-switch
        -0x5f64226a -> :sswitch_c
        -0x5b854f42 -> :sswitch_b
        -0x5713ff9e -> :sswitch_a
        -0x3df868b7 -> :sswitch_9
        -0x23e9f578 -> :sswitch_8
        -0x1e0f1a06 -> :sswitch_7
        0x2fb891 -> :sswitch_6
        0x32c5af -> :sswitch_5
        0x5a863a7 -> :sswitch_4
        0x6969627 -> :sswitch_3
        0xdd40e39 -> :sswitch_2
        0x1140e4cf -> :sswitch_1
        0x1ae6756f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getCommandHistory()Lcom/agy/log/CommandHistory;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->commandHistory:Lcom/agy/log/CommandHistory;

    return-object v0
.end method

.method public releaseResources()V
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/agy/gateway/GatewayDispatcher;->powerHandler:Lcom/agy/gateway/handlers/PowerHandler;

    invoke-virtual {v0}, Lcom/agy/gateway/handlers/PowerHandler;->releaseAll()V

    .line 106
    return-void
.end method
