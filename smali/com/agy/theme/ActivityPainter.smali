.class public final Lcom/agy/theme/ActivityPainter;
.super Ljava/lang/Object;
.source "ActivityPainter.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public static apply(Landroid/app/Activity;Z)V
    .locals 2

    .line 17
    if-nez p0, :cond_0

    .line 18
    return-void

    .line 20
    :cond_0
    if-eqz p1, :cond_1

    const v0, -0xefeff0

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    .line 21
    :goto_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 22
    if-nez p0, :cond_2

    .line 23
    return-void

    .line 25
    :cond_2
    const/high16 v1, -0x80000000

    invoke-virtual {p0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 26
    invoke-virtual {p0, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 27
    invoke-virtual {p0, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 30
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 31
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 33
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    .line 34
    const/16 v1, 0x1a

    if-eqz p1, :cond_3

    .line 35
    and-int/lit16 p1, v0, -0x2001

    .line 36
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_4

    .line 37
    and-int/lit8 p1, p1, -0x11

    goto :goto_1

    .line 40
    :cond_3
    nop

    .line 41
    or-int/lit16 p1, v0, 0x2000

    .line 43
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_4

    .line 44
    or-int/lit8 p1, p1, 0x10

    .line 47
    :cond_4
    :goto_1
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 48
    return-void
.end method
