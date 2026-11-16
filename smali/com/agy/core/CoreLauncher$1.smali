.class Lcom/agy/core/CoreLauncher$1;
.super Ljava/lang/Object;
.source "CoreLauncher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/agy/core/CoreLauncher;->launch(Lcom/agy/runtime/RuntimeManager;Ljava/io/File;)Ljava/lang/Process;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$runtime:Lcom/agy/runtime/RuntimeManager;


# direct methods
.method constructor <init>(Lcom/agy/runtime/RuntimeManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 75
    iput-object p1, p0, Lcom/agy/core/CoreLauncher$1;->val$runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/agy/core/CoreLauncher$1;->val$runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v0}, Lcom/agy/runtime/RuntimeManager;->installEnvInBackground()V

    .line 79
    return-void
.end method
