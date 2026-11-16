.class public final Lcom/agy/shell/RishLocator;
.super Ljava/lang/Object;
.source "RishLocator.java"


# instance fields
.field private final appContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/agy/shell/RishLocator;->appContext:Landroid/content/Context;

    .line 14
    return-void
.end method


# virtual methods
.method public rishBinary()Ljava/io/File;
    .locals 6

    .line 18
    iget-object v0, p0, Lcom/agy/shell/RishLocator;->appContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 19
    const/4 v1, 0x3

    new-array v2, v1, [Ljava/io/File;

    new-instance v3, Ljava/io/File;

    const-string v4, "runtime/bin/rish"

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-instance v3, Ljava/io/File;

    const-string v5, "usr/bin/rish"

    invoke-direct {v3, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 v5, 0x1

    aput-object v3, v2, v5

    new-instance v3, Ljava/io/File;

    const-string v5, "bin/rish"

    invoke-direct {v3, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 v0, 0x2

    aput-object v3, v2, v0

    .line 24
    move v0, v4

    :goto_0
    if-ge v0, v1, :cond_1

    aget-object v3, v2, v0

    .line 25
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 26
    return-object v3

    .line 24
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 29
    :cond_1
    aget-object v0, v2, v4

    return-object v0
.end method
