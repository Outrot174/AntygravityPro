.class public final Lcom/agy/bridge/UiBridge;
.super Ljava/lang/Object;
.source "UiBridge.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AndroidBridge"


# instance fields
.field private volatile activityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/agy/ui/MainActivity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isDesktopMode()Z
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/agy/bridge/UiBridge;->activityRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/agy/bridge/UiBridge;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/agy/ui/MainActivity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 55
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/agy/ui/MainActivity;->isDesktopMode()Z

    move-result v0

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method public onUiError(Ljava/lang/String;)V
    .locals 2

    .line 39
    invoke-static {p1}, Lcom/agy/util/SensitiveDataRedactor;->redactLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onUiError() received from JavaScript: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AndroidBridge"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    iget-object v0, p0, Lcom/agy/bridge/UiBridge;->activityRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/agy/bridge/UiBridge;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/agy/ui/MainActivity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 42
    :goto_0
    if-nez v0, :cond_1

    .line 43
    return-void

    .line 45
    :cond_1
    new-instance v1, Lcom/agy/bridge/UiBridge$2;

    invoke-direct {v1, p0, v0, p1}, Lcom/agy/bridge/UiBridge$2;-><init>(Lcom/agy/bridge/UiBridge;Lcom/agy/ui/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/agy/ui/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 51
    return-void
.end method

.method public onUiReady()V
    .locals 2

    .line 25
    const-string v0, "AndroidBridge"

    const-string v1, "onUiReady() received from JavaScript; posting dismissSplash"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    iget-object v0, p0, Lcom/agy/bridge/UiBridge;->activityRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/agy/bridge/UiBridge;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/agy/ui/MainActivity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 27
    :goto_0
    if-nez v0, :cond_1

    .line 28
    return-void

    .line 30
    :cond_1
    new-instance v1, Lcom/agy/bridge/UiBridge$1;

    invoke-direct {v1, p0, v0}, Lcom/agy/bridge/UiBridge$1;-><init>(Lcom/agy/bridge/UiBridge;Lcom/agy/ui/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/agy/ui/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 36
    return-void
.end method

.method public setActivity(Lcom/agy/ui/MainActivity;)V
    .locals 1

    .line 21
    if-eqz p1, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/agy/bridge/UiBridge;->activityRef:Ljava/lang/ref/WeakReference;

    .line 22
    return-void
.end method

.method public setDesktopMode(Z)V
    .locals 2

    .line 59
    iget-object v0, p0, Lcom/agy/bridge/UiBridge;->activityRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/agy/bridge/UiBridge;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/agy/ui/MainActivity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 60
    :goto_0
    if-nez v0, :cond_1

    .line 61
    return-void

    .line 63
    :cond_1
    new-instance v1, Lcom/agy/bridge/UiBridge$3;

    invoke-direct {v1, p0, v0, p1}, Lcom/agy/bridge/UiBridge$3;-><init>(Lcom/agy/bridge/UiBridge;Lcom/agy/ui/MainActivity;Z)V

    invoke-virtual {v0, v1}, Lcom/agy/ui/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 69
    return-void
.end method
