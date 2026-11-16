.class public final Lcom/agy/ui/lifecycle/AppLifecycle;
.super Ljava/lang/Object;
.source "AppLifecycle.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public static destroy(Landroid/os/Handler;)V
    .locals 1

    .line 36
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 37
    return-void
.end method

.method public static pause(Landroid/webkit/WebView;)V
    .locals 0

    .line 21
    invoke-static {p0}, Lcom/agy/ui/webview/WebViewLifecycle;->pause(Landroid/webkit/WebView;)V

    .line 22
    return-void
.end method

.method public static resume(Landroid/webkit/WebView;)V
    .locals 0

    .line 17
    invoke-static {p0}, Lcom/agy/ui/webview/WebViewLifecycle;->resume(Landroid/webkit/WebView;)V

    .line 18
    return-void
.end method

.method public static trimMemory(ILandroid/os/Handler;Lcom/agy/ui/webview/WebViewHost;)V
    .locals 1

    .line 25
    const/16 v0, 0x3c

    if-lt p0, v0, :cond_0

    if-eqz p2, :cond_0

    .line 26
    new-instance p0, Lcom/agy/ui/lifecycle/AppLifecycle$1;

    invoke-direct {p0, p2}, Lcom/agy/ui/lifecycle/AppLifecycle$1;-><init>(Lcom/agy/ui/webview/WebViewHost;)V

    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 33
    :cond_0
    return-void
.end method
