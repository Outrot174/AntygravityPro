.class public final Lcom/agy/runtime/RuntimeConfig;
.super Ljava/lang/Object;
.source "RuntimeConfig.java"


# static fields
.field public static final APP_VERSION_CODE:I = 0x11

.field public static final APP_VERSION_NAME:Ljava/lang/String; = "2.4.1"

.field public static final CORE_VERSION:Ljava/lang/String; = "2.11.0"

.field public static final DEBUG:Z = false

.field public static final DEFAULT_HTTPS_PORT:I = 0xb072

.field public static final MIN_API:I = 0x18

.field public static final TARGET_SDK:I = 0x1c


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method public static httpsPort(Landroid/content/Context;)I
    .locals 4

    .line 23
    if-eqz p0, :cond_1

    .line 25
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "https_server_port"

    const-string v2, "integer"

    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 25
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 31
    :cond_0
    goto :goto_0

    .line 30
    :catch_0
    move-exception p0

    .line 33
    :cond_1
    :goto_0
    const p0, 0xb072

    return p0
.end method
