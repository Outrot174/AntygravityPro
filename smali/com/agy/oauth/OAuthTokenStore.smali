.class public final Lcom/agy/oauth/OAuthTokenStore;
.super Ljava/lang/Object;
.source "OAuthTokenStore.java"


# static fields
.field private static final MAX_SCAN:I = 0x2000


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method public static hasToken(Landroid/content/Context;)Z
    .locals 6

    .line 34
    invoke-static {p0}, Lcom/agy/oauth/OAuthTokenStore;->tokenFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    .line 35
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    goto :goto_1

    .line 38
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x2000

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int p0, v2

    new-array p0, p0, [B

    .line 40
    invoke-virtual {v1, p0}, Ljava/io/FileInputStream;->read([B)I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    if-gtz v2, :cond_1

    .line 42
    nop

    .line 46
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 42
    return v0

    .line 44
    :cond_1
    :try_start_3
    new-instance v3, Ljava/lang/String;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, p0, v0, v2, v4}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 45
    invoke-static {v3}, Lcom/agy/oauth/OAuthTokenStore;->isNullOrBlankToken(Ljava/lang/String;)Z

    move-result p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    xor-int/lit8 p0, p0, 0x1

    .line 46
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 45
    return p0

    .line 38
    :catchall_0
    move-exception p0

    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v1

    :try_start_6
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 46
    :catch_0
    move-exception p0

    .line 47
    return v0

    .line 36
    :cond_2
    :goto_1
    return v0
.end method

.method private static isNullOrBlankToken(Ljava/lang/String;)Z
    .locals 4

    .line 56
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 57
    return v0

    .line 59
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 61
    return v0

    .line 63
    :cond_1
    const-string v1, "\"token\""

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 64
    const/4 v2, 0x0

    if-gez v1, :cond_2

    .line 65
    return v2

    .line 67
    :cond_2
    const/16 v3, 0x3a

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 68
    if-gez v1, :cond_3

    .line 69
    return v2

    .line 71
    :cond_3
    add-int/2addr v1, v0

    .line 72
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v1, v0, :cond_4

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 75
    :cond_4
    const-string v0, "null"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result p0

    return p0
.end method

.method public static tokenFile(Landroid/content/Context;)Ljava/io/File;
    .locals 3

    .line 19
    if-nez p0, :cond_0

    .line 20
    const/4 p0, 0x0

    return-object p0

    .line 22
    :cond_0
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v2, ".gemini"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string p0, "jetski-standalone-oauth-token"

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method
