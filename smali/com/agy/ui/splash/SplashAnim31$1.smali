.class Lcom/agy/ui/splash/SplashAnim31$1;
.super Ljava/lang/Object;
.source "SplashAnim31.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/splash/SplashAnim31;->install(Landroid/app/Activity;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dotSplash:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    iput-object p1, p0, Lcom/agy/ui/splash/SplashAnim31$1;->val$dotSplash:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 37
    const-string p1, "onSplashScreenExit"

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    if-eqz p3, :cond_0

    array-length p1, p3

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 39
    const/4 p1, 0x0

    aget-object p1, p3, p1

    iget-object p2, p0, Lcom/agy/ui/splash/SplashAnim31$1;->val$dotSplash:Landroid/view/View;

    invoke-static {p1, p2}, Lcom/agy/ui/splash/SplashAnim31;->access$000(Ljava/lang/Object;Landroid/view/View;)V

    .line 41
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
