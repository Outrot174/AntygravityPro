.class public final Lcom/agy/oauth/OAuthManager;
.super Ljava/lang/Object;
.source "OAuthManager.java"


# instance fields
.field private final launcher:Lcom/agy/oauth/CustomTabLauncher;

.field private final matcher:Lcom/agy/oauth/AuthUrlMatcher;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/agy/oauth/AuthUrlMatcher;

    invoke-direct {v0}, Lcom/agy/oauth/AuthUrlMatcher;-><init>()V

    iput-object v0, p0, Lcom/agy/oauth/OAuthManager;->matcher:Lcom/agy/oauth/AuthUrlMatcher;

    .line 19
    new-instance v0, Lcom/agy/oauth/CustomTabLauncher;

    invoke-direct {v0}, Lcom/agy/oauth/CustomTabLauncher;-><init>()V

    iput-object v0, p0, Lcom/agy/oauth/OAuthManager;->launcher:Lcom/agy/oauth/CustomTabLauncher;

    return-void
.end method

.method public static getCallbackScheme(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 57
    invoke-static {p0}, Lcom/agy/oauth/DeepLinkHandler;->getCallbackScheme(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static hasToken(Landroid/content/Context;)Z
    .locals 0

    .line 27
    invoke-static {p0}, Lcom/agy/oauth/OAuthTokenStore;->hasToken(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static tokenFile(Landroid/content/Context;)Ljava/io/File;
    .locals 0

    .line 23
    invoke-static {p0}, Lcom/agy/oauth/OAuthTokenStore;->tokenFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public handleDeepLink(Landroid/app/Activity;Landroid/content/Intent;Ljava/lang/Runnable;)Z
    .locals 0

    .line 61
    invoke-static {p1, p2, p3}, Lcom/agy/oauth/DeepLinkHandler;->handleDeepLink(Landroid/app/Activity;Landroid/content/Intent;Ljava/lang/Runnable;)Z

    move-result p1

    return p1
.end method

.method public intercept(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    .line 40
    iget-object v0, p0, Lcom/agy/oauth/OAuthManager;->matcher:Lcom/agy/oauth/AuthUrlMatcher;

    invoke-virtual {v0, p2}, Lcom/agy/oauth/AuthUrlMatcher;->isAuthUrl(Ljava/lang/String;)Z

    move-result v0

    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "intercept isAuthUrl="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " url="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 42
    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 41
    const-string v2, "OAuthManager"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    if-nez v0, :cond_0

    .line 44
    const/4 p1, 0x0

    return p1

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isAuthUrl matched -> external browser: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 47
    invoke-static {p2}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 46
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    iget-object v0, p0, Lcom/agy/oauth/OAuthManager;->launcher:Lcom/agy/oauth/CustomTabLauncher;

    invoke-virtual {v0, p1, p2}, Lcom/agy/oauth/CustomTabLauncher;->openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public isAuthUrl(Ljava/lang/String;)Z
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/agy/oauth/OAuthManager;->matcher:Lcom/agy/oauth/AuthUrlMatcher;

    invoke-virtual {v0, p1}, Lcom/agy/oauth/AuthUrlMatcher;->isAuthUrl(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/agy/oauth/OAuthManager;->launcher:Lcom/agy/oauth/CustomTabLauncher;

    invoke-virtual {v0, p1, p2}, Lcom/agy/oauth/CustomTabLauncher;->openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
