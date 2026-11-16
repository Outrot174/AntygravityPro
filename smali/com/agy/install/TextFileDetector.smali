.class public final Lcom/agy/install/TextFileDetector;
.super Ljava/lang/Object;
.source "TextFileDetector.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method

.method public static isSymlink(Ljava/io/File;)Z
    .locals 0

    .line 30
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/system/Os;->lstat(Ljava/lang/String;)Landroid/system/StructStat;

    move-result-object p0

    iget p0, p0, Landroid/system/StructStat;->st_mode:I

    invoke-static {p0}, Landroid/system/OsConstants;->S_ISLNK(I)Z

    move-result p0
    :try_end_0
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 31
    :catch_0
    move-exception p0

    .line 32
    const/4 p0, 0x0

    return p0
.end method

.method public static isTextFile([B)Z
    .locals 5

    .line 16
    array-length v0, p0

    const/4 v1, 0x4

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lt v0, v1, :cond_0

    aget-byte v0, p0, v3

    const/16 v1, 0x7f

    if-ne v0, v1, :cond_0

    aget-byte v0, p0, v2

    const/16 v1, 0x45

    if-ne v0, v1, :cond_0

    const/4 v0, 0x2

    aget-byte v0, p0, v0

    const/16 v1, 0x4c

    if-ne v0, v1, :cond_0

    const/4 v0, 0x3

    aget-byte v0, p0, v0

    const/16 v1, 0x46

    if-ne v0, v1, :cond_0

    .line 18
    return v3

    .line 20
    :cond_0
    array-length v0, p0

    move v1, v3

    :goto_0
    if-ge v1, v0, :cond_2

    aget-byte v4, p0, v1

    .line 21
    if-nez v4, :cond_1

    .line 22
    return v3

    .line 20
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 25
    :cond_2
    return v2
.end method
