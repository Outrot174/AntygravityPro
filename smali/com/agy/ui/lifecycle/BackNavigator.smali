.class public final Lcom/agy/ui/lifecycle/BackNavigator;
.super Ljava/lang/Object;
.source "BackNavigator.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method

.method public static handle(Landroid/webkit/WebView;)Z
    .locals 1

    .line 13
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 14
    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    .line 15
    const/4 p0, 0x1

    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    return p0
.end method
