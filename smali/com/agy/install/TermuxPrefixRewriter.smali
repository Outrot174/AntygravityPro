.class public final Lcom/agy/install/TermuxPrefixRewriter;
.super Ljava/lang/Object;
.source "TermuxPrefixRewriter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "TermuxPrefixRewriter"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static rewrite(Ljava/io/File;)V
    .locals 1

    .line 27
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/agy/install/TermuxPrefixRewriter;->rewrite(Ljava/io/File;Ljava/lang/String;)V

    .line 28
    return-void
.end method

.method public static rewrite(Ljava/io/File;Ljava/lang/String;)V
    .locals 6

    .line 32
    nop

    .line 33
    sget-object v0, Lcom/agy/install/EnvPaths;->SCRIPT_DIRS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v4, v0, v2

    .line 34
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v5, p1}, Lcom/agy/install/TermuxPrefixRewriter;->rewriteIn(Ljava/io/File;Ljava/lang/String;)I

    move-result v4

    add-int/2addr v3, v4

    .line 33
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 36
    :cond_0
    if-lez v3, :cond_1

    .line 37
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "rewrote termux paths in "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " file(s) -> "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "TermuxPrefixRewriter"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    :cond_1
    return-void
.end method

.method private static rewriteFile(Ljava/io/File;Ljava/lang/String;)Z
    .locals 4

    .line 62
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :try_start_1
    invoke-static {v1}, Lcom/agy/util/IoUtil;->readAllBytes(Ljava/io/InputStream;)[B

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 66
    nop

    .line 67
    invoke-static {v2}, Lcom/agy/install/TextFileDetector;->isTextFile([B)Z

    move-result v1

    if-nez v1, :cond_0

    .line 68
    return v0

    .line 71
    :cond_0
    new-instance v1, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 72
    const-string v2, "/data/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 73
    return v0

    .line 75
    :cond_1
    sget-object v2, Lcom/agy/install/EnvPaths;->TERMUX_ANY_PREFIX:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 76
    invoke-static {p1}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 77
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 78
    return v0

    .line 80
    :cond_2
    sget-object v0, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-static {p0, p1}, Lcom/agy/util/AtomicFileWriter;->writeBytes(Ljava/io/File;[B)Z

    move-result p0

    return p0

    .line 62
    :catchall_0
    move-exception p0

    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 64
    :catch_0
    move-exception p0

    .line 65
    return v0
.end method

.method private static rewriteIn(Ljava/io/File;Ljava/lang/String;)I
    .locals 5

    .line 42
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    .line 43
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 44
    return v0

    .line 46
    :cond_0
    nop

    .line 47
    array-length v1, p0

    move v2, v0

    :goto_0
    if-ge v0, v1, :cond_4

    aget-object v3, p0, v0

    .line 48
    invoke-static {v3}, Lcom/agy/install/TextFileDetector;->isSymlink(Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 49
    goto :goto_1

    .line 51
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 52
    invoke-static {v3, p1}, Lcom/agy/install/TermuxPrefixRewriter;->rewriteIn(Ljava/io/File;Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_1

    .line 53
    :cond_2
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-static {v3, p1}, Lcom/agy/install/TermuxPrefixRewriter;->rewriteFile(Ljava/io/File;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 54
    add-int/lit8 v2, v2, 0x1

    .line 47
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    :cond_4
    return v2
.end method
