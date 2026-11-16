.class public final Lcom/agy/core/OpenUrlWatcher;
.super Ljava/lang/Object;
.source "OpenUrlWatcher.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "OpenUrlWatcher"

.field private static final URL_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final appContext:Landroid/content/Context;

.field private volatile lastDispatchedTime:J

.field private volatile lastDispatchedUrl:Ljava/lang/String;

.field private final mainHandler:Landroid/os/Handler;

.field private final oauth:Lcom/agy/oauth/OAuthManager;

.field private final openUrlReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    nop

    .line 27
    const-string v0, "https?://[\\w\\-\\.\\~:\\?\\#\\[\\]\\@\\!\\$\\&\\\'\\(\\)\\*\\+,;=%/]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/agy/core/OpenUrlWatcher;->URL_PATTERN:Ljava/util/regex/Pattern;

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/agy/oauth/OAuthManager;

    invoke-direct {v0}, Lcom/agy/oauth/OAuthManager;-><init>()V

    iput-object v0, p0, Lcom/agy/core/OpenUrlWatcher;->oauth:Lcom/agy/oauth/OAuthManager;

    .line 31
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/agy/core/OpenUrlWatcher;->mainHandler:Landroid/os/Handler;

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lcom/agy/core/OpenUrlWatcher;->lastDispatchedUrl:Ljava/lang/String;

    .line 34
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/agy/core/OpenUrlWatcher;->lastDispatchedTime:J

    .line 36
    new-instance v0, Lcom/agy/core/OpenUrlWatcher$1;

    invoke-direct {v0, p0}, Lcom/agy/core/OpenUrlWatcher$1;-><init>(Lcom/agy/core/OpenUrlWatcher;)V

    iput-object v0, p0, Lcom/agy/core/OpenUrlWatcher;->openUrlReceiver:Landroid/content/BroadcastReceiver;

    .line 50
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/agy/core/OpenUrlWatcher;->appContext:Landroid/content/Context;

    .line 51
    return-void
.end method

.method static synthetic access$000(Lcom/agy/core/OpenUrlWatcher;)Landroid/content/Context;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/agy/core/OpenUrlWatcher;->appContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lcom/agy/core/OpenUrlWatcher;)Lcom/agy/oauth/OAuthManager;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/agy/core/OpenUrlWatcher;->oauth:Lcom/agy/oauth/OAuthManager;

    return-object p0
.end method

.method private openUrl(Ljava/lang/String;)V
    .locals 2

    .line 140
    iget-object v0, p0, Lcom/agy/core/OpenUrlWatcher;->mainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/agy/core/OpenUrlWatcher$2;

    invoke-direct {v1, p0, p1}, Lcom/agy/core/OpenUrlWatcher$2;-><init>(Lcom/agy/core/OpenUrlWatcher;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 153
    return-void
.end method


# virtual methods
.method public dispatchIfValid(Ljava/lang/String;)V
    .locals 6

    .line 118
    if-nez p1, :cond_0

    return-void

    .line 119
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 120
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 123
    :cond_1
    const-string v0, "googleapis.com/oauth2/v2/userinfo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 124
    const-string v0, "googleapis.com/auth"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 125
    const-string v0, "daily-cloudcode-pa.googleapis.com"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 129
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 130
    iget-object v2, p0, Lcom/agy/core/OpenUrlWatcher;->lastDispatchedUrl:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/agy/core/OpenUrlWatcher;->lastDispatchedTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x5dc

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    .line 131
    return-void

    .line 133
    :cond_3
    iput-object p1, p0, Lcom/agy/core/OpenUrlWatcher;->lastDispatchedUrl:Ljava/lang/String;

    .line 134
    iput-wide v0, p0, Lcom/agy/core/OpenUrlWatcher;->lastDispatchedTime:J

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "dispatching external URL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OpenUrlWatcher"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    invoke-direct {p0, p1}, Lcom/agy/core/OpenUrlWatcher;->openUrl(Ljava/lang/String;)V

    .line 137
    return-void

    .line 126
    :cond_4
    :goto_0
    return-void

    .line 120
    :cond_5
    :goto_1
    return-void
.end method

.method public handleStreamLine(Ljava/lang/String;)V
    .locals 5

    .line 81
    if-nez p1, :cond_0

    .line 82
    return-void

    .line 84
    :cond_0
    const-string v0, "ANTIGRAVITY_OPEN_URL:"

    const-string v1, "ANTIGRAVITY_OPEN_URL="

    const-string v2, "AGY_OPEN_URL="

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_2

    aget-object v2, v0, v1

    .line 85
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 86
    if-ltz v3, :cond_1

    .line 87
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v3, v0

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 88
    invoke-virtual {p0, p1}, Lcom/agy/core/OpenUrlWatcher;->dispatchIfValid(Ljava/lang/String;)V

    .line 89
    return-void

    .line 84
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 93
    :cond_2
    const-string v0, "accounts.google.com"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, "/auth/callback"

    if-nez v1, :cond_3

    .line 94
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    const-string v1, "http"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 95
    :cond_3
    sget-object v1, Lcom/agy/core/OpenUrlWatcher;->URL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 96
    :cond_4
    :goto_1
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 97
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    .line 98
    const-string v3, "http://"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "https://"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 100
    :cond_5
    const-string v3, "googleapis.com/oauth2/v2/userinfo"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 101
    const-string v3, "googleapis.com/auth"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 102
    const-string v3, "daily-cloudcode-pa.googleapis.com"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 103
    goto :goto_1

    .line 105
    :cond_6
    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 106
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 107
    const-string v3, "antigravity.google/auth"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 108
    :cond_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "stream regex detected auth URL: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 109
    invoke-static {v1}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 108
    const-string v4, "OpenUrlWatcher"

    invoke-static {v4, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    invoke-virtual {p0, v1}, Lcom/agy/core/OpenUrlWatcher;->dispatchIfValid(Ljava/lang/String;)V

    .line 113
    :cond_8
    goto :goto_1

    .line 115
    :cond_9
    return-void
.end method

.method public start()V
    .locals 7

    .line 55
    const-string v0, "OpenUrlWatcher"

    :try_start_0
    new-instance v3, Landroid/content/IntentFilter;

    const-string v1, "com.agy.ACTION_OPEN_URL"

    invoke-direct {v3, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/agy/core/OpenUrlWatcher;->appContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".permission.INTERNAL_BROADCAST"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 60
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_0

    .line 61
    iget-object v1, p0, Lcom/agy/core/OpenUrlWatcher;->appContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/agy/core/OpenUrlWatcher;->openUrlReceiver:Landroid/content/BroadcastReceiver;

    const/4 v5, 0x0

    const/4 v6, 0x4

    invoke-virtual/range {v1 .. v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    goto :goto_0

    .line 64
    :cond_0
    iget-object v1, p0, Lcom/agy/core/OpenUrlWatcher;->appContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/agy/core/OpenUrlWatcher;->openUrlReceiver:Landroid/content/BroadcastReceiver;

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 66
    :goto_0
    const-string v1, "registered protected ACTION_OPEN_URL receiver"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    goto :goto_1

    .line 67
    :catchall_0
    move-exception v1

    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "failed to register ACTION_OPEN_URL receiver: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    :goto_1
    return-void
.end method

.method public stop()V
    .locals 2

    .line 74
    :try_start_0
    iget-object v0, p0, Lcom/agy/core/OpenUrlWatcher;->appContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/agy/core/OpenUrlWatcher;->openUrlReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    goto :goto_0

    .line 75
    :catchall_0
    move-exception v0

    .line 77
    :goto_0
    return-void
.end method
