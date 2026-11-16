.class public final Lcom/agy/log/CommandHistory;
.super Ljava/lang/Object;
.source "CommandHistory.java"


# static fields
.field public static final DEFAULT_CAPACITY:I = 0x64


# instance fields
.field private final capacity:I

.field private final history:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/agy/log/CommandRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    const/16 v0, 0x64

    invoke-direct {p0, v0}, Lcom/agy/log/CommandHistory;-><init>(I)V

    .line 19
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/agy/log/CommandHistory;->history:Ljava/util/LinkedList;

    .line 22
    const/16 v0, 0xa

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/agy/log/CommandHistory;->capacity:I

    .line 23
    return-void
.end method

.method public static toJsonArray(Ljava/util/List;)Lorg/json/JSONArray;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/agy/log/CommandRecord;",
            ">;)",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .line 54
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 55
    if-eqz p0, :cond_0

    .line 56
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/agy/log/CommandRecord;

    .line 57
    invoke-virtual {v1}, Lcom/agy/log/CommandRecord;->toJson()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 58
    goto :goto_0

    .line 60
    :cond_0
    return-object v0
.end method


# virtual methods
.method public declared-synchronized getById(Ljava/lang/String;)Lcom/agy/log/CommandRecord;
    .locals 4

    monitor-enter p0

    .line 44
    const/4 v0, 0x0

    if-nez p1, :cond_0

    monitor-exit p0

    return-object v0

    .line 45
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/agy/log/CommandHistory;->history:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/agy/log/CommandRecord;

    .line 46
    iget-object v3, v2, Lcom/agy/log/CommandRecord;->id:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    .line 47
    monitor-exit p0

    return-object v2

    .line 49
    :cond_1
    goto :goto_0

    .line 50
    :cond_2
    monitor-exit p0

    return-object v0

    .line 43
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getRecent(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/agy/log/CommandRecord;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 34
    const/4 v0, 0x1

    :try_start_0
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget-object v0, p0, Lcom/agy/log/CommandHistory;->history:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 35
    iget-object v0, p0, Lcom/agy/log/CommandHistory;->history:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    sub-int/2addr v0, p1

    .line 36
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 37
    nop

    :goto_0
    iget-object p1, p0, Lcom/agy/log/CommandHistory;->history:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    move-result p1

    if-ge v0, p1, :cond_0

    .line 38
    iget-object p1, p0, Lcom/agy/log/CommandHistory;->history:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/agy/log/CommandRecord;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 40
    :cond_0
    monitor-exit p0

    return-object v1

    .line 33
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized record(Lcom/agy/log/CommandRecord;)V
    .locals 2

    monitor-enter p0

    .line 26
    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    .line 27
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/agy/log/CommandHistory;->history:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iget v1, p0, Lcom/agy/log/CommandHistory;->capacity:I

    if-lt v0, v1, :cond_1

    .line 28
    iget-object v0, p0, Lcom/agy/log/CommandHistory;->history:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/agy/log/CommandHistory;->history:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    monitor-exit p0

    return-void

    .line 25
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
