.class public final Lcom/agy/runtime/RuntimePaths;
.super Ljava/lang/Object;
.source "RuntimePaths.java"


# static fields
.field public static final APP_DATA_DIR_NAME:Ljava/lang/String; = "antigravity-app"

.field public static final BIN_DIR:Ljava/lang/String; = "runtime/bin"

.field public static final CERT_REL:Ljava/lang/String; = "runtime/certs/ca-certificates.crt"

.field public static final CONFIG_PROJECTS:Ljava/lang/String; = "config/projects"

.field public static final CORE_NAME:Ljava/lang/String; = "liblanguage_server.so"

.field public static final GEMINI_DIR:Ljava/lang/String; = ".gemini"

.field public static final LIB_DIR:Ljava/lang/String; = "runtime/lib"

.field public static final LOADER_NAME:Ljava/lang/String; = "libloader.so"

.field public static final MANIFEST_ASSET:Ljava/lang/String; = "runtime/manifest.json"

.field public static final RUNTIME_ASSET:Ljava/lang/String; = "runtime"

.field public static final RUNTIME_MARKER:Ljava/lang/String; = ".installed"

.field public static final SEED_ASSET:Ljava/lang/String; = "runtime/seed"

.field public static final WEB_ASSET:Ljava/lang/String; = "web"

.field public static final WEB_MARKER:Ljava/lang/String; = ".web_installed"


# instance fields
.field private final appContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/agy/runtime/RuntimePaths;->appContext:Landroid/content/Context;

    .line 37
    return-void
.end method


# virtual methods
.method public getAppDataDir()Ljava/io/File;
    .locals 3

    .line 64
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimePaths;->getGeminiDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "antigravity-app"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getBinDir()Ljava/io/File;
    .locals 3

    .line 48
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/agy/runtime/RuntimePaths;->appContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "runtime/bin"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getCertFile()Ljava/io/File;
    .locals 3

    .line 56
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/agy/runtime/RuntimePaths;->appContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "runtime/certs/ca-certificates.crt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getGeminiDir()Ljava/io/File;
    .locals 3

    .line 60
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/agy/runtime/RuntimePaths;->appContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, ".gemini"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getLibDir()Ljava/io/File;
    .locals 3

    .line 52
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/agy/runtime/RuntimePaths;->appContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "runtime/lib"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getProjectsDir()Ljava/io/File;
    .locals 3

    .line 68
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/agy/runtime/RuntimePaths;->getGeminiDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "config/projects"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getRuntimeDir()Ljava/io/File;
    .locals 3

    .line 40
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/agy/runtime/RuntimePaths;->appContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "runtime"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getWebDir()Ljava/io/File;
    .locals 3

    .line 44
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/agy/runtime/RuntimePaths;->appContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "web"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method
