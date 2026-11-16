.class public final Lcom/agy/ui/webview/WebViewLifecycle;
.super Ljava/lang/Object;
.source "WebViewLifecycle.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "WebViewHost"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method public static freeMemory(Landroid/webkit/WebView;)V
    .locals 2

    .line 44
    if-nez p0, :cond_0

    .line 45
    return-void

    .line 48
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/webkit/WebView;->freeMemory()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    goto :goto_0

    .line 49
    :catch_0
    move-exception p0

    .line 50
    const-string v0, "WebViewHost"

    const-string v1, "freeMemory failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    :goto_0
    return-void
.end method

.method public static pause(Landroid/webkit/WebView;)V
    .locals 2

    .line 32
    if-nez p0, :cond_0

    .line 33
    return-void

    .line 36
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/webkit/WebView;->onPause()V

    .line 37
    invoke-virtual {p0}, Landroid/webkit/WebView;->pauseTimers()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    goto :goto_0

    .line 38
    :catch_0
    move-exception p0

    .line 39
    const-string v0, "WebViewHost"

    const-string v1, "failed to pause webView"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    :goto_0
    return-void
.end method

.method public static resume(Landroid/webkit/WebView;)V
    .locals 2

    .line 16
    if-nez p0, :cond_0

    .line 17
    return-void

    .line 20
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/webkit/WebView;->onResume()V

    .line 21
    invoke-virtual {p0}, Landroid/webkit/WebView;->resumeTimers()V

    .line 22
    const-string v0, "(function(){ try { window.dispatchEvent(new CustomEvent(\'agy:host-resume\')); } catch(e){} })();"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    goto :goto_0

    .line 25
    :catch_0
    move-exception p0

    .line 26
    const-string v0, "WebViewHost"

    const-string v1, "failed to resume webView"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 28
    :goto_0
    return-void
.end method
