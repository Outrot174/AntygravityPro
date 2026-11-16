.class public final Lcom/agy/theme/WebViewPainter;
.super Ljava/lang/Object;
.source "WebViewPainter.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method

.method public static apply(Landroid/webkit/WebView;I)V
    .locals 0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 15
    :cond_0
    return-void
.end method
