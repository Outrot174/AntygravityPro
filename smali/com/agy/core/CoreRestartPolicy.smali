.class public final Lcom/agy/core/CoreRestartPolicy;
.super Ljava/lang/Object;
.source "CoreRestartPolicy.java"


# static fields
.field public static final MAX_RESTARTS:I = 0x3

.field public static final RESTART_BASE_MS:J = 0x3e8L

.field public static final RESTART_MAX_MS:J = 0x7530L

.field public static final SUSTAINED_READY_MS:J = 0xea60L


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method

.method public static delayFor(I)J
    .locals 4

    .line 16
    add-int/lit8 p0, p0, -0x1

    const/4 v0, 0x5

    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result p0

    .line 17
    const-wide/16 v0, 0x3e8

    shl-long/2addr v0, p0

    const-wide/16 v2, 0x7530

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    return-wide v0
.end method
