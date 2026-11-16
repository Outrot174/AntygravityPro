.class public final Lcom/agy/install/EnvPaths;
.super Ljava/lang/Object;
.source "EnvPaths.java"


# static fields
.field private static final ANDROID_PREFIX_REGEX:Ljava/lang/String; = "/data/(?:data|user/[0-9]+)/[^/]+/files/usr"

.field public static final ASSET_BOOTSTRAP:Ljava/lang/String; = "env/bootstrap/bootstrap.tar.gz"

.field public static final ASSET_BOOTSTRAP_PLAIN:Ljava/lang/String; = "env/bootstrap/bootstrap.tar"

.field public static final ASSET_BUS:Ljava/lang/String; = "bus"

.field public static final ASSET_MANIFEST:Ljava/lang/String; = "env/manifest.json"

.field public static final ASSET_OVERLAY:Ljava/lang/String; = "env/overlay"

.field public static final ASSET_PKG:Ljava/lang/String; = "env/pkg"

.field public static final BASH_REL:Ljava/lang/String; = "bin/bash"

.field public static final CHMOD:Ljava/lang/String; = "/system/bin/chmod"

.field public static final ENV_SHEBANG:Ljava/util/regex/Pattern;

.field public static final ENV_SHEBANG_LINES:Ljava/util/regex/Pattern;

.field public static final FIX_PATHS_REL:Ljava/lang/String; = "bin/agy-fix-paths"

.field public static final MARKER:Ljava/lang/String; = ".installed"

.field public static final PREFIX_DIR:Ljava/lang/String; = "usr"

.field public static final PREFIX_MARKER:Ljava/lang/String; = "/data/"

.field public static final SCRIPT_DIRS:[Ljava/lang/String;

.field public static final TAR:Ljava/lang/String; = "/system/bin/tar"

.field public static final TERMUX_ANY_PREFIX:Ljava/util/regex/Pattern;

.field public static final TERMUX_PREFIX:Ljava/lang/String; = "/data/data/com.termux/files/usr"

.field public static final TERMUX_SHEBANG:Ljava/util/regex/Pattern;

.field public static final TERMUX_SHEBANG_LINES:Ljava/util/regex/Pattern;

.field public static final TOYBOX:Ljava/lang/String; = "/system/bin/toybox"

.field public static final USER_DATA_DIR:Ljava/lang/String; = ".gemini"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 32
    nop

    .line 33
    const-string v0, "^#!(/data/(?:data|user/[0-9]+)/[^/]+/files/usr)(.*)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/agy/install/EnvPaths;->TERMUX_SHEBANG:Ljava/util/regex/Pattern;

    .line 35
    nop

    .line 36
    const-string v0, "(?m)^#!(/data/(?:data|user/[0-9]+)/[^/]+/files/usr)([^\\n]*)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/agy/install/EnvPaths;->TERMUX_SHEBANG_LINES:Ljava/util/regex/Pattern;

    .line 38
    nop

    .line 39
    const-string v0, "^#![ \\t]*/usr/bin/env[ \\t]+([^ \\t\\r\\n]+)(.*)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/agy/install/EnvPaths;->ENV_SHEBANG:Ljava/util/regex/Pattern;

    .line 40
    nop

    .line 41
    const-string v0, "(?m)^#![ \\t]*/usr/bin/env[ \\t]+([^ \\t\\r\\n]+)([^\\n]*)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/agy/install/EnvPaths;->ENV_SHEBANG_LINES:Ljava/util/regex/Pattern;

    .line 43
    nop

    .line 44
    const-string v0, "/data/(?:data|user/[0-9]+)/[^/]+/files/usr(?=/|$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/agy/install/EnvPaths;->TERMUX_ANY_PREFIX:Ljava/util/regex/Pattern;

    .line 50
    const-string v0, "share"

    const-string v1, "var"

    const-string v2, "bin"

    const-string v3, "libexec"

    const-string v4, "etc"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/agy/install/EnvPaths;->SCRIPT_DIRS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method public static prefix(Landroid/content/Context;)Ljava/io/File;
    .locals 2

    .line 57
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "usr"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method
