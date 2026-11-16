.class public final Lcom/agy/log/LogRingBuffer$LogEntry;
.super Ljava/lang/Object;
.source "LogRingBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/agy/log/LogRingBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LogEntry"
.end annotation


# instance fields
.field public final channel:Ljava/lang/String;

.field public final level:Ljava/lang/String;

.field public final text:Ljava/lang/String;

.field public final timestamp:J


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-wide p1, p0, Lcom/agy/log/LogRingBuffer$LogEntry;->timestamp:J

    .line 26
    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    const-string p3, "core"

    :goto_0
    iput-object p3, p0, Lcom/agy/log/LogRingBuffer$LogEntry;->channel:Ljava/lang/String;

    .line 27
    if-eqz p4, :cond_1

    goto :goto_1

    :cond_1
    const-string p4, "INFO"

    :goto_1
    iput-object p4, p0, Lcom/agy/log/LogRingBuffer$LogEntry;->level:Ljava/lang/String;

    .line 28
    if-eqz p5, :cond_2

    goto :goto_2

    :cond_2
    const-string p5, ""

    :goto_2
    iput-object p5, p0, Lcom/agy/log/LogRingBuffer$LogEntry;->text:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public toJson()Lorg/json/JSONObject;
    .locals 4

    .line 32
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 34
    :try_start_0
    const-string v1, "time"

    iget-wide v2, p0, Lcom/agy/log/LogRingBuffer$LogEntry;->timestamp:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 35
    const-string v1, "channel"

    iget-object v2, p0, Lcom/agy/log/LogRingBuffer$LogEntry;->channel:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    const-string v1, "level"

    iget-object v2, p0, Lcom/agy/log/LogRingBuffer$LogEntry;->level:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 37
    const-string v1, "msg"

    iget-object v2, p0, Lcom/agy/log/LogRingBuffer$LogEntry;->text:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    goto :goto_0

    .line 38
    :catch_0
    move-exception v1

    .line 40
    :goto_0
    return-object v0
.end method
