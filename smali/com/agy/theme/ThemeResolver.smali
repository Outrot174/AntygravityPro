.class public final Lcom/agy/theme/ThemeResolver;
.super Ljava/lang/Object;
.source "ThemeResolver.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method

.method public static isDark(ILandroid/content/Context;)Z
    .locals 4

    .line 14
    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    .line 15
    return v0

    .line 17
    :cond_0
    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ne p0, v1, :cond_1

    .line 18
    return v2

    .line 21
    :cond_1
    if-nez p1, :cond_2

    .line 22
    return v2

    .line 27
    :cond_2
    const/16 p0, 0x20

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->uiMode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit8 v1, v1, 0x30

    .line 29
    if-ne v1, p0, :cond_3

    .line 30
    return v0

    .line 32
    :cond_3
    const/16 v3, 0x10

    if-ne v1, v3, :cond_4

    .line 33
    return v2

    .line 36
    :cond_4
    goto :goto_0

    .line 35
    :catch_0
    move-exception v1

    .line 40
    :goto_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 41
    if-eqz v1, :cond_6

    if-eq v1, p1, :cond_6

    .line 42
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    and-int/lit8 p1, p1, 0x30

    .line 44
    if-ne p1, p0, :cond_5

    .line 45
    return v0

    .line 47
    :cond_5
    nop

    .line 48
    return v2

    .line 52
    :cond_6
    goto :goto_1

    .line 51
    :catch_1
    move-exception p0

    .line 55
    :goto_1
    return v2
.end method
