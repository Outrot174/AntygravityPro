.class Lcom/agy/theme/ThemeController$2;
.super Ljava/lang/Object;
.source "ThemeController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/theme/ThemeController;->onVisualThemeChanged(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/agy/theme/ThemeController;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$dark:Z


# direct methods
.method constructor <init>(Lcom/agy/theme/ThemeController;Landroid/app/Activity;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 89
    iput-object p1, p0, Lcom/agy/theme/ThemeController$2;->this$0:Lcom/agy/theme/ThemeController;

    iput-object p2, p0, Lcom/agy/theme/ThemeController$2;->val$activity:Landroid/app/Activity;

    iput-boolean p3, p0, Lcom/agy/theme/ThemeController$2;->val$dark:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 92
    iget-object v0, p0, Lcom/agy/theme/ThemeController$2;->val$activity:Landroid/app/Activity;

    iget-boolean v1, p0, Lcom/agy/theme/ThemeController$2;->val$dark:Z

    invoke-static {v0, v1}, Lcom/agy/theme/ActivityPainter;->apply(Landroid/app/Activity;Z)V

    .line 93
    return-void
.end method
