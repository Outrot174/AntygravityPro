.class Lcom/agy/runtime/EnvInstallScheduler$1;
.super Ljava/lang/Object;
.source "EnvInstallScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/runtime/EnvInstallScheduler;->schedule(Lcom/agy/runtime/RuntimeManager;Ljava/util/concurrent/atomic/AtomicBoolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$rm:Lcom/agy/runtime/RuntimeManager;

.field final synthetic val$started:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Lcom/agy/runtime/RuntimeManager;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 28
    iput-object p1, p0, Lcom/agy/runtime/EnvInstallScheduler$1;->val$rm:Lcom/agy/runtime/RuntimeManager;

    iput-object p2, p0, Lcom/agy/runtime/EnvInstallScheduler$1;->val$started:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 32
    const-string v0, "EnvInstallScheduler"

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/agy/runtime/EnvInstallScheduler$1;->val$rm:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v2}, Lcom/agy/runtime/RuntimeManager;->appContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/agy/install/EnvInstaller;->install(Landroid/content/Context;)Z

    move-result v2

    .line 33
    iget-object v3, p0, Lcom/agy/runtime/EnvInstallScheduler$1;->val$rm:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v3}, Lcom/agy/runtime/RuntimeManager;->appContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-static {v3}, Lcom/agy/install/EnvBundleManifest;->load(Landroid/content/res/AssetManager;)Lcom/agy/install/EnvBundleManifest;

    move-result-object v3

    .line 34
    iget-object v4, p0, Lcom/agy/runtime/EnvInstallScheduler$1;->val$rm:Lcom/agy/runtime/RuntimeManager;

    .line 35
    invoke-virtual {v4}, Lcom/agy/runtime/RuntimeManager;->appContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/agy/runtime/EnvInstallScheduler$1;->val$rm:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v5}, Lcom/agy/runtime/RuntimeManager;->appContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/agy/install/EnvInstaller;->prefix(Landroid/content/Context;)Ljava/io/File;

    move-result-object v5

    iget-object v6, v3, Lcom/agy/install/EnvBundleManifest;->seedPackages:Ljava/util/List;

    .line 34
    invoke-static {v4, v5, v6}, Lcom/agy/install/SeedPackageInstaller;->installDefaults(Landroid/content/Context;Ljava/io/File;Ljava/util/List;)Z

    move-result v4

    .line 39
    iget-object v5, p0, Lcom/agy/runtime/EnvInstallScheduler$1;->val$rm:Lcom/agy/runtime/RuntimeManager;

    if-nez v2, :cond_1

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    move v2, v1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x1

    :goto_1
    invoke-static {v5, v2}, Lcom/agy/runtime/ShellBridgeInstaller;->install(Lcom/agy/runtime/RuntimeManager;Z)V

    .line 40
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "env ready; bundle="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v3, Lcom/agy/install/EnvBundleManifest;->bundleId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " seeded="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; runtime/bin bridges refreshed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    goto :goto_3

    .line 42
    :catchall_0
    move-exception v2

    .line 43
    iget-object v3, p0, Lcom/agy/runtime/EnvInstallScheduler$1;->val$started:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "env install failed; core continues without bionic tools: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 45
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    :goto_2
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 44
    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 47
    :goto_3
    return-void
.end method
