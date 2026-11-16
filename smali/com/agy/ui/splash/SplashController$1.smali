.class Lcom/agy/ui/splash/SplashController$1;
.super Ljava/lang/Object;
.source "SplashController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/splash/SplashController;->dismiss()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/ui/splash/SplashController;


# direct methods
.method constructor <init>(Lcom/agy/ui/splash/SplashController;)V
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/agy/ui/splash/SplashController$1;->this$0:Lcom/agy/ui/splash/SplashController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 129
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController$1;->this$0:Lcom/agy/ui/splash/SplashController;

    invoke-static {v0}, Lcom/agy/ui/splash/SplashController;->access$000(Lcom/agy/ui/splash/SplashController;)Landroid/webkit/WebView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 131
    :try_start_0
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController$1;->this$0:Lcom/agy/ui/splash/SplashController;

    invoke-static {v0}, Lcom/agy/ui/splash/SplashController;->access$000(Lcom/agy/ui/splash/SplashController;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 132
    iget-object v0, p0, Lcom/agy/ui/splash/SplashController$1;->this$0:Lcom/agy/ui/splash/SplashController;

    invoke-static {v0}, Lcom/agy/ui/splash/SplashController;->access$000(Lcom/agy/ui/splash/SplashController;)Landroid/webkit/WebView;

    move-result-object v0

    const-string v1, "about:blank"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    goto :goto_0

    .line 133
    :catch_0
    move-exception v0

    .line 135
    :goto_0
    return-void
.end method
