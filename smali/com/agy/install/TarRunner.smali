.class public final Lcom/agy/install/TarRunner;
.super Ljava/lang/Object;
.source "TarRunner.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "TarRunner"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method private static runTar(Ljava/lang/String;ZLjava/io/File;Ljava/io/File;Z)Z
    .locals 4

    .line 29
    const-string v0, ": "

    const-string v1, "TarRunner"

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 30
    return v3

    .line 32
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 33
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    if-eqz p1, :cond_1

    .line 35
    const-string p0, "tar"

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    :cond_1
    if-eqz p4, :cond_2

    const-string p0, "-xzf"

    goto :goto_0

    :cond_2
    const-string p0, "-xf"

    :goto_0
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    const-string p0, "-C"

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    :try_start_0
    new-instance p0, Ljava/lang/ProcessBuilder;

    invoke-direct {p0, v2}, Ljava/lang/ProcessBuilder;-><init>(Ljava/util/List;)V

    .line 43
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    .line 44
    invoke-virtual {p0}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object p0

    .line 45
    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 p3, 0x78

    invoke-static {p0, p3, p4, p2}, Lcom/agy/util/ProcessUtils;->drainAndWait(Ljava/lang/Process;JLjava/util/concurrent/TimeUnit;)Z

    move-result p2

    if-nez p2, :cond_3

    .line 46
    invoke-virtual {p0}, Ljava/lang/Process;->destroyForcibly()Ljava/lang/Process;

    .line 47
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "tar timed out: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    return v3

    .line 50
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Process;->exitValue()I

    move-result p0

    .line 51
    if-eqz p0, :cond_4

    .line 52
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "tar exit "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :cond_4
    if-nez p0, :cond_5

    move v3, p1

    :cond_5
    return v3

    .line 55
    :catch_0
    move-exception p0

    .line 56
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "tar exec failed "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    return v3
.end method

.method public static runToyboxTar(Ljava/io/File;Ljava/io/File;Z)Z
    .locals 2

    .line 21
    const-string v0, "/system/bin/toybox"

    const/4 v1, 0x1

    invoke-static {v0, v1, p0, p1, p2}, Lcom/agy/install/TarRunner;->runTar(Ljava/lang/String;ZLjava/io/File;Ljava/io/File;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 22
    return v1

    .line 24
    :cond_0
    const-string v0, "/system/bin/tar"

    const/4 v1, 0x0

    invoke-static {v0, v1, p0, p1, p2}, Lcom/agy/install/TarRunner;->runTar(Ljava/lang/String;ZLjava/io/File;Ljava/io/File;Z)Z

    move-result p0

    return p0
.end method
