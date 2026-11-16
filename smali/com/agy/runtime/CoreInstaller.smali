.class public final Lcom/agy/runtime/CoreInstaller;
.super Ljava/lang/Object;
.source "CoreInstaller.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CoreInstaller"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method private static assertSafeToWipe(Lcom/agy/runtime/RuntimeManager;Ljava/io/File;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 153
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->appContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    .line 154
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    .line 155
    new-instance v1, Ljava/io/File;

    const-string v2, ".gemini"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p0

    .line 156
    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v1

    .line 157
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 160
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 161
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 162
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 165
    return-void

    .line 163
    :cond_0
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "refusing to wipe user data under .gemini: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 158
    :cond_1
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "refusing to wipe outside filesDir: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static getAssetManifestHash(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 94
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    const-string v0, "runtime/manifest.json"

    invoke-virtual {p0, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    :try_start_1
    invoke-static {p0}, Lcom/agy/util/Sha256;->of(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    if-eqz p0, :cond_0

    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 95
    :cond_0
    return-object v0

    .line 94
    :catchall_0
    move-exception v0

    if-eqz p0, :cond_1

    :try_start_3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    :try_start_4
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 96
    :catch_0
    move-exception p0

    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot hash asset manifest: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "CoreInstaller"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    const-string p0, ""

    return-object p0
.end method

.method public static installCore(Lcom/agy/runtime/RuntimeManager;)V
    .locals 6

    .line 22
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->appContext()Landroid/content/Context;

    move-result-object v0

    .line 23
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getRuntimeDir()Ljava/io/File;

    move-result-object v1

    .line 24
    invoke-static {v0}, Lcom/agy/runtime/CoreInstaller;->getAssetManifestHash(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 25
    invoke-static {p0, v2}, Lcom/agy/runtime/CoreInstaller;->isRuntimeUpToDate(Lcom/agy/runtime/RuntimeManager;Ljava/lang/String;)Z

    move-result v3

    .line 27
    const-string v4, ": "

    const-string v5, "CoreInstaller"

    if-nez v3, :cond_1

    .line 28
    const-string v3, "extracting assets/runtime (first launch or runtime update)"

    invoke-static {v5, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    :try_start_0
    invoke-static {p0, v1}, Lcom/agy/runtime/CoreInstaller;->wipe(Lcom/agy/runtime/RuntimeManager;Ljava/io/File;)V

    .line 31
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v5, "runtime"

    invoke-static {v3, v5, v1}, Lcom/agy/util/AssetUnpacker;->unpackTree(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    nop

    .line 37
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getBinDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lcom/agy/util/FileModeUtil;->recursiveSetReadableExecutable(Ljava/io/File;)V

    .line 38
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getLibDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lcom/agy/util/FileModeUtil;->recursiveSetReadableExecutable(Ljava/io/File;)V

    .line 39
    invoke-static {v0, v1}, Lcom/agy/runtime/ManifestVerifier;->verifyError(Landroid/content/Context;Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 40
    if-nez v1, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getRuntimeDir()Ljava/io/File;

    move-result-object v1

    const-string v3, ".installed"

    invoke-static {v1, v3, v2}, Lcom/agy/runtime/CoreInstaller;->writeMarker(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    goto :goto_0

    .line 41
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "runtime integrity check failed: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 32
    :catch_0
    move-exception p0

    .line 33
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot unpack assets/runtime into "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 35
    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 46
    :cond_1
    const-string v1, "runtime up to date (manifest hash matched); skipping extract"

    invoke-static {v5, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    :goto_0
    invoke-static {p0}, Lcom/agy/runtime/CoreInstaller;->isWebExtracted(Lcom/agy/runtime/RuntimeManager;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 50
    :try_start_1
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "web"

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getWebDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/agy/util/AssetUnpacker;->unpackTree(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    .line 51
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getWebDir()Ljava/io/File;

    move-result-object v1

    const-string v2, ".web_installed"

    invoke-static {v1, v2}, Lcom/agy/runtime/CoreInstaller;->writeMarker(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 56
    goto :goto_1

    .line 52
    :catch_1
    move-exception v0

    .line 53
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot unpack assets/web into "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 54
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getWebDir()Ljava/io/File;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 55
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 60
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->writeNetworkConfig()V

    .line 61
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->startNetworkMonitor()V

    .line 62
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getAppDataDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getProjectsDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/agy/runtime/OnboardingSeeder;->seed(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V

    .line 65
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getBinDir()Ljava/io/File;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/agy/runtime/ShellBridgeInstaller;->installFallbackBridges(Ljava/io/File;Landroid/content/Context;)V

    .line 66
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getBinDir()Ljava/io/File;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/agy/runtime/ShellBridgeInstaller;->installOpenUrlShims(Ljava/io/File;Landroid/content/Context;)V

    .line 69
    invoke-static {v0}, Lcom/agy/install/EnvInstaller;->isInstalled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 70
    invoke-static {p0}, Lcom/agy/runtime/ShellBridgeInstaller;->install(Lcom/agy/runtime/RuntimeManager;)V

    .line 72
    :cond_3
    return-void
.end method

.method private static isRuntimeUpToDate(Lcom/agy/runtime/RuntimeManager;Ljava/lang/String;)Z
    .locals 6

    .line 75
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 78
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getRuntimeDir()Ljava/io/File;

    move-result-object v2

    const-string v3, ".installed"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 79
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getBinDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "liblanguage_server.so"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 80
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getBinDir()Ljava/io/File;

    move-result-object v4

    const-string v5, "libloader.so"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 81
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getLibDir()Ljava/io/File;

    move-result-object p0

    const-string v5, "liblse_compat.so"

    invoke-direct {v4, p0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 82
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    .line 86
    :cond_1
    :try_start_0
    new-instance p0, Ljava/io/FileInputStream;

    invoke-direct {p0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const-string v1, "UTF-8"

    invoke-static {p0, v1}, Lcom/agy/util/IoUtil;->readAll(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 87
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 88
    :catch_0
    move-exception p0

    .line 89
    return v0

    .line 83
    :cond_2
    :goto_0
    return v0

    .line 76
    :cond_3
    :goto_1
    return v0
.end method

.method private static isWebExtracted(Lcom/agy/runtime/RuntimeManager;)Z
    .locals 5

    .line 103
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getWebDir()Ljava/io/File;

    move-result-object v1

    const-string v2, ".web_installed"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 104
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->getWebDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "main.js"

    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 108
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->appContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 109
    invoke-virtual {p0}, Lcom/agy/runtime/RuntimeManager;->appContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-wide v3, p0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 110
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    cmp-long p0, v0, v3

    if-gez p0, :cond_1

    .line 111
    const-string p0, "CoreInstaller"

    const-string v0, "APK updated; refreshing assets/web"

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    return v2

    .line 115
    :cond_1
    goto :goto_0

    .line 114
    :catch_0
    move-exception p0

    .line 116
    :goto_0
    const/4 p0, 0x1

    return p0

    .line 105
    :cond_2
    :goto_1
    return v2
.end method

.method private static wipe(Lcom/agy/runtime/RuntimeManager;Ljava/io/File;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    invoke-static {p0, p1}, Lcom/agy/runtime/CoreInstaller;->assertSafeToWipe(Lcom/agy/runtime/RuntimeManager;Ljava/io/File;)V

    .line 133
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 134
    return-void

    .line 136
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 137
    if-eqz v0, :cond_1

    .line 138
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 139
    invoke-static {p0, v3}, Lcom/agy/runtime/CoreInstaller;->wipe(Lcom/agy/runtime/RuntimeManager;Ljava/io/File;)V

    .line 138
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 142
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 145
    return-void

    .line 143
    :cond_2
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot delete "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static writeMarker(Ljava/io/File;Ljava/lang/String;)V
    .locals 1

    .line 120
    const-string v0, "1"

    invoke-static {p0, p1, v0}, Lcom/agy/runtime/CoreInstaller;->writeMarker(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method private static writeMarker(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 125
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, "\n"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/agy/util/AtomicFileWriter;->writeText(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    goto :goto_0

    .line 126
    :catch_0
    move-exception p0

    .line 127
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "cannot write marker "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ": "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "CoreInstaller"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    :goto_0
    return-void
.end method
