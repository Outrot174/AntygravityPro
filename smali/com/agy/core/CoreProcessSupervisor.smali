.class public final Lcom/agy/core/CoreProcessSupervisor;
.super Ljava/lang/Object;
.source "CoreProcessSupervisor.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CoreProcessSupervisor"


# instance fields
.field private final appContext:Landroid/content/Context;

.field private final logBuffer:Lcom/agy/log/LogRingBuffer;

.field private final openUrlWatcher:Lcom/agy/core/OpenUrlWatcher;

.field private volatile process:Ljava/lang/Process;

.field private final runtime:Lcom/agy/runtime/RuntimeManager;

.field private volatile stopping:Z

.field private final terminalListener:Ljava/lang/Runnable;

.field private worker:Ljava/lang/Thread;


# direct methods
.method public static synthetic $r8$lambda$8T_hBhmhVTj3JYq9YKzU0ei11f8(Lcom/agy/core/CoreProcessSupervisor;)V
    .locals 0

    invoke-direct {p0}, Lcom/agy/core/CoreProcessSupervisor;->runCore()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/agy/runtime/RuntimeManager;Lcom/agy/core/OpenUrlWatcher;Lcom/agy/log/LogRingBuffer;Ljava/lang/Runnable;)V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/agy/core/CoreProcessSupervisor;->appContext:Landroid/content/Context;

    .line 42
    iput-object p2, p0, Lcom/agy/core/CoreProcessSupervisor;->runtime:Lcom/agy/runtime/RuntimeManager;

    .line 43
    iput-object p3, p0, Lcom/agy/core/CoreProcessSupervisor;->openUrlWatcher:Lcom/agy/core/OpenUrlWatcher;

    .line 44
    iput-object p4, p0, Lcom/agy/core/CoreProcessSupervisor;->logBuffer:Lcom/agy/log/LogRingBuffer;

    .line 45
    iput-object p5, p0, Lcom/agy/core/CoreProcessSupervisor;->terminalListener:Ljava/lang/Runnable;

    .line 46
    return-void
.end method

.method private static destroy(Ljava/lang/Process;)V
    .locals 1

    .line 219
    if-eqz p0, :cond_0

    .line 221
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Process;->destroy()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    goto :goto_0

    .line 222
    :catch_0
    move-exception v0

    .line 225
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Process;->destroyForcibly()Ljava/lang/Process;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 227
    goto :goto_1

    .line 226
    :catch_1
    move-exception p0

    .line 229
    :cond_0
    :goto_1
    invoke-static {}, Lcom/agy/core/CoreLauncher;->killOrphanCoreProcesses()V

    .line 230
    return-void
.end method

.method private static getLastLinesFromLog(Ljava/io/File;I)Ljava/lang/String;
    .locals 3

    .line 233
    new-instance v0, Ljava/io/File;

    const-string v1, "logs/core.log"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 234
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p0

    if-nez p0, :cond_0

    .line 235
    const-string p0, ""

    return-object p0

    .line 237
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 238
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    :cond_1
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 241
    invoke-static {v0}, Lcom/agy/util/SensitiveDataRedactor;->redactLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, p1, :cond_1

    .line 243
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 246
    :cond_2
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 247
    goto :goto_2

    .line 238
    :catchall_0
    move-exception p1

    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 246
    :catch_0
    move-exception p1

    .line 248
    :goto_2
    const-string p1, "\n"

    invoke-static {p1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private runCore()V
    .locals 4

    .line 64
    const-string v0, "terminal callback failed"

    const-string v1, "CoreProcessSupervisor"

    :try_start_0
    invoke-direct {p0}, Lcom/agy/core/CoreProcessSupervisor;->runCoreLoop()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    iget-boolean v2, p0, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/agy/core/CoreProcessSupervisor;->terminalListener:Ljava/lang/Runnable;

    if-eqz v2, :cond_0

    .line 68
    :try_start_1
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 69
    :catch_0
    move-exception v2

    .line 70
    invoke-static {v1, v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 71
    :goto_0
    nop

    .line 74
    :cond_0
    return-void

    .line 66
    :catchall_0
    move-exception v2

    iget-boolean v3, p0, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/agy/core/CoreProcessSupervisor;->terminalListener:Ljava/lang/Runnable;

    if-eqz v3, :cond_1

    .line 68
    :try_start_2
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 71
    goto :goto_1

    .line 69
    :catch_1
    move-exception v3

    .line 70
    invoke-static {v1, v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 73
    :cond_1
    :goto_1
    throw v2
.end method

.method private runCoreLoop()V
    .locals 19

    .line 77
    move-object/from16 v1, p0

    const-string v2, "CoreProcessSupervisor"

    const/4 v3, 0x0

    move v4, v3

    .line 78
    :goto_0
    iget-boolean v0, v1, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z

    if-nez v0, :cond_9

    .line 79
    iget-object v0, v1, Lcom/agy/core/CoreProcessSupervisor;->appContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/agy/core/CoreLogWriter;->open(Ljava/io/File;)Ljava/io/Writer;

    move-result-object v5

    .line 81
    const/4 v6, 0x0

    :try_start_0
    sput-object v6, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 82
    sput-boolean v3, Lcom/agy/core/CoreRuntimeState;->restarting:Z

    .line 83
    iget-object v0, v1, Lcom/agy/core/CoreProcessSupervisor;->runtime:Lcom/agy/runtime/RuntimeManager;

    iget-object v7, v1, Lcom/agy/core/CoreProcessSupervisor;->appContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v7

    invoke-static {v0, v7}, Lcom/agy/core/CoreLauncher;->launch(Lcom/agy/runtime/RuntimeManager;Ljava/io/File;)Ljava/lang/Process;

    move-result-object v7

    .line 84
    iput-object v7, v1, Lcom/agy/core/CoreProcessSupervisor;->process:Ljava/lang/Process;

    .line 86
    nop

    .line 87
    new-instance v0, Ljava/lang/Thread;

    new-instance v8, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda0;

    invoke-direct {v8, v1, v7, v5}, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda0;-><init>(Lcom/agy/core/CoreProcessSupervisor;Ljava/lang/Process;Ljava/io/Writer;)V

    const-string v9, "CoreStreamThread"

    invoke-direct {v0, v8, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 88
    const/4 v8, 0x1

    invoke-virtual {v0, v8}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 89
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 91
    invoke-direct {v1, v7, v5}, Lcom/agy/core/CoreProcessSupervisor;->waitForReady(Ljava/lang/Process;Ljava/io/Writer;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 92
    iget-boolean v0, v1, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    .line 153
    invoke-static {v5}, Lcom/agy/core/CoreLogWriter;->closeQuietly(Ljava/io/Writer;)V

    .line 93
    goto/16 :goto_8

    .line 96
    :cond_0
    :try_start_1
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 97
    const-string v0, "core did not become ready within 60000ms"

    sput-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 99
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    invoke-static {v5, v0}, Lcom/agy/core/CoreLogWriter;->writeLine(Ljava/io/Writer;Ljava/lang/String;)V

    .line 101
    :cond_1
    invoke-static {v7}, Lcom/agy/core/CoreProcessSupervisor;->destroy(Ljava/lang/Process;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 153
    invoke-static {v5}, Lcom/agy/core/CoreLogWriter;->closeQuietly(Ljava/io/Writer;)V

    .line 102
    goto/16 :goto_8

    .line 105
    :cond_2
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 107
    :try_start_3
    invoke-virtual {v7}, Ljava/lang/Process;->waitFor()I
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 110
    goto :goto_1

    .line 108
    :catch_0
    move-exception v0

    .line 109
    :try_start_4
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 111
    :goto_1
    iget-boolean v0, v1, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_3

    .line 153
    invoke-static {v5}, Lcom/agy/core/CoreLogWriter;->closeQuietly(Ljava/io/Writer;)V

    .line 112
    goto/16 :goto_8

    .line 115
    :cond_3
    :try_start_5
    invoke-static {v7}, Lcom/agy/util/ProcessUtils;->exitCode(Ljava/lang/Process;)I

    move-result v12

    .line 116
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    sub-long/2addr v13, v9

    const-wide/32 v15, 0xea60

    cmp-long v0, v13, v15

    if-ltz v0, :cond_4

    .line 117
    move v4, v3

    .line 119
    :cond_4
    sput-object v6, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    .line 120
    add-int/2addr v4, v8

    .line 121
    iget-object v0, v1, Lcom/agy/core/CoreProcessSupervisor;->appContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const/16 v7, 0xf

    invoke-static {v0, v7}, Lcom/agy/core/CoreProcessSupervisor;->getLastLinesFromLog(Ljava/io/File;I)Ljava/lang/String;

    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 122
    const-string v7, "\n--- core.log tail ---\n"

    const-string v11, ""

    const-string v13, ")"

    const/4 v14, 0x3

    if-le v4, v14, :cond_6

    .line 123
    :try_start_6
    sput-boolean v3, Lcom/agy/core/CoreRuntimeState;->restarting:Z

    .line 124
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "core crashed 3 times; giving up (last exit code "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 126
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_5

    :goto_2
    goto :goto_3

    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_2

    :goto_3
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 127
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    invoke-static {v5, v0}, Lcom/agy/core/CoreLogWriter;->writeLine(Ljava/io/Writer;Ljava/lang/String;)V

    .line 128
    iget-object v11, v1, Lcom/agy/core/CoreProcessSupervisor;->appContext:Landroid/content/Context;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long v13, v3, v9

    sget-object v15, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    iget-object v0, v1, Lcom/agy/core/CoreProcessSupervisor;->logBuffer:Lcom/agy/log/LogRingBuffer;

    move-object/from16 v16, v0

    invoke-static/range {v11 .. v16}, Lcom/agy/log/CrashRecorder;->recordCrash(Landroid/content/Context;IJLjava/lang/String;Lcom/agy/log/LogRingBuffer;)Lorg/json/JSONObject;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 153
    invoke-static {v5}, Lcom/agy/core/CoreLogWriter;->closeQuietly(Ljava/io/Writer;)V

    .line 129
    goto/16 :goto_8

    .line 131
    :cond_6
    move-object v15, v7

    :try_start_7
    invoke-static {v4}, Lcom/agy/core/CoreRestartPolicy;->delayFor(I)J

    move-result-wide v6

    .line 132
    sput-boolean v8, Lcom/agy/core/CoreRuntimeState;->restarting:Z

    .line 133
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "core exited unexpectedly (code "

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v8, "); restarting in "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-wide/16 v17, 0x3e8

    move-object/from16 v16, v15

    div-long v14, v6, v17

    invoke-virtual {v3, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v14, "s (attempt "

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v14, "/"

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v8, 0x3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 136
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_7

    :goto_4
    goto :goto_5

    :cond_7
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v11, v16

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_4

    :goto_5
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 137
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    sget-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    invoke-static {v5, v0}, Lcom/agy/core/CoreLogWriter;->writeLine(Ljava/io/Writer;Ljava/lang/String;)V

    .line 139
    iget-object v11, v1, Lcom/agy/core/CoreProcessSupervisor;->appContext:Landroid/content/Context;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    sub-long/2addr v13, v9

    sget-object v15, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    iget-object v0, v1, Lcom/agy/core/CoreProcessSupervisor;->logBuffer:Lcom/agy/log/LogRingBuffer;

    move-object/from16 v16, v0

    invoke-static/range {v11 .. v16}, Lcom/agy/log/CrashRecorder;->recordCrash(Landroid/content/Context;IJLjava/lang/String;Lcom/agy/log/LogRingBuffer;)Lorg/json/JSONObject;

    .line 140
    invoke-static {v5}, Lcom/agy/core/CoreLogWriter;->closeQuietly(Ljava/io/Writer;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 141
    nop

    .line 142
    :try_start_8
    invoke-direct {v1, v6, v7}, Lcom/agy/core/CoreProcessSupervisor;->sleepInterruptible(J)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 153
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/agy/core/CoreLogWriter;->closeQuietly(Ljava/io/Writer;)V

    .line 154
    nop

    .line 155
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 153
    :catchall_0
    move-exception v0

    const/4 v3, 0x0

    move-object v5, v3

    goto :goto_7

    .line 143
    :catch_1
    move-exception v0

    const/4 v3, 0x0

    move-object v5, v3

    goto :goto_6

    .line 153
    :catchall_1
    move-exception v0

    goto :goto_7

    .line 143
    :catch_2
    move-exception v0

    .line 144
    :goto_6
    :try_start_9
    iget-boolean v3, v1, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    if-eqz v3, :cond_8

    .line 153
    invoke-static {v5}, Lcom/agy/core/CoreLogWriter;->closeQuietly(Ljava/io/Writer;)V

    .line 145
    goto :goto_8

    .line 147
    :cond_8
    :try_start_a
    const-string v3, "core start failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 148
    invoke-static {v0}, Lcom/agy/util/ErrorText;->describe(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "core start failed: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/agy/core/CoreLogWriter;->writeLine(Ljava/io/Writer;Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 153
    invoke-static {v5}, Lcom/agy/core/CoreLogWriter;->closeQuietly(Ljava/io/Writer;)V

    .line 151
    goto :goto_8

    .line 153
    :goto_7
    invoke-static {v5}, Lcom/agy/core/CoreLogWriter;->closeQuietly(Ljava/io/Writer;)V

    .line 154
    throw v0

    .line 156
    :cond_9
    :goto_8
    return-void
.end method

.method private sleepInterruptible(J)V
    .locals 4

    .line 208
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p1

    .line 209
    :goto_0
    iget-boolean p1, p0, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z

    if-nez p1, :cond_1

    .line 210
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    sub-long p1, v0, p1

    .line 211
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-gtz v2, :cond_0

    .line 212
    return-void

    .line 214
    :cond_0
    const-wide/16 v2, 0xfa

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/agy/util/ProcessUtils;->sleep(J)V

    .line 215
    goto :goto_0

    .line 216
    :cond_1
    return-void
.end method

.method private streamLog(Ljava/lang/Process;Ljava/io/Writer;)V
    .locals 4

    .line 190
    const-string v0, "CoreProcessSupervisor"

    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    .line 191
    invoke-virtual {p1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 194
    invoke-static {p1}, Lcom/agy/util/SensitiveDataRedactor;->redactLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 195
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    iget-object v3, p0, Lcom/agy/core/CoreProcessSupervisor;->logBuffer:Lcom/agy/log/LogRingBuffer;

    if-eqz v3, :cond_0

    .line 197
    invoke-virtual {v3, v2}, Lcom/agy/log/LogRingBuffer;->appendLine(Ljava/lang/String;)V

    .line 199
    :cond_0
    invoke-static {p2, v2}, Lcom/agy/core/CoreLogWriter;->writeLine(Ljava/io/Writer;Ljava/lang/String;)V

    .line 200
    iget-object v2, p0, Lcom/agy/core/CoreProcessSupervisor;->openUrlWatcher:Lcom/agy/core/OpenUrlWatcher;

    invoke-virtual {v2, p1}, Lcom/agy/core/OpenUrlWatcher;->handleStreamLine(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 201
    goto :goto_0

    .line 202
    :cond_1
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 204
    goto :goto_2

    .line 190
    :catchall_0
    move-exception p1

    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p2

    :try_start_4
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 202
    :catch_0
    move-exception p1

    .line 203
    const-string p2, "log stream ended"

    invoke-static {v0, p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 205
    :goto_2
    return-void
.end method

.method private waitForReady(Ljava/lang/Process;Ljava/io/Writer;)Z
    .locals 8

    .line 159
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 160
    iget-object v2, p0, Lcom/agy/core/CoreProcessSupervisor;->runtime:Lcom/agy/runtime/RuntimeManager;

    invoke-virtual {v2}, Lcom/agy/runtime/RuntimeManager;->getCsrfToken()Ljava/lang/String;

    move-result-object v2

    .line 161
    sget v3, Lcom/agy/core/CoreRuntimeState;->httpsPort:I

    .line 162
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    const-wide/32 v6, 0xea60

    cmp-long v4, v4, v6

    const/4 v5, 0x0

    if-gez v4, :cond_4

    .line 163
    iget-boolean v4, p0, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z

    if-eqz v4, :cond_1

    .line 164
    return v5

    .line 166
    :cond_1
    invoke-static {p1}, Lcom/agy/util/ProcessUtils;->isAlive(Ljava/lang/Process;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 167
    invoke-static {p1}, Lcom/agy/util/ProcessUtils;->exitCode(Ljava/lang/Process;)I

    move-result p1

    .line 168
    const-wide/16 v0, 0xc8

    invoke-static {v0, v1}, Lcom/agy/util/ProcessUtils;->sleep(J)V

    .line 169
    iget-object v0, p0, Lcom/agy/core/CoreProcessSupervisor;->appContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const/16 v1, 0xa

    invoke-static {v0, v1}, Lcom/agy/core/CoreProcessSupervisor;->getLastLinesFromLog(Ljava/io/File;I)Ljava/lang/String;

    move-result-object v0

    .line 170
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "core process exited before it became ready (exit code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ")"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 171
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, ""

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\n--- core.log tail ---\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 172
    sget-object p1, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/agy/core/CoreLogWriter;->writeLine(Ljava/io/Writer;Ljava/lang/String;)V

    .line 173
    return v5

    .line 175
    :cond_3
    iget-object v4, p0, Lcom/agy/core/CoreProcessSupervisor;->appContext:Landroid/content/Context;

    invoke-static {v4, v3}, Lcom/agy/core/CoreReadyProbe;->probeOnce(Landroid/content/Context;I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 176
    invoke-static {v3, v2}, Lcom/agy/util/CoreUrl;->startUrl(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/agy/core/CoreRuntimeState;->serverUrl:Ljava/lang/String;

    .line 177
    const/4 p1, 0x0

    sput-object p1, Lcom/agy/core/CoreRuntimeState;->lastError:Ljava/lang/String;

    .line 178
    sput-boolean v5, Lcom/agy/core/CoreRuntimeState;->restarting:Z

    .line 179
    sget p1, Lcom/agy/core/CoreRuntimeState;->readyGeneration:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    sput p1, Lcom/agy/core/CoreRuntimeState;->readyGeneration:I

    .line 180
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "core ready on 127.0.0.1:"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 181
    const-string v1, "CoreProcessSupervisor"

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    invoke-static {p2, p1}, Lcom/agy/core/CoreLogWriter;->writeLine(Ljava/io/Writer;Ljava/lang/String;)V

    .line 183
    return v0

    .line 186
    :cond_4
    return v5
.end method


# virtual methods
.method synthetic lambda$runCoreLoop$0$com-agy-core-CoreProcessSupervisor(Ljava/lang/Process;Ljava/io/Writer;)V
    .locals 0

    .line 87
    invoke-direct {p0, p1, p2}, Lcom/agy/core/CoreProcessSupervisor;->streamLog(Ljava/lang/Process;Ljava/io/Writer;)V

    return-void
.end method

.method public start()V
    .locals 3

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z

    .line 50
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/agy/core/CoreProcessSupervisor$$ExternalSyntheticLambda1;-><init>(Lcom/agy/core/CoreProcessSupervisor;)V

    const-string v2, "CoreServerThread"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/agy/core/CoreProcessSupervisor;->worker:Ljava/lang/Thread;

    .line 51
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 52
    return-void
.end method

.method public stop()V
    .locals 1

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/agy/core/CoreProcessSupervisor;->stopping:Z

    .line 56
    iget-object v0, p0, Lcom/agy/core/CoreProcessSupervisor;->process:Ljava/lang/Process;

    invoke-static {v0}, Lcom/agy/core/CoreProcessSupervisor;->destroy(Ljava/lang/Process;)V

    .line 57
    iget-object v0, p0, Lcom/agy/core/CoreProcessSupervisor;->worker:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 60
    :cond_0
    return-void
.end method
