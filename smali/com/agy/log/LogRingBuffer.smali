.class public final Lcom/agy/log/LogRingBuffer;
.super Ljava/lang/Object;
.source "LogRingBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/agy/log/LogRingBuffer$LogEntry;
    }
.end annotation


# static fields
.field public static final DEFAULT_CAPACITY:I = 0x1f4


# instance fields
.field private final buffer:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/agy/log/LogRingBuffer$LogEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final capacity:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    const/16 v0, 0x1f4

    invoke-direct {p0, v0}, Lcom/agy/log/LogRingBuffer;-><init>(I)V

    .line 49
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/agy/log/LogRingBuffer;->buffer:Ljava/util/LinkedList;

    .line 52
    const/16 v0, 0x32

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/agy/log/LogRingBuffer;->capacity:I

    .line 53
    return-void
.end method

.method public static toJsonArray(Ljava/util/List;)Lorg/json/JSONArray;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/agy/log/LogRingBuffer$LogEntry;",
            ">;)",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .line 99
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 100
    if-eqz p0, :cond_0

    .line 101
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/agy/log/LogRingBuffer$LogEntry;

    .line 102
    invoke-virtual {v1}, Lcom/agy/log/LogRingBuffer$LogEntry;->toJson()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 103
    goto :goto_0

    .line 105
    :cond_0
    return-object v0
.end method


# virtual methods
.method public declared-synchronized append(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    monitor-enter p0

    .line 56
    :try_start_0
    iget-object v0, p0, Lcom/agy/log/LogRingBuffer;->buffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iget v1, p0, Lcom/agy/log/LogRingBuffer;->capacity:I

    if-lt v0, v1, :cond_0

    .line 57
    iget-object v0, p0, Lcom/agy/log/LogRingBuffer;->buffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/agy/log/LogRingBuffer;->buffer:Ljava/util/LinkedList;

    new-instance v7, Lcom/agy/log/LogRingBuffer$LogEntry;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    move-object v1, v7

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/agy/log/LogRingBuffer$LogEntry;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    monitor-exit p0

    return-void

    .line 55
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized appendLine(Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    .line 63
    if-eqz p1, :cond_7

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_3

    .line 66
    :cond_0
    const-string v0, "core"

    .line 67
    const-string v1, "INFO"

    .line 68
    const-string v2, "[ERROR]"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "ERROR:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "E "

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 70
    :cond_1
    const-string v2, "[WARN]"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "WARNING:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "W "

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 72
    :cond_2
    const-string v2, "[DEBUG]"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "D "

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 73
    :cond_3
    const-string v1, "DEBUG"

    goto :goto_2

    .line 71
    :cond_4
    :goto_0
    const-string v1, "WARN"

    goto :goto_2

    .line 69
    :cond_5
    :goto_1
    const-string v1, "ERROR"

    .line 75
    :cond_6
    :goto_2
    invoke-virtual {p0, v0, v1, p1}, Lcom/agy/log/LogRingBuffer;->append(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    monitor-exit p0

    return-void

    .line 62
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 64
    :cond_7
    :goto_3
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized getRecent(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/agy/log/LogRingBuffer$LogEntry;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 79
    const/4 v0, 0x1

    :try_start_0
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget-object v0, p0, Lcom/agy/log/LogRingBuffer;->buffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 80
    iget-object v0, p0, Lcom/agy/log/LogRingBuffer;->buffer:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    sub-int/2addr v0, p1

    .line 81
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 82
    nop

    :goto_0
    iget-object p1, p0, Lcom/agy/log/LogRingBuffer;->buffer:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    move-result p1

    if-ge v0, p1, :cond_0

    .line 83
    iget-object p1, p0, Lcom/agy/log/LogRingBuffer;->buffer:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/agy/log/LogRingBuffer$LogEntry;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 85
    :cond_0
    monitor-exit p0

    return-object v1

    .line 78
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getSince(J)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lcom/agy/log/LogRingBuffer$LogEntry;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 89
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 90
    iget-object v1, p0, Lcom/agy/log/LogRingBuffer;->buffer:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/agy/log/LogRingBuffer$LogEntry;

    .line 91
    iget-wide v3, v2, Lcom/agy/log/LogRingBuffer$LogEntry;->timestamp:J

    cmp-long v3, v3, p1

    if-lez v3, :cond_0

    .line 92
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    :cond_0
    goto :goto_0

    .line 95
    :cond_1
    monitor-exit p0

    return-object v0

    .line 88
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
