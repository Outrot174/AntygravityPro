.class public final Lcom/agy/util/StreamDrain;
.super Ljava/lang/Object;
.source "StreamDrain.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    return-void
.end method

.method public static drain(Ljava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    const/16 v0, 0x2000

    new-array v0, v0, [B

    .line 14
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-lez v1, :cond_0

    goto :goto_0

    .line 17
    :cond_0
    return-void
.end method
