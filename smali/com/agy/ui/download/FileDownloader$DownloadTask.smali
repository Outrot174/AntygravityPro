.class public Lcom/agy/ui/download/FileDownloader$DownloadTask;
.super Ljava/lang/Object;
.source "FileDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/agy/ui/download/FileDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DownloadTask"
.end annotation


# instance fields
.field public final base64Data:Ljava/lang/String;

.field public final contentDisposition:Ljava/lang/String;

.field public final contentLength:J

.field public final mimeType:Ljava/lang/String;

.field public final url:Ljava/lang/String;

.field public final userAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/agy/ui/download/FileDownloader$DownloadTask;->url:Ljava/lang/String;

    .line 56
    iput-object p2, p0, Lcom/agy/ui/download/FileDownloader$DownloadTask;->userAgent:Ljava/lang/String;

    .line 57
    iput-object p3, p0, Lcom/agy/ui/download/FileDownloader$DownloadTask;->contentDisposition:Ljava/lang/String;

    .line 58
    iput-object p4, p0, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    .line 59
    iput-wide p5, p0, Lcom/agy/ui/download/FileDownloader$DownloadTask;->contentLength:J

    .line 60
    iput-object p7, p0, Lcom/agy/ui/download/FileDownloader$DownloadTask;->base64Data:Ljava/lang/String;

    .line 61
    return-void
.end method
