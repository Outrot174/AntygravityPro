.class public final Lcom/agy/log/CommandRecord;
.super Ljava/lang/Object;
.source "CommandRecord.java"


# instance fields
.field public final cmd:Ljava/lang/String;

.field public final durationMs:J

.field public final exitCode:I

.field public final id:Ljava/lang/String;

.field public final source:Ljava/lang/String;

.field public final status:Ljava/lang/String;

.field public final stderr:Ljava/lang/String;

.field public final stdout:Ljava/lang/String;

.field public final timestamp:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/agy/log/CommandRecord;->id:Ljava/lang/String;

    .line 24
    iput-wide p2, p0, Lcom/agy/log/CommandRecord;->timestamp:J

    .line 25
    const-string p1, ""

    if-eqz p4, :cond_0

    goto :goto_0

    :cond_0
    move-object p4, p1

    :goto_0
    iput-object p4, p0, Lcom/agy/log/CommandRecord;->cmd:Ljava/lang/String;

    .line 26
    iput p5, p0, Lcom/agy/log/CommandRecord;->exitCode:I

    .line 27
    iput-wide p6, p0, Lcom/agy/log/CommandRecord;->durationMs:J

    .line 28
    if-eqz p8, :cond_1

    goto :goto_1

    :cond_1
    move-object p8, p1

    :goto_1
    iput-object p8, p0, Lcom/agy/log/CommandRecord;->stdout:Ljava/lang/String;

    .line 29
    if-eqz p9, :cond_2

    goto :goto_2

    :cond_2
    move-object p9, p1

    :goto_2
    iput-object p9, p0, Lcom/agy/log/CommandRecord;->stderr:Ljava/lang/String;

    .line 30
    if-eqz p10, :cond_3

    goto :goto_3

    :cond_3
    const-string p10, "UNKNOWN"

    :goto_3
    iput-object p10, p0, Lcom/agy/log/CommandRecord;->status:Ljava/lang/String;

    .line 31
    if-eqz p11, :cond_4

    goto :goto_4

    :cond_4
    const-string p11, "system"

    :goto_4
    iput-object p11, p0, Lcom/agy/log/CommandRecord;->source:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public toJson()Lorg/json/JSONObject;
    .locals 4

    .line 35
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 37
    :try_start_0
    const-string v1, "id"

    iget-object v2, p0, Lcom/agy/log/CommandRecord;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 38
    const-string v1, "time"

    iget-wide v2, p0, Lcom/agy/log/CommandRecord;->timestamp:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 39
    const-string v1, "cmd"

    iget-object v2, p0, Lcom/agy/log/CommandRecord;->cmd:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    const-string v1, "exit_code"

    iget v2, p0, Lcom/agy/log/CommandRecord;->exitCode:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 41
    const-string v1, "duration_ms"

    iget-wide v2, p0, Lcom/agy/log/CommandRecord;->durationMs:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 42
    const-string v1, "stdout"

    iget-object v2, p0, Lcom/agy/log/CommandRecord;->stdout:Ljava/lang/String;

    invoke-static {v2}, Lcom/agy/log/LogRedactor;->redact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    const-string v1, "stderr"

    iget-object v2, p0, Lcom/agy/log/CommandRecord;->stderr:Ljava/lang/String;

    invoke-static {v2}, Lcom/agy/log/LogRedactor;->redact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    const-string v1, "status"

    iget-object v2, p0, Lcom/agy/log/CommandRecord;->status:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    const-string v1, "source"

    iget-object v2, p0, Lcom/agy/log/CommandRecord;->source:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    goto :goto_0

    .line 46
    :catch_0
    move-exception v1

    .line 48
    :goto_0
    return-object v0
.end method
