.class public final Lcom/agy/gateway/SystemGatewayServer;
.super Ljava/lang/Object;
.source "SystemGatewayServer.java"


# static fields
.field public static final DEFAULT_PORT:I = 0xb068

.field private static final MAX_HEADER_LINE_BYTES:I = 0x2000

.field private static final TAG:Ljava/lang/String; = "SystemGateway"


# instance fields
.field private acceptThread:Ljava/lang/Thread;

.field private final context:Landroid/content/Context;

.field private final dispatcher:Lcom/agy/gateway/GatewayDispatcher;

.field private final executor:Ljava/util/concurrent/ExecutorService;

.field private final logBuffer:Lcom/agy/log/LogRingBuffer;

.field private port:I

.field private volatile running:Z

.field private serverSocket:Ljava/net/ServerSocket;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/agy/log/LogRingBuffer;)V
    .locals 1

    .line 44
    const v0, 0xb068

    invoke-direct {p0, p1, p2, v0}, Lcom/agy/gateway/SystemGatewayServer;-><init>(Landroid/content/Context;Lcom/agy/log/LogRingBuffer;I)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/agy/log/LogRingBuffer;I)V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/agy/gateway/SystemGatewayServer;->executor:Ljava/util/concurrent/ExecutorService;

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/gateway/SystemGatewayServer;->running:Z

    .line 48
    iput-object p1, p0, Lcom/agy/gateway/SystemGatewayServer;->context:Landroid/content/Context;

    .line 49
    iput p3, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    .line 50
    iput-object p2, p0, Lcom/agy/gateway/SystemGatewayServer;->logBuffer:Lcom/agy/log/LogRingBuffer;

    .line 51
    new-instance p3, Lcom/agy/gateway/GatewayDispatcher;

    invoke-direct {p3, p1, p2}, Lcom/agy/gateway/GatewayDispatcher;-><init>(Landroid/content/Context;Lcom/agy/log/LogRingBuffer;)V

    iput-object p3, p0, Lcom/agy/gateway/SystemGatewayServer;->dispatcher:Lcom/agy/gateway/GatewayDispatcher;

    .line 52
    return-void
.end method

.method private handleClient(Ljava/net/Socket;)V
    .locals 10

    .line 111
    nop

    .line 112
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 113
    :try_start_1
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 116
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    invoke-static {v0}, Lcom/agy/gateway/SystemGatewayServer;->readHeaderLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 118
    if-nez v2, :cond_3

    .line 188
    if-eqz v1, :cond_0

    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :cond_0
    if-eqz v0, :cond_1

    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    :cond_1
    if-eqz p1, :cond_2

    :try_start_5
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 118
    :cond_2
    return-void

    .line 120
    :cond_3
    :try_start_6
    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 121
    array-length v3, v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    const/4 v4, 0x2

    if-ge v3, v4, :cond_7

    .line 188
    if-eqz v1, :cond_4

    :try_start_7
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :cond_4
    if-eqz v0, :cond_5

    :try_start_8
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    :cond_5
    if-eqz p1, :cond_6

    :try_start_9
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    .line 121
    :cond_6
    return-void

    .line 122
    :cond_7
    const/4 v3, 0x0

    :try_start_a
    aget-object v4, v2, v3

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    .line 123
    const/4 v5, 0x1

    aget-object v2, v2, v5

    .line 125
    move v6, v3

    .line 127
    :cond_8
    :goto_0
    invoke-static {v0}, Lcom/agy/gateway/SystemGatewayServer;->readHeaderLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_9

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_9

    .line 128
    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    const-string v9, "content-length:"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 129
    const/16 v6, 0xf

    invoke-virtual {v7, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    goto :goto_0

    .line 133
    :cond_9
    if-ltz v6, :cond_19

    .line 136
    const/high16 v7, 0x400000

    if-gt v6, v7, :cond_18

    .line 140
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 141
    const-string v8, "/gateway/status"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    const-string v9, "ok"

    if-eqz v8, :cond_a

    .line 142
    :try_start_b
    invoke-virtual {v7, v9, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 143
    const-string v2, "status"

    const-string v3, "online"

    invoke-virtual {v7, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    const-string v2, "port"

    iget v3, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    invoke-virtual {v7, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto/16 :goto_6

    .line 145
    :cond_a
    const-string v8, "/gateway/logs"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 146
    invoke-virtual {v7, v9, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 147
    const-string v2, "logs"

    iget-object v3, p0, Lcom/agy/gateway/SystemGatewayServer;->logBuffer:Lcom/agy/log/LogRingBuffer;

    const/16 v4, 0x32

    invoke-virtual {v3, v4}, Lcom/agy/log/LogRingBuffer;->getRecent(I)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/agy/log/LogRingBuffer;->toJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v7, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_6

    .line 148
    :cond_b
    const-string v8, "/gateway/commands"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 149
    invoke-virtual {v7, v9, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 150
    const-string v2, "commands"

    iget-object v3, p0, Lcom/agy/gateway/SystemGatewayServer;->dispatcher:Lcom/agy/gateway/GatewayDispatcher;

    invoke-virtual {v3}, Lcom/agy/gateway/GatewayDispatcher;->getCommandHistory()Lcom/agy/log/CommandHistory;

    move-result-object v3

    const/16 v4, 0x14

    invoke-virtual {v3, v4}, Lcom/agy/log/CommandHistory;->getRecent(I)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/agy/log/CommandHistory;->toJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v7, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_6

    .line 151
    :cond_c
    const-string v8, "/gateway/crash"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 152
    invoke-static {}, Lcom/agy/log/CrashRecorder;->getLatestCrash()Lorg/json/JSONObject;

    move-result-object v2

    .line 153
    invoke-virtual {v7, v9, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 154
    const-string v3, "crash"

    if-eqz v2, :cond_d

    goto :goto_1

    :cond_d
    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :goto_1
    invoke-virtual {v7, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    goto/16 :goto_6

    :cond_e
    const-string v5, "POST"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    const-string v4, "/gateway"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    if-eqz v2, :cond_14

    .line 156
    nop

    .line 157
    const-string v2, ""

    if-lez v6, :cond_12

    .line 158
    :try_start_c
    new-array v4, v6, [B

    .line 159
    nop

    .line 160
    :goto_2
    if-ge v3, v6, :cond_10

    .line 161
    sub-int v5, v6, v3

    invoke-virtual {v0, v4, v3, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 162
    const/4 v7, -0x1

    if-ne v5, v7, :cond_f

    goto :goto_3

    .line 163
    :cond_f
    add-int/2addr v3, v5

    .line 164
    goto :goto_2

    .line 165
    :cond_10
    :goto_3
    if-lt v3, v6, :cond_11

    .line 168
    new-instance v3, Ljava/lang/String;

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_4

    .line 166
    :cond_11
    new-instance v2, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected EOF while reading body: expected "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", got "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 157
    :cond_12
    move-object v3, v2

    .line 171
    :goto_4
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_13

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :cond_13
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 172
    :goto_5
    const-string v3, "command"

    invoke-virtual {v4, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 173
    const-string v3, "payload"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 174
    iget-object v4, p0, Lcom/agy/gateway/SystemGatewayServer;->dispatcher:Lcom/agy/gateway/GatewayDispatcher;

    invoke-virtual {v4, v2, v3}, Lcom/agy/gateway/GatewayDispatcher;->dispatch(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v7

    .line 175
    goto :goto_6

    .line 176
    :cond_14
    invoke-virtual {v7, v9, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 177
    const-string v2, "error"

    const-string v3, "not found"

    invoke-virtual {v7, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 180
    :goto_6
    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 181
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "HTTP/1.1 200 OK\r\nContent-Type: application/json; charset=utf-8\r\nContent-Length: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\r\nConnection: close\r\n\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 185
    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 186
    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 187
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 188
    if-eqz v1, :cond_15

    :try_start_d
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    :cond_15
    if-eqz v0, :cond_16

    :try_start_e
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    :cond_16
    if-eqz p1, :cond_17

    :try_start_f
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0

    .line 190
    :cond_17
    goto :goto_a

    .line 137
    :cond_18
    :try_start_10
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Payload too large: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 134
    :cond_19
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid Content-Length: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 111
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_1a

    :try_start_11
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    goto :goto_7

    :catchall_1
    move-exception v1

    :try_start_12
    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1a
    :goto_7
    throw v2
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    :catchall_2
    move-exception v1

    if-eqz v0, :cond_1b

    :try_start_13
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    goto :goto_8

    :catchall_3
    move-exception v0

    :try_start_14
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1b
    :goto_8
    throw v1
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    :catchall_4
    move-exception v0

    if-eqz p1, :cond_1c

    :try_start_15
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_5

    goto :goto_9

    :catchall_5
    move-exception p1

    :try_start_16
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1c
    :goto_9
    throw v0
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_0

    .line 188
    :catch_0
    move-exception p1

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "client error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "SystemGateway"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    :goto_a
    return-void
.end method

.method private static readHeaderLine(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 196
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 198
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    .line 199
    const/16 v3, 0xd

    if-ne v1, v3, :cond_0

    .line 200
    goto :goto_0

    .line 202
    :cond_0
    const/16 v3, 0xa

    if-ne v1, v3, :cond_1

    .line 203
    goto :goto_1

    .line 205
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    const/16 v3, 0x2000

    if-ge v2, v3, :cond_2

    .line 208
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 206
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string v0, "HTTP header line exceeded limit of 8192 bytes"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 210
    :cond_3
    :goto_1
    if-ne v1, v2, :cond_4

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p0

    if-nez p0, :cond_4

    .line 211
    const/4 p0, 0x0

    return-object p0

    .line 213
    :cond_4
    const-string p0, "UTF-8"

    invoke-virtual {v0, p0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method synthetic lambda$start$0$com-agy-gateway-SystemGatewayServer(Ljava/net/Socket;)V
    .locals 0

    .line 82
    invoke-direct {p0, p1}, Lcom/agy/gateway/SystemGatewayServer;->handleClient(Ljava/net/Socket;)V

    return-void
.end method

.method synthetic lambda$start$1$com-agy-gateway-SystemGatewayServer()V
    .locals 8

    .line 61
    const-string v0, "127.0.0.1"

    const-string v1, "SystemGateway"

    const/16 v2, 0x32

    const/4 v3, 0x1

    :try_start_0
    new-instance v4, Ljava/net/ServerSocket;

    invoke-direct {v4}, Ljava/net/ServerSocket;-><init>()V

    iput-object v4, p0, Lcom/agy/gateway/SystemGatewayServer;->serverSocket:Ljava/net/ServerSocket;

    .line 62
    invoke-virtual {v4, v3}, Ljava/net/ServerSocket;->setReuseAddress(Z)V

    .line 63
    iget-object v4, p0, Lcom/agy/gateway/SystemGatewayServer;->serverSocket:Ljava/net/ServerSocket;

    new-instance v5, Ljava/net/InetSocketAddress;

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v6

    iget v7, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    invoke-direct {v5, v6, v7}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v4, v5, v2}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    goto :goto_0

    .line 87
    :catch_0
    move-exception v0

    goto/16 :goto_5

    .line 64
    :catch_1
    move-exception v4

    .line 65
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Port "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " in use, trying fallback "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    add-int/lit8 v5, v5, 0x2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    iget v4, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    add-int/lit8 v4, v4, 0x2

    iput v4, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    .line 67
    new-instance v4, Ljava/net/ServerSocket;

    invoke-direct {v4}, Ljava/net/ServerSocket;-><init>()V

    iput-object v4, p0, Lcom/agy/gateway/SystemGatewayServer;->serverSocket:Ljava/net/ServerSocket;

    .line 68
    invoke-virtual {v4, v3}, Ljava/net/ServerSocket;->setReuseAddress(Z)V

    .line 69
    iget-object v3, p0, Lcom/agy/gateway/SystemGatewayServer;->serverSocket:Ljava/net/ServerSocket;

    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    iget v5, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    invoke-direct {v4, v0, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v4, v2}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;I)V

    .line 71
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "System Gateway listening on http://127.0.0.1:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/gateway"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 73
    :try_start_2
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/agy/gateway/SystemGatewayServer;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "logs/gateway.port"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 74
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 75
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/agy/util/AtomicFileWriter;->writeText(Ljava/io/File;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 76
    :catchall_0
    move-exception v0

    :goto_1
    nop

    .line 78
    :goto_2
    :try_start_3
    iget-boolean v0, p0, Lcom/agy/gateway/SystemGatewayServer;->running:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/agy/gateway/SystemGatewayServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    if-nez v0, :cond_2

    .line 80
    :try_start_4
    iget-object v0, p0, Lcom/agy/gateway/SystemGatewayServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 81
    const/16 v2, 0xbb8

    invoke-virtual {v0, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 82
    iget-object v2, p0, Lcom/agy/gateway/SystemGatewayServer;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lcom/agy/gateway/SystemGatewayServer$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, v0}, Lcom/agy/gateway/SystemGatewayServer$$ExternalSyntheticLambda1;-><init>(Lcom/agy/gateway/SystemGatewayServer;Ljava/net/Socket;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    .line 83
    :catch_2
    move-exception v0

    .line 84
    :try_start_5
    iget-boolean v0, p0, Lcom/agy/gateway/SystemGatewayServer;->running:Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    if-nez v0, :cond_1

    goto :goto_4

    .line 85
    :cond_1
    :goto_3
    goto :goto_2

    .line 89
    :cond_2
    :goto_4
    goto :goto_6

    .line 88
    :goto_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Gateway server bind failed on port "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/agy/gateway/SystemGatewayServer;->port:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    :goto_6
    return-void
.end method

.method public declared-synchronized start()V
    .locals 4

    monitor-enter p0

    .line 55
    :try_start_0
    iget-boolean v0, p0, Lcom/agy/gateway/SystemGatewayServer;->running:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    .line 56
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/agy/gateway/SystemGatewayServer;->running:Z

    .line 58
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/agy/gateway/SystemGatewayServer$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/agy/gateway/SystemGatewayServer$$ExternalSyntheticLambda0;-><init>(Lcom/agy/gateway/SystemGatewayServer;)V

    const-string v3, "AgyGatewayServer"

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/agy/gateway/SystemGatewayServer;->acceptThread:Ljava/lang/Thread;

    .line 91
    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 92
    iget-object v0, p0, Lcom/agy/gateway/SystemGatewayServer;->acceptThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    monitor-exit p0

    return-void

    .line 54
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stop()V
    .locals 2

    monitor-enter p0

    .line 96
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/agy/gateway/SystemGatewayServer;->running:Z

    .line 97
    iget-object v0, p0, Lcom/agy/gateway/SystemGatewayServer;->serverSocket:Ljava/net/ServerSocket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 99
    :try_start_1
    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 100
    :catch_0
    move-exception v0

    :goto_0
    nop

    .line 102
    :cond_0
    :try_start_2
    iget-object v0, p0, Lcom/agy/gateway/SystemGatewayServer;->acceptThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    .line 103
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 105
    :cond_1
    iget-object v0, p0, Lcom/agy/gateway/SystemGatewayServer;->dispatcher:Lcom/agy/gateway/GatewayDispatcher;

    invoke-virtual {v0}, Lcom/agy/gateway/GatewayDispatcher;->releaseResources()V

    .line 106
    iget-object v0, p0, Lcom/agy/gateway/SystemGatewayServer;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 107
    const-string v0, "SystemGateway"

    const-string v1, "System Gateway stopped."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 108
    monitor-exit p0

    return-void

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
