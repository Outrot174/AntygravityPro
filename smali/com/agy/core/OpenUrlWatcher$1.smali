.class Lcom/agy/core/OpenUrlWatcher$1;
.super Landroid/content/BroadcastReceiver;
.source "OpenUrlWatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/agy/core/OpenUrlWatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/core/OpenUrlWatcher;


# direct methods
.method constructor <init>(Lcom/agy/core/OpenUrlWatcher;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/agy/core/OpenUrlWatcher$1;->this$0:Lcom/agy/core/OpenUrlWatcher;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 39
    if-nez p2, :cond_0

    return-void

    .line 40
    :cond_0
    const-string p1, "url"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 41
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1

    .line 42
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "broadcast ACTION_OPEN_URL received: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 43
    invoke-static {p1}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 42
    const-string v0, "OpenUrlWatcher"

    invoke-static {v0, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    iget-object p2, p0, Lcom/agy/core/OpenUrlWatcher$1;->this$0:Lcom/agy/core/OpenUrlWatcher;

    invoke-virtual {p2, p1}, Lcom/agy/core/OpenUrlWatcher;->dispatchIfValid(Ljava/lang/String;)V

    .line 46
    :cond_1
    return-void
.end method
