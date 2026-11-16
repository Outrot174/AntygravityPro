.class Lcom/agy/ui/splash/NativeSplashDotsView$2;
.super Ljava/lang/Object;
.source "NativeSplashDotsView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/ui/splash/NativeSplashDotsView;->startAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/ui/splash/NativeSplashDotsView;


# direct methods
.method constructor <init>(Lcom/agy/ui/splash/NativeSplashDotsView;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView$2;->this$0:Lcom/agy/ui/splash/NativeSplashDotsView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView$2;->this$0:Lcom/agy/ui/splash/NativeSplashDotsView;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {v0, p1}, Lcom/agy/ui/splash/NativeSplashDotsView;->access$102(Lcom/agy/ui/splash/NativeSplashDotsView;F)F

    .line 105
    iget-object p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView$2;->this$0:Lcom/agy/ui/splash/NativeSplashDotsView;

    invoke-virtual {p1}, Lcom/agy/ui/splash/NativeSplashDotsView;->invalidate()V

    .line 106
    return-void
.end method
