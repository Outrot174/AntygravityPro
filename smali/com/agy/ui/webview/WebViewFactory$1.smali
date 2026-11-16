.class Lcom/agy/ui/webview/WebViewFactory$1;
.super Ljava/lang/Object;
.source "WebViewFactory.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/webview/WebViewFactory;->create(Landroid/content/Context;Lcom/agy/bridge/AndroidBridge;Lcom/agy/theme/ThemeManager;)Landroid/webkit/WebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 32
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    if-nez p2, :cond_0

    .line 33
    check-cast p1, Landroid/webkit/WebView;

    const/16 p2, 0x82

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->requestFocus(I)Z

    .line 35
    :cond_0
    const/4 p1, 0x0

    return p1
.end method
