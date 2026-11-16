.class public final Lcom/agy/core/CoreReadyProbe;
.super Ljava/lang/Object;
.source "CoreReadyProbe.java"


# static fields
.field public static final READY_TIMEOUT_MS:J = 0xea60L

.field private static final RETRY_SLEEP_MS:J = 0x3cL

.field private static final TAG:Ljava/lang/String; = "CoreReadyProbe"

.field private static volatile expectedCertDigest:[B


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method private static expectedCertDigest(Landroid/content/Context;)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 66
    sget-object v0, Lcom/agy/core/CoreReadyProbe;->expectedCertDigest:[B

    .line 67
    if-eqz v0, :cond_0

    .line 68
    return-object v0

    .line 70
    :cond_0
    const-class v0, Lcom/agy/core/CoreReadyProbe;

    monitor-enter v0

    .line 71
    :try_start_0
    sget-object v1, Lcom/agy/core/CoreReadyProbe;->expectedCertDigest:[B

    .line 72
    if-eqz v1, :cond_1

    .line 73
    monitor-exit v0

    return-object v1

    .line 75
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "agy_core_cert"

    const-string v3, "raw"

    .line 76
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 75
    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 77
    const/4 v2, 0x0

    if-nez v1, :cond_2

    .line 78
    const-string p0, "CoreReadyProbe"

    const-string v1, "bundled core certificate resource is missing"

    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    monitor-exit v0

    return-object v2

    .line 81
    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 82
    :try_start_1
    const-string v1, "X.509"

    invoke-static {v1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 83
    invoke-virtual {v1, p0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v1

    .line 84
    instance-of v3, v1, Ljava/security/cert/X509Certificate;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v3, :cond_4

    .line 85
    nop

    .line 90
    if-eqz p0, :cond_3

    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_3
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 85
    return-object v2

    .line 87
    :cond_4
    :try_start_3
    invoke-virtual {v1}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v1

    invoke-static {v1}, Lcom/agy/core/CoreReadyProbe;->sha256([B)[B

    move-result-object v1

    .line 88
    sput-object v1, Lcom/agy/core/CoreReadyProbe;->expectedCertDigest:[B
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 89
    nop

    .line 90
    if-eqz p0, :cond_5

    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_5
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 89
    return-object v1

    .line 81
    :catchall_0
    move-exception v1

    if-eqz p0, :cond_6

    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    :try_start_6
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_0
    throw v1

    .line 91
    :catchall_2
    move-exception p0

    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw p0
.end method

.method public static probeOnce(Landroid/content/Context;I)Z
    .locals 3

    .line 30
    nop

    .line 32
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 33
    nop

    .line 59
    nop

    .line 33
    return v0

    .line 35
    :cond_0
    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-static {p1}, Lcom/agy/util/CoreUrl;->startUrl(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 36
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljavax/net/ssl/HttpsURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 37
    const/16 v1, 0x320

    :try_start_1
    invoke-virtual {p1, v1}, Ljavax/net/ssl/HttpsURLConnection;->setConnectTimeout(I)V

    .line 38
    invoke-virtual {p1, v1}, Ljavax/net/ssl/HttpsURLConnection;->setReadTimeout(I)V

    .line 39
    invoke-virtual {p1, v0}, Ljavax/net/ssl/HttpsURLConnection;->setUseCaches(Z)V

    .line 40
    invoke-virtual {p1, v0}, Ljavax/net/ssl/HttpsURLConnection;->setInstanceFollowRedirects(Z)V

    .line 41
    const-string v1, "GET"

    invoke-virtual {p1, v1}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 42
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->connect()V

    .line 44
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v1

    .line 45
    const/16 v2, 0x64

    if-lt v1, v2, :cond_7

    const/16 v2, 0x257

    if-le v1, v2, :cond_1

    goto :goto_1

    .line 48
    :cond_1
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->getServerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v1

    .line 49
    array-length v2, v1

    if-eqz v2, :cond_5

    aget-object v2, v1, v0

    instance-of v2, v2, Ljava/security/cert/X509Certificate;

    if-nez v2, :cond_2

    goto :goto_0

    .line 52
    :cond_2
    invoke-static {p0}, Lcom/agy/core/CoreReadyProbe;->expectedCertDigest(Landroid/content/Context;)[B

    move-result-object p0

    .line 53
    aget-object v1, v1, v0

    invoke-virtual {v1}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v1

    invoke-static {v1}, Lcom/agy/core/CoreReadyProbe;->sha256([B)[B

    move-result-object v1

    .line 54
    if-eqz p0, :cond_3

    invoke-static {p0, v1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p0, :cond_3

    const/4 v0, 0x1

    .line 59
    :cond_3
    if-eqz p1, :cond_4

    .line 60
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 54
    :cond_4
    return v0

    .line 50
    :cond_5
    :goto_0
    nop

    .line 59
    if-eqz p1, :cond_6

    .line 60
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 50
    :cond_6
    return v0

    .line 46
    :cond_7
    :goto_1
    nop

    .line 59
    if-eqz p1, :cond_8

    .line 60
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 46
    :cond_8
    return v0

    .line 59
    :catchall_0
    move-exception p0

    move-object v1, p1

    goto :goto_3

    .line 55
    :catch_0
    move-exception p0

    move-object v1, p1

    goto :goto_2

    .line 59
    :catchall_1
    move-exception p0

    goto :goto_3

    .line 55
    :catch_1
    move-exception p0

    .line 56
    :goto_2
    const-wide/16 p0, 0x3c

    :try_start_2
    invoke-static {p0, p1}, Lcom/agy/util/ProcessUtils;->sleep(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 57
    nop

    .line 59
    if-eqz v1, :cond_9

    .line 60
    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 57
    :cond_9
    return v0

    .line 59
    :goto_3
    if-eqz v1, :cond_a

    .line 60
    invoke-virtual {v1}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 62
    :cond_a
    throw p0
.end method

.method private static sha256([B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 95
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    return-object p0
.end method
