.class public final Lcom/agy/ui/download/FileDownloader;
.super Ljava/lang/Object;
.source "FileDownloader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/agy/ui/download/FileDownloader$DownloadTask;
    }
.end annotation


# static fields
.field private static final MAX_BLOB_BYTES:I = 0x4000000

.field public static final REQUEST_STORAGE_DOWNLOAD:I = 0x7d1

.field private static final TAG:Ljava/lang/String; = "FileDownloader"

.field private static pendingTask:Lcom/agy/ui/download/FileDownloader$DownloadTask;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 39
    invoke-static {p0}, Lcom/agy/ui/download/FileDownloader;->safeFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 39
    invoke-static {p0, p1}, Lcom/agy/ui/download/FileDownloader;->getSafeUniqueFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method private static downloadDirect(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 295
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/agy/ui/download/FileDownloader$2;

    invoke-direct {v1, p1, p2, p3, p0}, Lcom/agy/ui/download/FileDownloader$2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 360
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 361
    return-void
.end method

.method private static executeTask(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/agy/ui/download/FileDownloader$DownloadTask;)V
    .locals 7

    .line 129
    if-eqz p2, :cond_10

    if-nez p0, :cond_0

    goto/16 :goto_5

    .line 134
    :cond_0
    iget-object v0, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->base64Data:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 135
    iget-object p1, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->base64Data:Ljava/lang/String;

    iget-object v0, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->contentDisposition:Ljava/lang/String;

    iget-object p2, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    invoke-static {p0, p1, v0, p2}, Lcom/agy/ui/download/FileDownloader;->saveBase64ToDownloads(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    return-void

    .line 139
    :cond_1
    iget-object v0, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->url:Ljava/lang/String;

    if-eqz v0, :cond_f

    iget-object v0, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_4

    .line 143
    :cond_2
    iget-object v0, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 146
    const-string v1, "blob:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_d

    const-string v1, "data:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto/16 :goto_2

    .line 158
    :cond_3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 159
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 160
    const-string v3, "http"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "FileDownloader"

    if-nez v3, :cond_4

    const-string v3, "https"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 161
    :cond_4
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_c

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_c

    .line 162
    invoke-virtual {p1}, Landroid/net/Uri;->getUserInfo()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    goto/16 :goto_1

    .line 167
    :cond_5
    invoke-static {p0}, Lcom/agy/runtime/RuntimeConfig;->httpsPort(Landroid/content/Context;)I

    move-result v1

    invoke-static {p1, v1}, Lcom/agy/util/TrustedCoreOrigin;->matches(Landroid/net/Uri;I)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 168
    iget-object p1, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->contentDisposition:Ljava/lang/String;

    iget-object p2, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    invoke-static {p0, v0, p1, p2}, Lcom/agy/ui/download/FileDownloader;->downloadDirect(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    return-void

    .line 174
    :cond_6
    :try_start_0
    new-instance v1, Landroid/app/DownloadManager$Request;

    invoke-direct {v1, p1}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 175
    iget-object p1, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    if-eqz p1, :cond_7

    iget-object p1, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_7

    .line 176
    iget-object p1, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    invoke-virtual {v1, p1}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 178
    :cond_7
    iget-object p1, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->contentDisposition:Ljava/lang/String;

    iget-object v3, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    .line 179
    invoke-static {v0, p1, v3}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 178
    invoke-static {p1}, Lcom/agy/ui/download/FileDownloader;->safeFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 180
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 181
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "download_"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {p1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 183
    :cond_8
    invoke-virtual {v1, p1}, Landroid/app/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 184
    const-string v3, "\u0421\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u0435 \u0444\u0430\u0439\u043b\u0430"

    invoke-virtual {v1, v3}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 185
    invoke-virtual {v1}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    .line 186
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 187
    sget-object v3, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v1, v3, p1}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 189
    iget-object v3, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->userAgent:Ljava/lang/String;

    if-eqz v3, :cond_9

    iget-object v3, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->userAgent:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9

    .line 190
    const-string v3, "User-Agent"

    iget-object v5, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->userAgent:Ljava/lang/String;

    invoke-virtual {v1, v3, v5}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 192
    :cond_9
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 193
    if-eqz v3, :cond_a

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_a

    .line 194
    const-string v5, "Cookie"

    invoke-virtual {v1, v5, v3}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 197
    :cond_a
    const-string v3, "download"

    invoke-virtual {p0, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/DownloadManager;

    .line 198
    if-eqz v3, :cond_b

    .line 199
    invoke-virtual {v3, v1}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    .line 200
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0421\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u0435: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 201
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Download enqueued: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " url="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 202
    invoke-static {v0}, Lcom/agy/util/SensitiveDataRedactor;->safeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 201
    invoke-static {v4, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    :cond_b
    goto :goto_0

    .line 204
    :catch_0
    move-exception p1

    .line 205
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DownloadManager failed, falling back to direct download: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    iget-object p1, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->contentDisposition:Ljava/lang/String;

    iget-object p2, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    invoke-static {p0, v0, p1, p2}, Lcom/agy/ui/download/FileDownloader;->downloadDirect(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    :goto_0
    return-void

    .line 163
    :cond_c
    :goto_1
    const-string p1, "refusing non-web or credential-bearing download URL"

    invoke-static {v4, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    const-string p1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0430\u0434\u0440\u0435\u0441 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0438"

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 165
    return-void

    .line 147
    :cond_d
    :goto_2
    if-eqz p1, :cond_e

    .line 148
    iget-object p0, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->contentDisposition:Ljava/lang/String;

    iget-object v1, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    invoke-static {v0, p0, v1}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 149
    iget-object p2, p2, Lcom/agy/ui/download/FileDownloader$DownloadTask;->mimeType:Ljava/lang/String;

    invoke-static {p1, v0, p0, p2}, Lcom/agy/ui/download/FileDownloader;->extractBlobViaJs(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    goto :goto_3

    .line 151
    :cond_e
    const-string p1, "\u041d\u0435\u0432\u043e\u0437\u043c\u043e\u0436\u043d\u043e \u0441\u043a\u0430\u0447\u0430\u0442\u044c blob \u0431\u0435\u0437 WebView"

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 153
    :goto_3
    return-void

    .line 140
    :cond_f
    :goto_4
    return-void

    .line 130
    :cond_10
    :goto_5
    return-void
.end method

.method private static extractBlobViaJs(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function(blobUrl, filename, mimeType) {  try {    var xhr = new XMLHttpRequest();    xhr.open(\'GET\', blobUrl, true);    xhr.responseType = \'blob\';    xhr.onload = function() {      if (xhr.status === 200 || xhr.status === 0) {        var reader = new FileReader();        reader.onloadend = function() {          if (window.Android && window.Android.saveBlob && window.__AG_NATIVE_BRIDGE_TOKEN__) {            window.Android.saveBlob(window.__AG_NATIVE_BRIDGE_TOKEN__, reader.result, filename, mimeType);          }        };        reader.readAsDataURL(xhr.response);      }    };    xhr.send();  } catch(e) {    console.error(\'Failed to extract blob\', e);  }})("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 231
    const-string v1, ""

    if-nez p1, :cond_0

    move-object p1, v1

    :cond_0
    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 232
    if-nez p2, :cond_1

    move-object p2, v1

    :cond_1
    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 233
    if-nez p3, :cond_2

    move-object p3, v1

    :cond_2
    invoke-static {p3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ");"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 234
    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 235
    return-void
.end method

.method private static getSafeUniqueFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 386
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object p0

    .line 387
    invoke-static {p1}, Lcom/agy/ui/download/FileDownloader;->safeFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 388
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 391
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object p1

    .line 392
    invoke-virtual {p1, p0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "download path escaped Downloads directory"

    if-nez v0, :cond_1

    invoke-static {p0, p1}, Lcom/agy/util/PathSafety;->isInside(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 395
    invoke-static {p1}, Lcom/agy/ui/download/FileDownloader;->getUniqueFile(Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    .line 396
    invoke-virtual {p1, p0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0, p1}, Lcom/agy/util/PathSafety;->isInside(Ljava/io/File;Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 399
    return-object p1

    .line 397
    :cond_0
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 393
    :cond_1
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 389
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "invalid download filename"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static getUniqueFile(Ljava/io/File;)Ljava/io/File;
    .locals 7

    .line 403
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 404
    return-object p0

    .line 406
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    .line 407
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 408
    nop

    .line 409
    nop

    .line 410
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 411
    if-lez v2, :cond_1

    .line 412
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 413
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    move-object v1, v3

    goto :goto_0

    .line 411
    :cond_1
    const-string v2, ""

    .line 415
    :goto_0
    const/4 v3, 0x1

    move v4, v3

    .line 416
    :goto_1
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 417
    new-instance p0, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 418
    add-int/2addr v4, v3

    goto :goto_1

    .line 420
    :cond_2
    return-object p0
.end method

.method public static handleBlobData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 120
    new-instance v8, Lcom/agy/ui/download/FileDownloader$DownloadTask;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-wide/16 v5, 0x0

    move-object v0, v8

    move-object v3, p2

    move-object v4, p3

    move-object v7, p1

    invoke-direct/range {v0 .. v7}, Lcom/agy/ui/download/FileDownloader$DownloadTask;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 121
    invoke-static {p0}, Lcom/agy/ui/download/FileDownloader;->hasStoragePermission(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 122
    invoke-static {p0, v8}, Lcom/agy/ui/download/FileDownloader;->requestStoragePermission(Landroid/app/Activity;Lcom/agy/ui/download/FileDownloader$DownloadTask;)V

    goto :goto_0

    .line 124
    :cond_0
    const/4 p1, 0x0

    invoke-static {p0, p1, v8}, Lcom/agy/ui/download/FileDownloader;->executeTask(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/agy/ui/download/FileDownloader$DownloadTask;)V

    .line 126
    :goto_0
    return-void
.end method

.method public static handleDownload(Landroid/app/Activity;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 10

    .line 111
    move-object v0, p0

    new-instance v9, Lcom/agy/ui/download/FileDownloader$DownloadTask;

    const/4 v8, 0x0

    move-object v1, v9

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-wide/from16 v6, p6

    invoke-direct/range {v1 .. v8}, Lcom/agy/ui/download/FileDownloader$DownloadTask;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 112
    invoke-static {p0}, Lcom/agy/ui/download/FileDownloader;->hasStoragePermission(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 113
    invoke-static {p0, v9}, Lcom/agy/ui/download/FileDownloader;->requestStoragePermission(Landroid/app/Activity;Lcom/agy/ui/download/FileDownloader$DownloadTask;)V

    goto :goto_0

    .line 115
    :cond_0
    move-object v1, p1

    invoke-static {p0, p1, v9}, Lcom/agy/ui/download/FileDownloader;->executeTask(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/agy/ui/download/FileDownloader$DownloadTask;)V

    .line 117
    :goto_0
    return-void
.end method

.method public static hasStoragePermission(Landroid/content/Context;)Z
    .locals 1

    .line 70
    nop

    .line 71
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static onPermissionResult(Landroid/app/Activity;Landroid/webkit/WebView;I[I)V
    .locals 2

    .line 91
    const/16 v0, 0x7d1

    if-eq p2, v0, :cond_0

    .line 92
    return-void

    .line 94
    :cond_0
    const/4 p2, 0x1

    const/4 v0, 0x0

    if-eqz p3, :cond_1

    array-length v1, p3

    if-lez v1, :cond_1

    aget p3, p3, v0

    if-nez p3, :cond_1

    move v0, p2

    .line 96
    :cond_1
    const/4 p3, 0x0

    if-eqz v0, :cond_2

    .line 97
    sget-object p2, Lcom/agy/ui/download/FileDownloader;->pendingTask:Lcom/agy/ui/download/FileDownloader$DownloadTask;

    if-eqz p2, :cond_3

    .line 98
    nop

    .line 99
    sput-object p3, Lcom/agy/ui/download/FileDownloader;->pendingTask:Lcom/agy/ui/download/FileDownloader$DownloadTask;

    .line 100
    invoke-static {p0, p1, p2}, Lcom/agy/ui/download/FileDownloader;->executeTask(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/agy/ui/download/FileDownloader$DownloadTask;)V

    .line 101
    goto :goto_0

    .line 103
    :cond_2
    sput-object p3, Lcom/agy/ui/download/FileDownloader;->pendingTask:Lcom/agy/ui/download/FileDownloader$DownloadTask;

    .line 104
    const-string p1, "\u0420\u0430\u0437\u0440\u0435\u0448\u0435\u043d\u0438\u0435 \u043d\u0430 \u0434\u043e\u0441\u0442\u0443\u043f \u043a \u0444\u0430\u0439\u043b\u0430\u043c \u043e\u0442\u043a\u043b\u043e\u043d\u0435\u043d\u043e"

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 106
    :cond_3
    :goto_0
    return-void
.end method

.method public static requestStoragePermission(Landroid/app/Activity;Lcom/agy/ui/download/FileDownloader$DownloadTask;)V
    .locals 1

    .line 78
    sput-object p1, Lcom/agy/ui/download/FileDownloader;->pendingTask:Lcom/agy/ui/download/FileDownloader$DownloadTask;

    .line 79
    nop

    .line 80
    const-string p1, "\u0422\u0440\u0435\u0431\u0443\u0435\u0442\u0441\u044f \u0434\u043e\u0441\u0442\u0443\u043f \u043a \u0444\u0430\u0439\u043b\u0430\u043c \u0434\u043b\u044f \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u044f"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 81
    const-string p1, "android.permission.WRITE_EXTERNAL_STORAGE"

    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    filled-new-array {p1, v0}, [Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x7d1

    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 88
    return-void
.end method

.method private static safeFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 364
    const-string v0, ""

    if-nez p0, :cond_0

    .line 365
    return-object v0

    .line 367
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x5c

    const/16 v2, 0x2f

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 368
    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 369
    if-ltz v3, :cond_1

    .line 370
    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 372
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0xb4

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 373
    const/4 v4, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v4, v6, :cond_5

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-ge v6, v5, :cond_5

    .line 374
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 375
    const/16 v7, 0x20

    if-lt v6, v7, :cond_3

    const/16 v7, 0x7f

    if-ne v6, v7, :cond_2

    goto :goto_1

    .line 377
    :cond_2
    if-eq v6, v2, :cond_4

    if-eq v6, v1, :cond_4

    .line 378
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 376
    :cond_3
    :goto_1
    const/16 v6, 0x5f

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 373
    :cond_4
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 381
    :cond_5
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 382
    const-string v1, "."

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, ".."

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_3

    :cond_6
    move-object v0, p0

    :cond_7
    :goto_3
    return-object v0
.end method

.method public static saveBase64ToDownloads(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 239
    new-instance p3, Ljava/lang/Thread;

    new-instance v0, Lcom/agy/ui/download/FileDownloader$1;

    invoke-direct {v0, p1, p2, p0}, Lcom/agy/ui/download/FileDownloader$1;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    invoke-direct {p3, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 290
    invoke-virtual {p3}, Ljava/lang/Thread;->start()V

    .line 291
    return-void
.end method
