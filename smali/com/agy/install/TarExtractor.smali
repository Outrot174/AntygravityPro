.class public final Lcom/agy/install/TarExtractor;
.super Ljava/lang/Object;
.source "TarExtractor.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "TarExtractor"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 184
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    .line 187
    const/high16 v2, 0x10000

    new-array v3, v2, [B

    .line 188
    nop

    .line 189
    :goto_0
    cmp-long v4, p2, v0

    if-lez v4, :cond_1

    .line 190
    int-to-long v4, v2

    invoke-static {v4, v5, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v4, v4

    const/4 v5, 0x0

    invoke-virtual {p0, v3, v5, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 191
    if-ltz v4, :cond_0

    .line 194
    invoke-virtual {p1, v3, v5, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 195
    int-to-long v4, v4

    sub-long/2addr p2, v4

    .line 196
    goto :goto_0

    .line 192
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "truncated tar entry"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 197
    :cond_1
    return-void

    .line 185
    :cond_2
    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "negative tar entry size: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static ensureParentInside(Ljava/io/File;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 126
    if-eqz v0, :cond_1

    invoke-static {p0, v0}, Lcom/agy/util/PathSafety;->isInside(Ljava/io/File;Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 127
    :cond_0
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "tar entry parent escapes env prefix: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 129
    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-nez p0, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result p0

    if-nez p0, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-eqz p0, :cond_2

    goto :goto_1

    .line 130
    :cond_2
    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot create parent "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 132
    :cond_3
    :goto_1
    return-void
.end method

.method private static readEntry(Ljava/io/InputStream;J)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 161
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const-wide/32 v0, 0x800000

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    .line 164
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    long-to-int v1, p1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 165
    invoke-static {p0, v0, p1, p2}, Lcom/agy/install/TarExtractor;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)V

    .line 166
    invoke-static {p0, p1, p2}, Lcom/agy/install/TarExtractor;->skipPadding(Ljava/io/InputStream;J)V

    .line 167
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    .line 162
    :cond_0
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unreasonable tar entry size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static removeConflictingLeaf(Ljava/io/File;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    invoke-static {p0}, Lcom/agy/install/TextFileDetector;->isSymlink(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/system/Os;->remove(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    nop

    .line 141
    return-void

    .line 138
    :catch_0
    move-exception p1

    .line 139
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot replace tar symlink "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 143
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 144
    return-void

    .line 146
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 147
    if-eqz p1, :cond_2

    .line 148
    return-void

    .line 150
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 153
    return-void

    .line 151
    :cond_3
    new-instance p1, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot replace non-empty tar directory "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 155
    :cond_4
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 158
    return-void

    .line 156
    :cond_5
    new-instance p1, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot replace tar file "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static skipEntry(Ljava/io/InputStream;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    invoke-static {p0, p1, p2}, Lcom/agy/install/TarExtractor;->skipExactly(Ljava/io/InputStream;J)V

    .line 172
    invoke-static {p0, p1, p2}, Lcom/agy/install/TarExtractor;->skipPadding(Ljava/io/InputStream;J)V

    .line 173
    return-void
.end method

.method private static skipExactly(Ljava/io/InputStream;J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    .line 201
    return-void

    .line 203
    :cond_0
    nop

    .line 204
    const/16 v2, 0x2000

    new-array v3, v2, [B

    .line 205
    :goto_0
    cmp-long v4, p1, v0

    if-lez v4, :cond_2

    .line 206
    int-to-long v4, v2

    invoke-static {v4, v5, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v4, v4

    const/4 v5, 0x0

    invoke-virtual {p0, v3, v5, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 207
    if-ltz v4, :cond_1

    .line 210
    int-to-long v4, v4

    sub-long/2addr p1, v4

    .line 211
    goto :goto_0

    .line 208
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "truncated tar entry"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 212
    :cond_2
    return-void
.end method

.method private static skipPadding(Ljava/io/InputStream;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    const-wide/16 v0, 0x200

    rem-long/2addr p1, v0

    sub-long p1, v0, p1

    rem-long/2addr p1, v0

    .line 216
    invoke-static {p0, p1, p2}, Lcom/agy/install/TarExtractor;->skipExactly(Ljava/io/InputStream;J)V

    .line 217
    return-void
.end method

.method public static untar(Ljava/io/InputStream;Ljava/io/File;)I
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/16 v2, 0x200

    new-array v2, v2, [B

    .line 37
    nop

    .line 38
    const/4 v4, 0x0

    move v5, v4

    const/4 v6, 0x0

    .line 39
    :goto_0
    invoke-static {v0, v2}, Lcom/agy/install/TarHeader;->readBlock(Ljava/io/InputStream;[B)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 40
    invoke-static {v2}, Lcom/agy/install/TarHeader;->isZeroBlock([B)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 41
    goto/16 :goto_5

    .line 43
    :cond_0
    const/16 v7, 0x64

    invoke-static {v2, v4, v7}, Lcom/agy/install/TarHeader;->readField([BII)Ljava/lang/String;

    move-result-object v8

    .line 44
    const/16 v9, 0x8

    invoke-static {v2, v7, v9}, Lcom/agy/install/TarHeader;->readOctal([BII)J

    move-result-wide v9

    .line 45
    const/16 v11, 0x7c

    const/16 v12, 0xc

    invoke-static {v2, v11, v12}, Lcom/agy/install/TarHeader;->readOctal([BII)J

    move-result-wide v11

    .line 46
    const/16 v13, 0x9c

    aget-byte v13, v2, v13

    and-int/lit16 v13, v13, 0xff

    .line 47
    const/16 v14, 0x9d

    invoke-static {v2, v14, v7}, Lcom/agy/install/TarHeader;->readField([BII)Ljava/lang/String;

    move-result-object v7

    .line 48
    const/16 v14, 0x159

    const/16 v15, 0x9b

    invoke-static {v2, v14, v15}, Lcom/agy/install/TarHeader;->readField([BII)Ljava/lang/String;

    move-result-object v14

    .line 49
    const/16 v15, 0x30

    if-nez v13, :cond_1

    .line 50
    move v13, v15

    .line 52
    :cond_1
    const/16 v3, 0x4c

    if-ne v13, v3, :cond_2

    .line 53
    new-instance v3, Ljava/lang/String;

    invoke-static {v0, v11, v12}, Lcom/agy/install/TarExtractor;->readEntry(Ljava/io/InputStream;J)[B

    move-result-object v6

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v6, v7}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 54
    goto :goto_0

    .line 56
    :cond_2
    const/16 v3, 0x4b

    if-eq v13, v3, :cond_d

    const/16 v3, 0x78

    if-eq v13, v3, :cond_d

    const/16 v3, 0x67

    if-ne v13, v3, :cond_3

    goto/16 :goto_4

    .line 60
    :cond_3
    if-eqz v6, :cond_4

    .line 61
    nop

    .line 62
    const/4 v3, 0x0

    goto :goto_1

    .line 60
    :cond_4
    move-object v3, v6

    move-object v6, v8

    .line 64
    :goto_1
    if-eqz v14, :cond_5

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_5

    .line 65
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v14, "/"

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 67
    :cond_5
    invoke-static {v6}, Lcom/agy/install/TarPath;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 68
    if-eqz v6, :cond_c

    .line 71
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 72
    invoke-static {v0, v11, v12}, Lcom/agy/install/TarExtractor;->skipEntry(Ljava/io/InputStream;J)V

    .line 73
    move-object v6, v3

    goto/16 :goto_0

    .line 75
    :cond_6
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v1, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 76
    invoke-static {v1, v8}, Lcom/agy/install/TarExtractor;->ensureParentInside(Ljava/io/File;Ljava/io/File;)V

    .line 78
    const/16 v14, 0x35

    if-ne v13, v14, :cond_9

    .line 79
    invoke-static {v0, v11, v12}, Lcom/agy/install/TarExtractor;->skipEntry(Ljava/io/InputStream;J)V

    .line 80
    const/4 v6, 0x1

    invoke-static {v8, v6}, Lcom/agy/install/TarExtractor;->removeConflictingLeaf(Ljava/io/File;Z)V

    .line 81
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_8

    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    move-result v6

    if-nez v6, :cond_8

    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_7

    goto :goto_2

    .line 82
    :cond_7
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot create dir "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_8
    :goto_2
    invoke-static {v8, v9, v10}, Lcom/agy/util/FileModeUtil;->applyMode(Ljava/io/File;J)V

    goto :goto_3

    .line 85
    :cond_9
    if-ne v13, v15, :cond_a

    .line 86
    invoke-static {v8, v4}, Lcom/agy/install/TarExtractor;->removeConflictingLeaf(Ljava/io/File;Z)V

    .line 87
    invoke-static {v0, v8, v11, v12, v1}, Lcom/agy/install/TarExtractor;->writeFile(Ljava/io/InputStream;Ljava/io/File;JLjava/io/File;)V

    .line 88
    invoke-static {v8, v9, v10}, Lcom/agy/util/FileModeUtil;->applyMode(Ljava/io/File;J)V

    goto :goto_3

    .line 89
    :cond_a
    const/16 v9, 0x32

    if-ne v13, v9, :cond_b

    .line 90
    invoke-static {v0, v11, v12}, Lcom/agy/install/TarExtractor;->skipEntry(Ljava/io/InputStream;J)V

    .line 91
    invoke-static {v1, v8, v7}, Lcom/agy/install/TarExtractor;->validateLinkTarget(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 92
    invoke-static {v8, v4}, Lcom/agy/install/TarExtractor;->removeConflictingLeaf(Ljava/io/File;Z)V

    .line 94
    :try_start_0
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Landroid/system/Os;->symlink(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    nop

    .line 98
    add-int/lit8 v5, v5, 0x1

    .line 103
    :goto_3
    move-object v6, v3

    goto/16 :goto_0

    .line 95
    :catch_0
    move-exception v0

    .line 96
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot create symlink "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 100
    :cond_b
    invoke-static {v0, v11, v12}, Lcom/agy/install/TarExtractor;->skipEntry(Ljava/io/InputStream;J)V

    .line 101
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unsupported tar entry type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    int-to-char v2, v13

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v1, "unsafe tar entry path"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_d
    :goto_4
    invoke-static {v0, v11, v12}, Lcom/agy/install/TarExtractor;->skipEntry(Ljava/io/InputStream;J)V

    .line 58
    goto/16 :goto_0

    .line 104
    :cond_e
    :goto_5
    return v5
.end method

.method public static untarGz(Ljava/io/InputStream;Ljava/io/File;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    new-instance v0, Ljava/util/zip/GZIPInputStream;

    new-instance v1, Ljava/io/BufferedInputStream;

    const/high16 v2, 0x10000

    invoke-direct {v1, p0, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {v0, v1, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 30
    :try_start_0
    invoke-static {v0, p1}, Lcom/agy/install/TarExtractor;->untar(Ljava/io/InputStream;Ljava/io/File;)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 30
    return p0

    .line 29
    :catchall_0
    move-exception p0

    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0
.end method

.method private static validateLinkTarget(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_3

    .line 111
    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 112
    sget-object p0, Lcom/agy/install/EnvPaths;->TERMUX_ANY_PREFIX:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 113
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 116
    return-void

    .line 114
    :cond_0
    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "absolute tar symlink escapes env prefix: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 118
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 119
    invoke-static {p0, v0}, Lcom/agy/util/PathSafety;->isInside(Ljava/io/File;Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 122
    return-void

    .line 120
    :cond_2
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "tar symlink escapes env prefix: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " -> "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 109
    :cond_3
    new-instance p0, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "empty/invalid tar symlink target at "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static writeFile(Ljava/io/InputStream;Ljava/io/File;JLjava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 176
    invoke-static {p4, p1}, Lcom/agy/install/TarExtractor;->ensureParentInside(Ljava/io/File;Ljava/io/File;)V

    .line 177
    new-instance p4, Ljava/io/FileOutputStream;

    invoke-direct {p4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 178
    :try_start_0
    invoke-static {p0, p4, p2, p3}, Lcom/agy/install/TarExtractor;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    invoke-virtual {p4}, Ljava/io/OutputStream;->close()V

    .line 180
    invoke-static {p0, p2, p3}, Lcom/agy/install/TarExtractor;->skipPadding(Ljava/io/InputStream;J)V

    .line 181
    return-void

    .line 177
    :catchall_0
    move-exception p0

    :try_start_1
    invoke-virtual {p4}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0
.end method
