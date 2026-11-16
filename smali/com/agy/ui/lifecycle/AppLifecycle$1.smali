.class Lcom/agy/ui/lifecycle/AppLifecycle$1;
.super Ljava/lang/Object;
.source "AppLifecycle.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/lifecycle/AppLifecycle;->trimMemory(ILandroid/os/Handler;Lcom/agy/ui/webview/WebViewHost;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$host:Lcom/agy/ui/webview/WebViewHost;


# direct methods
.method constructor <init>(Lcom/agy/ui/webview/WebViewHost;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 26
    iput-object p1, p0, Lcom/agy/ui/lifecycle/AppLifecycle$1;->val$host:Lcom/agy/ui/webview/WebViewHost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/agy/ui/lifecycle/AppLifecycle$1;->val$host:Lcom/agy/ui/webview/WebViewHost;

    invoke-virtual {v0}, Lcom/agy/ui/webview/WebViewHost;->freeMemory()V

    .line 30
    return-void
.end method
