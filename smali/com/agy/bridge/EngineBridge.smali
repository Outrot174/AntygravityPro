.class public final Lcom/agy/bridge/EngineBridge;
.super Ljava/lang/Object;
.source "EngineBridge.java"


# instance fields
.field private final runtime:Lcom/agy/runtime/RuntimeManager;


# direct methods
.method public constructor <init>(Lcom/agy/runtime/RuntimeManager;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/agy/bridge/EngineBridge;->runtime:Lcom/agy/runtime/RuntimeManager;

    .line 14
    return-void
.end method


# virtual methods
.method public getBaseUrl()Ljava/lang/String;
    .locals 3

    .line 25
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    .line 26
    if-eqz v0, :cond_1

    .line 27
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 28
    if-ltz v1, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/agy/bridge/EngineBridge;->runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimeManager;->getHttpsPort()I

    move-result v0

    invoke-static {v0}, Lcom/agy/util/CoreUrl;->baseUrl(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCsrfToken()Ljava/lang/String;
    .locals 1

    .line 34
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->csrfToken:Ljava/lang/String;

    .line 35
    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/agy/bridge/EngineBridge;->runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimeManager;->getCsrfToken()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/agy/bridge/EngineBridge;->runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimeManager;->getHttpsPort()I

    move-result v0

    return v0
.end method

.method public isReady()Z
    .locals 1

    .line 17
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
