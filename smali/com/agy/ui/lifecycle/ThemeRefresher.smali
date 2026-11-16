.class public final Lcom/agy/ui/lifecycle/ThemeRefresher;
.super Ljava/lang/Object;
.source "ThemeRefresher.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public static refresh(Landroid/app/Activity;Lcom/agy/theme/ThemeManager;Landroid/view/View;Lcom/agy/ui/splash/SplashController;Lcom/agy/ui/webview/WebViewHost;)V
    .locals 0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    invoke-virtual {p1, p0}, Lcom/agy/theme/ThemeManager;->updateContext(Landroid/content/Context;)V

    .line 20
    invoke-virtual {p1, p0}, Lcom/agy/theme/ThemeManager;->applyToActivity(Landroid/app/Activity;)V

    .line 22
    :cond_0
    if-eqz p2, :cond_2

    .line 23
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/agy/theme/ThemeManager;->getBackgroundColor()I

    move-result p0

    goto :goto_0

    :cond_1
    const p0, -0xefeff0

    :goto_0
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 25
    :cond_2
    if-eqz p3, :cond_3

    .line 26
    invoke-virtual {p3}, Lcom/agy/ui/splash/SplashController;->refresh()V

    .line 28
    :cond_3
    if-eqz p4, :cond_4

    if-eqz p1, :cond_4

    .line 29
    invoke-virtual {p4}, Lcom/agy/ui/webview/WebViewHost;->getWebView()Landroid/webkit/WebView;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/agy/theme/ThemeManager;->applyToWebView(Landroid/webkit/WebView;)V

    .line 31
    :cond_4
    return-void
.end method
