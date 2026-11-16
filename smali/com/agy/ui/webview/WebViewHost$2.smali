.class Lcom/agy/ui/webview/WebViewHost$2;
.super Ljava/lang/Object;
.source "WebViewHost.java"

# interfaces
.implements Landroid/webkit/DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/webview/WebViewHost;-><init>(Landroid/content/Context;Lcom/agy/theme/ThemeManager;Lcom/agy/oauth/OAuthManager;Lcom/agy/bridge/AndroidBridge;Lcom/agy/ui/webview/AgyWebChromeClient$FileChooserCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/ui/webview/WebViewHost;


# direct methods
.method constructor <init>(Lcom/agy/ui/webview/WebViewHost;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/agy/ui/webview/WebViewHost$2;->this$0:Lcom/agy/ui/webview/WebViewHost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 9

    .line 53
    sget-object v0, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    if-eqz v0, :cond_0

    .line 54
    sget-object v1, Lcom/agy/ui/MainActivity;->activeActivity:Lcom/agy/ui/MainActivity;

    iget-object v0, p0, Lcom/agy/ui/webview/WebViewHost$2;->this$0:Lcom/agy/ui/webview/WebViewHost;

    .line 55
    invoke-static {v0}, Lcom/agy/ui/webview/WebViewHost;->access$100(Lcom/agy/ui/webview/WebViewHost;)Landroid/webkit/WebView;

    move-result-object v2

    .line 54
    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-wide v7, p5

    invoke-static/range {v1 .. v8}, Lcom/agy/ui/download/FileDownloader;->handleDownload(Landroid/app/Activity;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 58
    :cond_0
    return-void
.end method
