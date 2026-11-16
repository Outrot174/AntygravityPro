.class public final Lcom/agy/install/EnvInstaller;
.super Ljava/lang/Object;
.source "EnvInstaller.java"


# static fields
.field private static final STATE_SCHEMA:Ljava/lang/String; = "2"

.field private static final TAG:Ljava/lang/String; = "EnvInstaller"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method private static bashSmokeTest(Landroid/content/Context;Ljava/io/File;)Z
    .locals 9

    .line 276
    nop

    .line 278
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/lang/ProcessBuilder;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    new-instance v4, Ljava/io/File;

    const-string v5, "bin/bash"

    invoke-direct {v4, p1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 279
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v0

    const-string v4, "-c"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-string v4, "exit 0"

    const/4 v6, 0x2

    aput-object v4, v3, v6

    invoke-direct {v2, v3}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 280
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/ProcessBuilder;->directory(Ljava/io/File;)Ljava/lang/ProcessBuilder;

    .line 281
    invoke-virtual {v2, v5}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    .line 282
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v3

    const-string v4, "PREFIX"

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v3

    const-string v4, "HOME"

    new-instance v6, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    const-string v8, "home"

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v3

    const-string v4, "TMPDIR"

    new-instance v6, Ljava/io/File;

    const-string v7, "tmp"

    invoke-direct {v6, p1, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v3

    const-string v4, "PATH"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v7, Ljava/io/File;

    const-string v8, "bin"

    invoke-direct {v7, p1, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":/system/bin"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v3

    const-string v4, "LD_LIBRARY_PATH"

    new-instance v6, Ljava/io/File;

    const-string v7, "lib"

    invoke-direct {v6, p1, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    new-instance v3, Ljava/io/File;

    const-string v4, "lib/libtermux-exec.so"

    invoke-direct {v3, p1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 288
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 289
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object p1

    const-string v4, "LD_PRELOAD"

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    :cond_0
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object p1

    const-string v3, "AGY_APPLICATION_ID"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v1

    .line 293
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0xf

    invoke-virtual {v1, v2, v3, p0}, Ljava/lang/Process;->waitFor(JLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    if-nez p0, :cond_1

    .line 294
    invoke-virtual {v1}, Ljava/lang/Process;->destroyForcibly()Ljava/lang/Process;

    .line 295
    return v0

    .line 297
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Process;->exitValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_2

    move v0, v5

    :cond_2
    return v0

    .line 298
    :catch_0
    move-exception p0

    .line 299
    if-eqz v1, :cond_3

    .line 300
    invoke-virtual {v1}, Ljava/lang/Process;->destroyForcibly()Ljava/lang/Process;

    .line 302
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bash smoke test failed: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "EnvInstaller"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    return v0
.end method

.method private static countSymlinks(Ljava/io/File;)I
    .locals 5

    .line 228
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    .line 229
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 230
    return v0

    .line 232
    :cond_0
    nop

    .line 233
    array-length v1, p0

    move v2, v0

    :goto_0
    if-ge v0, v1, :cond_3

    aget-object v3, p0, v0

    .line 234
    invoke-static {v3}, Lcom/agy/install/TextFileDetector;->isSymlink(Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 235
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 236
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 237
    invoke-static {v3}, Lcom/agy/install/EnvInstaller;->countSymlinks(Ljava/io/File;)I

    move-result v3

    add-int/2addr v2, v3

    .line 233
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 240
    :cond_3
    return v2
.end method

.method private static deleteTreeQuietly(Ljava/io/File;Ljava/io/File;)V
    .locals 5

    .line 315
    const-string v0, "EnvInstaller"

    if-eqz p0, :cond_5

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {p0}, Lcom/agy/install/TextFileDetector;->isSymlink(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_3

    .line 322
    :cond_0
    :try_start_0
    invoke-static {p1, p0}, Lcom/agy/util/PathSafety;->isInside(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p0, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    .line 326
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 327
    if-eqz v1, :cond_2

    .line 328
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 329
    invoke-static {v4, p1}, Lcom/agy/install/EnvInstaller;->deleteTreeQuietly(Ljava/io/File;Ljava/io/File;)V

    .line 328
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 332
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_3

    .line 333
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot remove failed staging path: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    :cond_3
    goto :goto_2

    .line 323
    :cond_4
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "refusing to clean unsafe staging path: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    return-void

    .line 335
    :catch_0
    move-exception p0

    .line 336
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot validate failed staging path: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    :goto_2
    return-void

    .line 316
    :cond_5
    :goto_3
    if-eqz p0, :cond_6

    invoke-static {p0}, Lcom/agy/install/TextFileDetector;->isSymlink(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 317
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 319
    :cond_6
    return-void
.end method

.method public static declared-synchronized install(Landroid/content/Context;)Z
    .locals 8

    const-class v0, Lcom/agy/install/EnvInstaller;

    monitor-enter v0

    .line 39
    if-eqz p0, :cond_3

    .line 42
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 43
    if-nez v1, :cond_0

    .line 44
    goto :goto_0

    .line 43
    :cond_0
    move-object p0, v1

    .line 46
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 47
    invoke-static {p0}, Lcom/agy/install/EnvInstaller;->prefix(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    .line 48
    invoke-static {p0, v2}, Lcom/agy/install/EnvInstaller;->validatePrefixLocation(Landroid/content/Context;Ljava/io/File;)V

    .line 50
    invoke-static {v1}, Lcom/agy/install/EnvBundleManifest;->load(Landroid/content/res/AssetManager;)Lcom/agy/install/EnvBundleManifest;

    move-result-object v3

    .line 51
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "env/bootstrap/bootstrap.tar.gz"

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-string v5, "env/bootstrap/bootstrap.tar"

    const/4 v7, 0x1

    aput-object v5, v4, v7

    invoke-static {v1, v4}, Lcom/agy/util/AssetPicker;->pick(Landroid/content/res/AssetManager;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 52
    if-eqz v4, :cond_2

    .line 55
    invoke-static {p0}, Lcom/agy/install/EnvInstaller;->isInstalled(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 56
    invoke-static {p0, v1, v2, v4, v3}, Lcom/agy/install/EnvInstaller;->updateManagedLayers(Landroid/content/Context;Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;Lcom/agy/install/EnvBundleManifest;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    monitor-exit v0

    return v6

    .line 59
    :cond_1
    :try_start_1
    invoke-static {p0, v1, v2, v4, v3}, Lcom/agy/install/EnvInstaller;->installFresh(Landroid/content/Context;Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;Lcom/agy/install/EnvBundleManifest;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    monitor-exit v0

    return v7

    .line 53
    :cond_2
    :try_start_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "required asset missing: env/bootstrap/bootstrap.tar.gz"

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 38
    :catchall_0
    move-exception p0

    goto :goto_1

    .line 40
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v1, "null context"

    invoke-direct {p0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    :goto_1
    monitor-exit v0

    throw p0
.end method

.method private static installFresh(Landroid/content/Context;Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;Lcom/agy/install/EnvBundleManifest;)V
    .locals 8

    .line 80
    invoke-virtual {p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 81
    if-eqz v0, :cond_a

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 84
    :cond_0
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ".usr-stage-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 85
    nop

    .line 87
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 88
    :cond_1
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "cannot create staging prefix: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 90
    :cond_2
    :goto_0
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    .line 91
    iget-object v2, p4, Lcom/agy/install/EnvBundleManifest;->bootstrapSha256:Ljava/lang/String;

    iget v3, p4, Lcom/agy/install/EnvBundleManifest;->bootstrapSymlinkCount:I

    invoke-static {p1, p3, v1, v2, v3}, Lcom/agy/install/BootstrapExtractor;->extract(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;I)V

    .line 93
    const-string p3, "env/overlay"

    invoke-static {p1, p3, v1}, Lcom/agy/install/OverlayCopier;->overlay(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    .line 94
    invoke-static {p1, v1, v7}, Lcom/agy/install/PkgInstaller;->install(Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;)V

    .line 95
    invoke-static {p1, v1, v7}, Lcom/agy/install/EnvInstaller;->prepareTree(Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;)V

    .line 96
    iget-object v4, p4, Lcom/agy/install/EnvBundleManifest;->bootstrapSha256:Ljava/lang/String;

    iget-object v5, p4, Lcom/agy/install/EnvBundleManifest;->bootstrapSha256:Ljava/lang/String;

    const/4 v6, 0x0

    move-object v2, v1

    move-object v3, p4

    invoke-static/range {v2 .. v7}, Lcom/agy/install/EnvInstaller;->writeMarker(Ljava/io/File;Lcom/agy/install/EnvBundleManifest;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 98
    iget p1, p4, Lcom/agy/install/EnvBundleManifest;->bootstrapSymlinkCount:I

    invoke-static {v1, p1}, Lcom/agy/install/EnvInstaller;->validateTree(Ljava/io/File;I)V

    .line 101
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string p3, ".usr-incomplete-"

    if-eqz p1, :cond_4

    :try_start_1
    invoke-static {p2}, Lcom/agy/install/TextFileDetector;->isSymlink(Ljava/io/File;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 102
    new-instance p1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, v0, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 103
    invoke-virtual {p2, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p3

    if-eqz p3, :cond_3

    goto :goto_1

    .line 104
    :cond_3
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "cannot preserve incomplete prefix "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 106
    :cond_4
    invoke-static {p2}, Lcom/agy/install/TextFileDetector;->isSymlink(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 107
    new-instance p1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, v0, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 108
    invoke-virtual {p2, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p3

    if-eqz p3, :cond_5

    goto :goto_1

    .line 109
    :cond_5
    new-instance p1, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "cannot preserve prefix link "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 106
    :cond_6
    const/4 p1, 0x0

    .line 112
    :goto_1
    invoke-virtual {v1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p3

    if-eqz p3, :cond_9

    .line 116
    invoke-static {p0, p2}, Lcom/agy/install/EnvInstaller;->bashSmokeTest(Landroid/content/Context;Ljava/io/File;)Z

    move-result p3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v2, "EnvInstaller"

    if-nez p3, :cond_8

    .line 117
    :try_start_2
    new-instance p3, Ljava/io/File;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ".usr-failed-"

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-direct {p3, v0, p4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 118
    invoke-virtual {p2, p3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p3

    if-nez p3, :cond_7

    .line 119
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "new prefix failed smoke test and could not be quarantined: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :cond_7
    invoke-static {p2, p1}, Lcom/agy/install/EnvInstaller;->restoreQuarantine(Ljava/io/File;Ljava/io/File;)V

    .line 122
    new-instance p1, Ljava/io/IOException;

    const-string p2, "installed bash failed its smoke test; prefix preserved for diagnosis"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 124
    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "env prefix installed atomically: "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " bundle="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p4, Lcom/agy/install/EnvBundleManifest;->bundleId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    nop

    .line 130
    return-void

    .line 113
    :cond_9
    invoke-static {p2, p1}, Lcom/agy/install/EnvInstaller;->restoreQuarantine(Ljava/io/File;Ljava/io/File;)V

    .line 114
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "cannot atomically publish staging prefix "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 126
    :catch_0
    move-exception p1

    .line 127
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/agy/install/EnvInstaller;->deleteTreeQuietly(Ljava/io/File;Ljava/io/File;)V

    .line 128
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "env install failed: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    .line 82
    :cond_a
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "cannot create prefix parent: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static isInstalled(Landroid/content/Context;)Z
    .locals 2

    .line 32
    invoke-static {p0}, Lcom/agy/install/EnvInstaller;->prefix(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    .line 33
    new-instance v0, Ljava/io/File;

    const-string v1, ".installed"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    const-string v1, "bin/bash"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 34
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 33
    :goto_0
    return p0
.end method

.method public static prefix(Landroid/content/Context;)Ljava/io/File;
    .locals 0

    .line 28
    invoke-static {p0}, Lcom/agy/install/EnvPaths;->prefix(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method private static prepareTree(Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;)V
    .locals 1

    .line 193
    invoke-static {p1, p2}, Lcom/agy/install/TermuxSymlinkFixer;->fix(Ljava/io/File;Ljava/lang/String;)I

    .line 194
    invoke-static {p1, p2}, Lcom/agy/install/TermuxShebangRewriter;->rewrite(Ljava/io/File;Ljava/lang/String;)V

    .line 195
    invoke-static {p1, p2}, Lcom/agy/install/TermuxPrefixRewriter;->rewrite(Ljava/io/File;Ljava/lang/String;)V

    .line 196
    new-instance p2, Ljava/io/File;

    const-string v0, "bin"

    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/agy/util/FileModeUtil;->recursiveSetExec(Ljava/io/File;)V

    .line 197
    new-instance p2, Ljava/io/File;

    const-string v0, "libexec/pkg/pkg"

    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/agy/util/FileModeUtil;->setExec(Ljava/io/File;)V

    .line 198
    new-instance p2, Ljava/io/File;

    const-string v0, "bin/agy-fix-paths"

    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 199
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 200
    invoke-static {p2}, Lcom/agy/util/FileModeUtil;->setExec(Ljava/io/File;)V

    .line 202
    :cond_0
    invoke-static {p0, p1}, Lcom/agy/install/BusInstaller;->install(Landroid/content/res/AssetManager;Ljava/io/File;)V

    .line 203
    invoke-static {p1}, Lcom/agy/install/TermuxHooksRemover;->remove(Ljava/io/File;)V

    .line 204
    return-void
.end method

.method private static readState(Ljava/io/File;)Ljava/util/Properties;
    .locals 4

    .line 244
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 245
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_0

    .line 246
    return-object v0

    .line 248
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 249
    :try_start_1
    invoke-virtual {v0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 250
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 252
    goto :goto_1

    .line 248
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v1

    :try_start_4
    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 250
    :catch_0
    move-exception v1

    .line 251
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot read env state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, ": "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "EnvInstaller"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    :goto_1
    return-object v0
.end method

.method private static requireFile(Ljava/io/File;Ljava/lang/String;)V
    .locals 3

    .line 222
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    return-void

    .line 223
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "required env file missing: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " at "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static restoreQuarantine(Ljava/io/File;Ljava/io/File;)V
    .locals 2

    .line 308
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 309
    invoke-virtual {p1, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 310
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot restore preserved prefix "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " -> "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "EnvInstaller"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    :cond_0
    return-void
.end method

.method private static updateManagedLayers(Landroid/content/Context;Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;Lcom/agy/install/EnvBundleManifest;)V
    .locals 10

    .line 135
    new-instance p0, Ljava/io/File;

    const-string p3, ".installed"

    invoke-direct {p0, p2, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/agy/install/EnvInstaller;->readState(Ljava/io/File;)Ljava/util/Properties;

    move-result-object p0

    .line 136
    const-string p3, "bootstrap_sha256"

    invoke-virtual {p0, p3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 137
    const-string v0, "overlay_sha256"

    invoke-virtual {p0, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 138
    const-string v1, "pkg_sha256"

    invoke-virtual {p0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 139
    const-string v2, "prefix_path"

    invoke-virtual {p0, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 140
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    .line 145
    const-string v2, "legacy"

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz p3, :cond_0

    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    move v5, v3

    .line 146
    :goto_0
    iget-object v6, p4, Lcom/agy/install/EnvBundleManifest;->bootstrapSha256:Ljava/lang/String;

    invoke-virtual {v6, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 147
    nop

    .line 148
    xor-int/lit8 v8, v6, 0x1

    if-eqz v5, :cond_1

    move-object v6, p3

    goto :goto_1

    :cond_1
    move-object v6, v2

    .line 149
    :goto_1
    const-string v9, "EnvInstaller"

    if-eqz v5, :cond_2

    if-eqz v8, :cond_2

    .line 150
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bootstrap changed; preserving mutable prefix until an explicit migration is available (installed="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v2, ", bundled="

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object v2, p4, Lcom/agy/install/EnvBundleManifest;->bootstrapSha256:Ljava/lang/String;

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v2, ")"

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v9, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 153
    :cond_2
    if-nez v5, :cond_3

    if-eqz v8, :cond_3

    .line 154
    const-string p3, "legacy prefix has no base version; preserving it and refreshing only AGY-managed overlay/pkg layers"

    invoke-static {v9, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    :cond_3
    :goto_2
    iget-object p3, p4, Lcom/agy/install/EnvBundleManifest;->overlaySha256:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    .line 159
    xor-int/2addr p3, v4

    iget-object v0, p4, Lcom/agy/install/EnvBundleManifest;->pkgSha256:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 160
    xor-int/2addr v0, v4

    if-eqz p3, :cond_4

    .line 161
    const-string v1, "env/overlay"

    invoke-static {p1, v1, p2}, Lcom/agy/install/OverlayCopier;->overlay(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    .line 163
    :cond_4
    if-eqz v0, :cond_5

    .line 164
    invoke-static {p1, p2, v7}, Lcom/agy/install/PkgInstaller;->install(Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;)V

    .line 167
    :cond_5
    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    .line 168
    xor-int/2addr p0, v4

    if-nez p0, :cond_6

    if-nez p3, :cond_6

    if-eqz v0, :cond_7

    .line 169
    :cond_6
    invoke-static {p2, v7}, Lcom/agy/install/TermuxSymlinkFixer;->fix(Ljava/io/File;Ljava/lang/String;)I

    .line 170
    invoke-static {p2, v7}, Lcom/agy/install/TermuxShebangRewriter;->rewrite(Ljava/io/File;Ljava/lang/String;)V

    .line 171
    invoke-static {p2, v7}, Lcom/agy/install/TermuxPrefixRewriter;->rewrite(Ljava/io/File;Ljava/lang/String;)V

    .line 173
    :cond_7
    if-nez p3, :cond_8

    if-eqz v0, :cond_9

    .line 174
    :cond_8
    new-instance p0, Ljava/io/File;

    const-string v1, "bin"

    invoke-direct {p0, p2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/agy/util/FileModeUtil;->recursiveSetExec(Ljava/io/File;)V

    .line 176
    :cond_9
    new-instance p0, Ljava/io/File;

    const-string v1, "libexec/pkg/pkg"

    invoke-direct {p0, p2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/agy/util/FileModeUtil;->setExec(Ljava/io/File;)V

    .line 177
    new-instance p0, Ljava/io/File;

    const-string v1, "bin/agy-fix-paths"

    invoke-direct {p0, p2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 178
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 179
    invoke-static {p0}, Lcom/agy/util/FileModeUtil;->setExec(Ljava/io/File;)V

    .line 181
    :cond_a
    invoke-static {p1, p2}, Lcom/agy/install/BusInstaller;->install(Landroid/content/res/AssetManager;Ljava/io/File;)V

    .line 182
    invoke-static {p2}, Lcom/agy/install/TermuxHooksRemover;->remove(Ljava/io/File;)V

    .line 183
    invoke-static {p2, v3}, Lcom/agy/install/EnvInstaller;->validateTree(Ljava/io/File;I)V

    .line 184
    iget-object v5, p4, Lcom/agy/install/EnvBundleManifest;->bootstrapSha256:Ljava/lang/String;

    move-object v2, p2

    move-object v3, p4

    move-object v4, v6

    move v6, v8

    invoke-static/range {v2 .. v7}, Lcom/agy/install/EnvInstaller;->writeMarker(Ljava/io/File;Lcom/agy/install/EnvBundleManifest;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 186
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "env managed layers ready: overlay="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "updated"

    const-string p2, "current"

    if-eqz p3, :cond_b

    move-object p3, p1

    goto :goto_3

    :cond_b
    move-object p3, p2

    :goto_3
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p3, " pkg="

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 187
    if-eqz v0, :cond_c

    goto :goto_4

    :cond_c
    move-object p1, p2

    :goto_4
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " bootstrap="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 188
    if-eqz v8, :cond_d

    const-string p2, "pending"

    :cond_d
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 186
    invoke-static {v9, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    return-void
.end method

.method private static validatePrefixLocation(Landroid/content/Context;Ljava/io/File;)V
    .locals 3

    .line 65
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    .line 66
    new-instance v0, Ljava/io/File;

    const-string v1, ".gemini"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 67
    invoke-static {p0, p1}, Lcom/agy/util/PathSafety;->isInside(Ljava/io/File;Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 68
    invoke-static {v0, p1}, Lcom/agy/util/PathSafety;->isInside(Ljava/io/File;Ljava/io/File;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 69
    invoke-static {p1, v0}, Lcom/agy/util/PathSafety;->isInside(Ljava/io/File;Ljava/io/File;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 75
    nop

    .line 76
    return-void

    .line 70
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "refusing unsafe env prefix location: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    :catch_0
    move-exception p0

    .line 74
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot resolve prefix "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static validateTree(Ljava/io/File;I)V
    .locals 3

    .line 207
    new-instance v0, Ljava/io/File;

    const-string v1, "bin"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 208
    new-instance v1, Ljava/io/File;

    const-string v2, "bash"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/agy/install/EnvInstaller;->requireFile(Ljava/io/File;Ljava/lang/String;)V

    .line 209
    new-instance v1, Ljava/io/File;

    const-string v2, "sh"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/agy/install/EnvInstaller;->requireFile(Ljava/io/File;Ljava/lang/String;)V

    .line 210
    new-instance v1, Ljava/io/File;

    const-string v2, "pkg"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v0, "pkg wrapper"

    invoke-static {v1, v0}, Lcom/agy/install/EnvInstaller;->requireFile(Ljava/io/File;Ljava/lang/String;)V

    .line 211
    new-instance v0, Ljava/io/File;

    const-string v1, "lib/libtermux-exec.so"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v1, "libtermux-exec.so"

    invoke-static {v0, v1}, Lcom/agy/install/EnvInstaller;->requireFile(Ljava/io/File;Ljava/lang/String;)V

    .line 212
    if-lez p1, :cond_1

    .line 213
    invoke-static {p0}, Lcom/agy/install/EnvInstaller;->countSymlinks(Ljava/io/File;)I

    move-result p0

    .line 214
    if-lt p0, p1, :cond_0

    goto :goto_0

    .line 215
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bootstrap symlink set incomplete: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " < "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_1
    :goto_0
    return-void
.end method

.method private static writeMarker(Ljava/io/File;Lcom/agy/install/EnvBundleManifest;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2

    .line 259
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "schema=2\nbundle_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/agy/install/EnvBundleManifest;->bundleId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nbootstrap_sha256="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "\nbootstrap_target_sha256="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "\nbootstrap_update_pending="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "\noverlay_sha256="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p3, p1, Lcom/agy/install/EnvBundleManifest;->overlaySha256:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "\npkg_sha256="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p3, p1, Lcom/agy/install/EnvBundleManifest;->pkgSha256:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "\nprefix_path="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "\n"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 267
    new-instance p3, Ljava/io/File;

    const-string p4, ".installed"

    invoke-direct {p3, p0, p4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 268
    invoke-static {p3, p2}, Lcom/agy/util/AtomicFileWriter;->writeText(Ljava/io/File;Ljava/lang/String;)V

    .line 269
    invoke-static {p3}, Lcom/agy/install/EnvInstaller;->readState(Ljava/io/File;)Ljava/util/Properties;

    move-result-object p0

    .line 270
    iget-object p1, p1, Lcom/agy/install/EnvBundleManifest;->bundleId:Ljava/lang/String;

    const-string p2, "bundle_id"

    invoke-virtual {p0, p2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 273
    return-void

    .line 271
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "cannot persist env state marker: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
