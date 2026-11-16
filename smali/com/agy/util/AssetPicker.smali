.class public final Lcom/agy/util/AssetPicker;
.super Ljava/lang/Object;
.source "AssetPicker.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method public static varargs pick(Landroid/content/res/AssetManager;[Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 15
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_3

    aget-object v2, p1, v1

    .line 16
    :try_start_0
    invoke-virtual {p0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 17
    if-eqz v3, :cond_1

    .line 18
    nop

    .line 20
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 18
    :cond_0
    return-object v2

    .line 20
    :cond_1
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    :cond_2
    goto :goto_1

    .line 20
    :catch_0
    move-exception v2

    .line 15
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 24
    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method
