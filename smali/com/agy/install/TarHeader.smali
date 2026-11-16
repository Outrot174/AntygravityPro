.class public final Lcom/agy/install/TarHeader;
.super Ljava/lang/Object;
.source "TarHeader.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method

.method public static isZeroBlock([B)Z
    .locals 4

    .line 29
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-byte v3, p0, v2

    .line 30
    if-eqz v3, :cond_0

    .line 31
    return v1

    .line 29
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 34
    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static readBlock(Ljava/io/InputStream;[B)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    const/4 v0, 0x0

    move v1, v0

    .line 15
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_2

    .line 16
    array-length v2, p1

    sub-int/2addr v2, v1

    invoke-virtual {p0, p1, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 17
    if-gez v2, :cond_1

    .line 18
    if-nez v1, :cond_0

    .line 19
    return v0

    .line 21
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "truncated tar header"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 23
    :cond_1
    add-int/2addr v1, v2

    .line 24
    goto :goto_0

    .line 25
    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public static readField([BII)Ljava/lang/String;
    .locals 2

    .line 38
    add-int/2addr p2, p1

    .line 39
    move v0, p1

    .line 40
    :goto_0
    if-ge v0, p2, :cond_0

    aget-byte v1, p0, v0

    if-eqz v1, :cond_0

    .line 41
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 43
    :cond_0
    new-instance p2, Ljava/lang/String;

    sub-int/2addr v0, p1

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p2, p0, p1, v0, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object p2
.end method

.method public static readOctal([BII)J
    .locals 3

    .line 47
    add-int/2addr p2, p1

    .line 48
    nop

    .line 49
    :goto_0
    if-ge p1, p2, :cond_1

    aget-byte v0, p0, p1

    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    if-nez v0, :cond_1

    .line 50
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 52
    :cond_1
    move v0, p1

    .line 53
    :goto_1
    if-ge v0, p2, :cond_2

    aget-byte v1, p0, v0

    const/16 v2, 0x30

    if-lt v1, v2, :cond_2

    const/16 v2, 0x37

    if-gt v1, v2, :cond_2

    .line 54
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 56
    :cond_2
    if-ne v0, p1, :cond_3

    .line 57
    const-wide/16 p0, 0x0

    return-wide p0

    .line 59
    :cond_3
    new-instance p2, Ljava/lang/String;

    sub-int/2addr v0, p1

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {p2, p0, p1, v0, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    const/16 p0, 0x8

    invoke-static {p2, p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide p0

    return-wide p0
.end method
