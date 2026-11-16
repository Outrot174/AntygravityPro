.class public final Lcom/agy/core/CoreRuntimeState;
.super Ljava/lang/Object;
.source "CoreRuntimeState.java"


# static fields
.field public static volatile csrfToken:Ljava/lang/String;

.field public static volatile httpsPort:I

.field public static volatile lastError:Ljava/lang/String;

.field public static volatile readyGeneration:I

.field public static volatile restarting:Z

.field public static volatile serverUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 12
    const/4 v0, 0x0

    sput-object v0, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    .line 13
    const v1, 0xb072

    sput v1, Lcom/agy/core/CoreRuntimeState;->httpsPort:I

    .line 14
    sput-object v0, Lcom/agy/core/CoreRuntimeState;->csrfToken:Ljava/lang/String;

    .line 17
    sput-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 19
    const/4 v0, 0x0

    sput-boolean v0, Lcom/agy/core/CoreRuntimeState;->restarting:Z

    .line 21
    sput v0, Lcom/agy/core/CoreRuntimeState;->readyGeneration:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method
