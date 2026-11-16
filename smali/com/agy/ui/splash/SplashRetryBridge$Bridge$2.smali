.class Lcom/agy/ui/splash/SplashRetryBridge$Bridge$2;
.super Ljava/lang/Object;
.source "SplashRetryBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/splash/SplashRetryBridge$Bridge;->copyLogs()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/ui/splash/SplashRetryBridge$Bridge;


# direct methods
.method constructor <init>(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)V
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$2;->this$0:Lcom/agy/ui/splash/SplashRetryBridge$Bridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/agy/ui/splash/SplashRetryBridge$Bridge$2;->this$0:Lcom/agy/ui/splash/SplashRetryBridge$Bridge;

    invoke-static {v0}, Lcom/agy/ui/splash/SplashRetryBridge$Bridge;->access$200(Lcom/agy/ui/splash/SplashRetryBridge$Bridge;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/agy/ui/splash/LogExporter;->copyToClipboard(Landroid/content/Context;)V

    .line 60
    return-void
.end method
