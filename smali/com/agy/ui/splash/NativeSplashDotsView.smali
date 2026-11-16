.class public Lcom/agy/ui/splash/NativeSplashDotsView;
.super Landroid/view/View;
.source "NativeSplashDotsView.java"


# instance fields
.field private entranceAlpha:F

.field private entranceAnimator:Landroid/animation/ValueAnimator;

.field private isDark:Z

.field private logoBitmap:Landroid/graphics/Bitmap;

.field private final logoPaint:Landroid/graphics/Paint;

.field private logoSizePx:F

.field private pulseAlpha:F

.field private pulseAnimator:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 35
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 24
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoPaint:Landroid/graphics/Paint;

    .line 30
    const/4 p1, 0x0

    iput p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAlpha:F

    .line 31
    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAlpha:F

    .line 32
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->isDark:Z

    .line 36
    invoke-direct {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->init()V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoPaint:Landroid/graphics/Paint;

    .line 30
    const/4 p1, 0x0

    iput p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAlpha:F

    .line 31
    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAlpha:F

    .line 32
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->isDark:Z

    .line 41
    invoke-direct {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->init()V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 24
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoPaint:Landroid/graphics/Paint;

    .line 30
    const/4 p1, 0x0

    iput p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAlpha:F

    .line 31
    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAlpha:F

    .line 32
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->isDark:Z

    .line 46
    invoke-direct {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->init()V

    .line 47
    return-void
.end method

.method static synthetic access$002(Lcom/agy/ui/splash/NativeSplashDotsView;F)F
    .locals 0

    .line 22
    iput p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAlpha:F

    return p1
.end method

.method static synthetic access$102(Lcom/agy/ui/splash/NativeSplashDotsView;F)F
    .locals 0

    .line 22
    iput p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAlpha:F

    return p1
.end method

.method private init()V
    .locals 2

    .line 50
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 51
    const/high16 v1, 0x42600000    # 56.0f

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoSizePx:F

    .line 53
    invoke-direct {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->updateTint()V

    .line 56
    :try_start_0
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020005

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoBitmap:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    goto :goto_0

    .line 57
    :catchall_0
    move-exception v0

    .line 59
    :goto_0
    return-void
.end method

.method private updateTint()V
    .locals 4

    .line 76
    iget-boolean v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->isDark:Z

    if-eqz v0, :cond_0

    const v0, -0x655f5a

    goto :goto_0

    :cond_0
    const v0, -0xa09c98

    .line 77
    :goto_0
    iget-object v1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoPaint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/PorterDuffColorFilter;

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v0, v3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 78
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .line 126
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 127
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 128
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->startAnimation()V

    .line 130
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 134
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 135
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->stopAnimation()V

    .line 136
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 159
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 160
    iget-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 165
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    .line 167
    iget v3, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoSizePx:F

    div-float v4, v3, v1

    sub-float/2addr v0, v4

    .line 168
    div-float/2addr v3, v1

    sub-float/2addr v2, v3

    .line 169
    new-instance v1, Landroid/graphics/RectF;

    iget v3, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoSizePx:F

    add-float v4, v0, v3

    add-float/2addr v3, v2

    invoke-direct {v1, v0, v2, v4, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 171
    iget v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAlpha:F

    iget v2, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAlpha:F

    mul-float/2addr v0, v2

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/4 v2, 0x0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 172
    iget-object v2, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoPaint:Landroid/graphics/Paint;

    const/high16 v3, 0x437f0000    # 255.0f

    mul-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 174
    iget-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoBitmap:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 175
    return-void

    .line 161
    :cond_1
    :goto_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    .line 150
    iget v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->logoSizePx:F

    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->getPaddingRight()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v0, v1

    .line 151
    float-to-double v0, v0

    .line 152
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-static {v2, p1}, Lcom/agy/ui/splash/NativeSplashDotsView;->resolveSize(II)I

    move-result p1

    .line 153
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    invoke-static {v0, p2}, Lcom/agy/ui/splash/NativeSplashDotsView;->resolveSize(II)I

    move-result p2

    .line 151
    invoke-virtual {p0, p1, p2}, Lcom/agy/ui/splash/NativeSplashDotsView;->setMeasuredDimension(II)V

    .line 155
    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 0

    .line 140
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 141
    if-nez p2, :cond_0

    .line 142
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->startAnimation()V

    goto :goto_0

    .line 144
    :cond_0
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->stopAnimation()V

    .line 146
    :goto_0
    return-void
.end method

.method public setDark(Z)V
    .locals 0

    .line 69
    iput-boolean p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->isDark:Z

    .line 70
    invoke-direct {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->updateTint()V

    .line 71
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->invalidate()V

    .line 72
    return-void
.end method

.method public setDotColor(I)V
    .locals 1

    .line 63
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->isDark:Z

    .line 64
    invoke-direct {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->updateTint()V

    .line 65
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->invalidate()V

    .line 66
    return-void
.end method

.method public startAnimation()V
    .locals 4

    .line 81
    invoke-virtual {p0}, Lcom/agy/ui/splash/NativeSplashDotsView;->stopAnimation()V

    .line 84
    const/4 v0, 0x2

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAnimator:Landroid/animation/ValueAnimator;

    .line 85
    const-wide/16 v2, 0x258

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 86
    iget-object v1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 87
    iget-object v1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/agy/ui/splash/NativeSplashDotsView$1;

    invoke-direct {v2, p0}, Lcom/agy/ui/splash/NativeSplashDotsView$1;-><init>(Lcom/agy/ui/splash/NativeSplashDotsView;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 96
    new-array v1, v0, [F

    fill-array-data v1, :array_1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAnimator:Landroid/animation/ValueAnimator;

    .line 97
    const-wide/16 v2, 0x960

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 98
    iget-object v1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAnimator:Landroid/animation/ValueAnimator;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 99
    iget-object v1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 100
    iget-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 101
    iget-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/agy/ui/splash/NativeSplashDotsView$2;

    invoke-direct {v1, p0}, Lcom/agy/ui/splash/NativeSplashDotsView$2;-><init>(Lcom/agy/ui/splash/NativeSplashDotsView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 109
    iget-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 110
    iget-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 111
    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3e800000    # 0.25f
        0x3f666666    # 0.9f
    .end array-data
.end method

.method public stopAnimation()V
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 115
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 116
    iput-object v1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->entranceAnimator:Landroid/animation/ValueAnimator;

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_1

    .line 119
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 120
    iput-object v1, p0, Lcom/agy/ui/splash/NativeSplashDotsView;->pulseAnimator:Landroid/animation/ValueAnimator;

    .line 122
    :cond_1
    return-void
.end method
