.class Lcom/agy/core/OpenUrlWatcher$2;
.super Ljava/lang/Object;
.source "OpenUrlWatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/core/OpenUrlWatcher;->openUrl(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/core/OpenUrlWatcher;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/agy/core/OpenUrlWatcher;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 140
    iput-object p1, p0, Lcom/agy/core/OpenUrlWatcher$2;->this$0:Lcom/agy/core/OpenUrlWatcher;

    iput-object p2, p0, Lcom/agy/core/OpenUrlWatcher$2;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 143
    sget-object v0, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    if-eqz v0, :cond_0

    .line 144
    sget-object v0, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    goto :goto_0

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/agy/core/OpenUrlWatcher$2;->this$0:Lcom/agy/core/OpenUrlWatcher;

    invoke-static {v0}, Lcom/agy/core/OpenUrlWatcher;->access$000(Lcom/agy/core/OpenUrlWatcher;)Landroid/content/Context;

    move-result-object v0

    .line 146
    :goto_0
    iget-object v1, p0, Lcom/agy/core/OpenUrlWatcher$2;->this$0:Lcom/agy/core/OpenUrlWatcher;

    invoke-static {v1}, Lcom/agy/core/OpenUrlWatcher;->access$100(Lcom/agy/core/OpenUrlWatcher;)Lcom/agy/oauth/OAuthManager;

    move-result-object v1

    iget-object v2, p0, Lcom/agy/core/OpenUrlWatcher$2;->val$url:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lcom/agy/oauth/OAuthManager;->openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    .line 147
    if-nez v0, :cond_1

    .line 148
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "no browser accepted the url: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/agy/core/OpenUrlWatcher$2;->val$url:Ljava/lang/String;

    .line 149
    invoke-static {v1}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 148
    const-string v1, "OpenUrlWatcher"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    :cond_1
    return-void
.end method
