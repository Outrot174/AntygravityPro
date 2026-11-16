.class public final Lcom/agy/core/CoreLogWriter;
.super Ljava/lang/Object;
.source "CoreLogWriter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CoreLogWriter"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method public static closeQuietly(Ljava/io/Writer;)V
    .locals 0

    .line 46
    if-eqz p0, :cond_0

    .line 48
    :try_start_0
    invoke-virtual {p0}, Ljava/io/Writer;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    goto :goto_0

    .line 49
    :catch_0
    move-exception p0

    .line 52
    :cond_0
    :goto_0
    return-void
.end method

.method public static open(Ljava/io/File;)Ljava/io/Writer;
    .locals 4

    .line 23
    :try_start_0
    new-instance v0, Ljava/io/File;

    const-string v1, "logs"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 24
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 25
    new-instance p0, Ljava/io/OutputStreamWriter;

    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v2, Ljava/io/File;

    const-string v3, "core.log"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-direct {v1, v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    const-string v0, "UTF-8"

    .line 26
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    return-object p0

    .line 27
    :catch_0
    move-exception p0

    .line 28
    const-string v0, "CoreLogWriter"

    const-string v1, "cannot open core log"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    const/4 p0, 0x0

    return-object p0
.end method

.method public static writeLine(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 0

    .line 34
    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_1

    .line 38
    :cond_0
    :try_start_0
    invoke-static {p1}, Lcom/agy/util/SensitiveDataRedactor;->redactLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 39
    const/16 p1, 0xa

    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(I)V

    .line 40
    invoke-virtual {p0}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    goto :goto_0

    .line 41
    :catch_0
    move-exception p0

    .line 43
    :goto_0
    return-void

    .line 35
    :cond_1
    :goto_1
    return-void
.end method
