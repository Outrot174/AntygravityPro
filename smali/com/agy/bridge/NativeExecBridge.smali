.class public Lcom/agy/bridge/NativeExecBridge;
.super Ljava/lang/Object;
.source "NativeExecBridge.java"

.method public constructor <init>()V
  .registers 1
  .line 12
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic lambda$listDirJson$0(Ljava/io/File;Ljava/io/File;)I
  .registers 3
  .line 68
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L0
    invoke-virtual { p1 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-nez v0, :L0
    const/4 p0, -1
    return p0
  :L0
  .line 69
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-nez v0, :L1
    invoke-virtual { p1 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 70
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p1 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method public execShell(Ljava/lang/String;)Ljava/lang/String;
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .catchall { :L1 .. :L5 } :L6
  .registers 7
  .line 16
    if-eqz p1, :L8
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto/16 :L8
  :L0
  .line 19
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  :L1
  .line 21
    new-instance v1, Ljava/lang/ProcessBuilder;
    const/4 v2, 3
    new-array v2, v2, [Ljava/lang/String;
    const-string v3, "/system/bin/sh"
    const/4 v4, 0
    aput-object v3, v2, v4
    const-string v3, "-c"
    const/4 v4, 1
    aput-object v3, v2, v4
    const/4 v3, 2
    aput-object p1, v2, v3
    invoke-direct { v1, v2 }, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V
  .line 22
    invoke-virtual { v1, v4 }, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;
  .line 23
    invoke-virtual { v1 }, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;
    move-result-object p1
  .line 24
    const-string v2, "/data/user/0/com.agy.pro/files/usr"
  .line 25
    new-instance v3, Ljava/io/File;
    invoke-direct { v3, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v3 }, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :L2
  .line 26
    const-string v2, "/data/user/0/com.agy/files/usr"
  :L2
  .line 28
    const-string v3, "PREFIX"
    invoke-interface { p1, v3, v2 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 29
    const-string v3, "HOME"
    const-string v4, "/storage/emulated/0/Antigravity"
    invoke-interface { p1, v3, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 30
    const-string v3, "PATH"
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, "/bin:/system/bin:/system/xbin"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-interface { p1, v3, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 31
    const-string v3, "LD_LIBRARY_PATH"
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, "/lib:/data/user/0/com.agy.pro/files/runtime/lib:/system/lib64"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-interface { p1, v3, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 32
    const-string v3, "TMPDIR"
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, "/tmp"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-interface { p1, v3, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 33
    const-string v3, "LANG"
    const-string v4, "en_US.UTF-8"
    invoke-interface { p1, v3, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 34
    invoke-virtual { v1 }, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;
    move-result-object p1
  .line 35
    new-instance v1, Ljava/io/BufferedReader;
    new-instance v2, Ljava/io/InputStreamReader;
    invoke-virtual { p1 }, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;
    move-result-object v3
    invoke-direct { v2, v3 }, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    invoke-direct { v1, v2 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
  :L3
  .line 37
    invoke-virtual { v1 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v2
    if-eqz v2, :L4
  .line 38
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "\n"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 39
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->length()I
    move-result v2
    const v3, 500000
    if-le v2, v3, :L3
  .line 40
    const-string v1, "... [Output truncated]\n"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 41
    nop
  :L4
  .line 44
    invoke-virtual { p1 }, Ljava/lang/Process;->waitFor()I
  :L5
  .line 47
    goto :L7
  :L6
  .line 45
    move-exception p1
  .line 46
    const-string v1, "Error: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { p1 }, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v1, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L7
  .line 48
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L8
  .line 17
    const-string p1, ""
    return-object p1
.end method

.method public listDirJson(Ljava/lang/String;)Ljava/lang/String;
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .catchall { :L2 .. :L7 } :L9
  .catchall { :L10 .. :L11 } :L12
  .registers 11
  .line 53
    const-string v0, "error"
    if-eqz p1, :L0
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :L1
  :L0
  .line 54
    const-string p1, "/storage/emulated/0/Antigravity"
  :L1
  .line 56
    new-instance v1, Lorg/json/JSONArray;
    invoke-direct { v1 }, Lorg/json/JSONArray;-><init>()V
  :L2
  .line 58
    new-instance v2, Ljava/io/File;
    invoke-direct { v2, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 59
    invoke-virtual { v2 }, Ljava/io/File;->exists()Z
    move-result p1
    if-nez p1, :L3
  .line 60
    new-instance p1, Lorg/json/JSONObject;
    invoke-direct { p1 }, Lorg/json/JSONObject;-><init>()V
  .line 61
    const-string v2, "Directory does not exist"
    invoke-virtual { p1, v0, v2 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
  .line 62
    invoke-virtual { v1, p1 }, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    move-result-object p1
    invoke-virtual { p1 }, Lorg/json/JSONArray;->toString()Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L3
  .line 64
    invoke-virtual { v2 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p1
  .line 65
    if-eqz p1, :L8
  .line 67
    new-instance v2, Lcom/agy/bridge/NativeExecBridge$0;
    invoke-direct { v2 }, Lcom/agy/bridge/NativeExecBridge$0;-><init>()V
    invoke-static { p1, v2 }, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
  .line 72
    array-length v2, p1
    const/4 v3, 0
  :L4
    if-ge v3, v2, :L8
    aget-object v4, p1, v3
  .line 73
    new-instance v5, Lorg/json/JSONObject;
    invoke-direct { v5 }, Lorg/json/JSONObject;-><init>()V
  .line 74
    const-string v6, "name"
    invoke-virtual { v4 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v5, v6, v7 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
  .line 75
    const-string v6, "path"
    invoke-virtual { v4 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v5, v6, v7 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
  .line 76
    const-string v6, "isDir"
    invoke-virtual { v4 }, Ljava/io/File;->isDirectory()Z
    move-result v7
    invoke-virtual { v5, v6, v7 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
  .line 77
    const-string v6, "size"
    invoke-virtual { v4 }, Ljava/io/File;->isDirectory()Z
    move-result v7
    if-eqz v7, :L5
    const-wide/16 v7, 0
    goto :L6
  :L5
    invoke-virtual { v4 }, Ljava/io/File;->length()J
    move-result-wide v7
  :L6
    invoke-virtual { v5, v6, v7, v8 }, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
  .line 78
    const-string v6, "lastModified"
    invoke-virtual { v4 }, Ljava/io/File;->lastModified()J
    move-result-wide v7
    invoke-virtual { v5, v6, v7, v8 }, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
  .line 79
    invoke-virtual { v1, v5 }, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
  :L7
  .line 72
    add-int/lit8 v3, v3, 1
    goto :L4
  :L8
  .line 88
    goto :L14
  :L9
  .line 82
    move-exception p1
  :L10
  .line 84
    new-instance v2, Lorg/json/JSONObject;
    invoke-direct { v2 }, Lorg/json/JSONObject;-><init>()V
  .line 85
    invoke-virtual { p1 }, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v2, v0, p1 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
  .line 86
    invoke-virtual { v1, v2 }, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
  :L11
    goto :L13
  :L12
  .line 87
    move-exception p1
  :L13
    nop
  :L14
  .line 89
    invoke-virtual { v1 }, Lorg/json/JSONArray;->toString()Ljava/lang/String;
    move-result-object p1
    return-object p1
.end method

.method public readFile(Ljava/lang/String;)Ljava/lang/String;
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .catchall { :L1 .. :L5 } :L7
  .registers 6
  .line 94
    const-string v0, ""
    if-eqz p1, :L8
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :L0
    goto :L8
  :L0
  .line 95
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  :L1
  .line 97
    new-instance v2, Ljava/io/File;
    invoke-direct { v2, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 98
    invoke-virtual { v2 }, Ljava/io/File;->exists()Z
    move-result p1
    if-eqz p1, :L6
    invoke-virtual { v2 }, Ljava/io/File;->isDirectory()Z
    move-result p1
    if-eqz p1, :L2
    goto :L6
  :L2
  .line 99
    new-instance p1, Ljava/io/BufferedReader;
    new-instance v0, Ljava/io/InputStreamReader;
    new-instance v3, Ljava/io/FileInputStream;
    invoke-direct { v3, v2 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    const-string v2, "UTF-8"
    invoke-direct { v0, v3, v2 }, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    invoke-direct { p1, v0 }, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
  :L3
  .line 101
    invoke-virtual { p1 }, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :L4
  .line 102
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, "\n"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 103
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->length()I
    move-result v0
    const v2, 1000000
    if-le v0, v2, :L3
  :L4
  .line 105
    invoke-virtual { p1 }, Ljava/io/BufferedReader;->close()V
  :L5
  .line 108
    nop
  .line 109
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L6
  .line 98
    return-object v0
  :L7
  .line 106
    move-exception p1
  .line 107
    invoke-virtual { p1 }, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    move-result-object p1
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "Error reading file: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    return-object p1
  :L8
  .line 94
    return-object v0
.end method

.method public writeFile(Ljava/lang/String;Ljava/lang/String;)Z
  .annotation runtime Landroid/webkit/JavascriptInterface;
  .end annotation
  .catchall { :L0 .. :L2 } :L3
  .registers 5
  .line 114
    const/4 v0, 0
    if-eqz p1, :L4
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :L0
    goto :L4
  :L0
  .line 116
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 117
    invoke-virtual { v1 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p1
    if-eqz p1, :L1
    invoke-virtual { v1 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/io/File;->mkdirs()Z
  :L1
  .line 118
    new-instance p1, Ljava/io/FileOutputStream;
    invoke-direct { p1, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 119
    const-string v1, "UTF-8"
    invoke-virtual { p2, v1 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/io/FileOutputStream;->write([B)V
  .line 120
    invoke-virtual { p1 }, Ljava/io/FileOutputStream;->close()V
  :L2
  .line 121
    const/4 p1, 1
    return p1
  :L3
  .line 122
    move-exception p1
  .line 123
    return v0
  :L4
  .line 114
    return v0
.end method
