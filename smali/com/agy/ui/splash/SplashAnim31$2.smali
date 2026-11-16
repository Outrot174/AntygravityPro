.class Lcom/agy/ui/splash/SplashAnim31$2;
.super Ljava/lang/Object;
.source "SplashAnim31.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/splash/SplashAnim31;->animateExit(Ljava/lang/Object;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$provider:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 67
    iput-object p1, p0, Lcom/agy/ui/splash/SplashAnim31$2;->val$provider:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/agy/ui/splash/SplashAnim31$2;->val$provider:Ljava/lang/Object;

    const-string v1, "remove"

    invoke-static {v0, v1}, Lcom/agy/ui/splash/SplashAnim31;->access$100(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    return-void
.end method
