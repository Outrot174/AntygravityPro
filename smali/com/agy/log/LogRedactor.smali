.class public final Lcom/agy/log/LogRedactor;
.super Ljava/lang/Object;
.source "LogRedactor.java"


# static fields
.field private static final BEARER_PATTERN:Ljava/util/regex/Pattern;

.field private static final CSRF_PATTERN:Ljava/util/regex/Pattern;

.field private static final KEY_PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 10
    const-string v0, "Bearer\\s+[A-Za-z0-9_\\-\\.~]+"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/agy/log/LogRedactor;->BEARER_PATTERN:Ljava/util/regex/Pattern;

    .line 11
    const-string v0, "csrf[_-]?token[=:\\s]+([A-Za-z0-9_\\-]+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/agy/log/LogRedactor;->CSRF_PATTERN:Ljava/util/regex/Pattern;

    .line 12
    const-string v0, "(api[_-]?key|secret|password)[=:\\s]+([A-Za-z0-9_\\-]+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/agy/log/LogRedactor;->KEY_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method public static redact(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 18
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Lcom/agy/log/LogRedactor;->BEARER_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, "Bearer [REDACTED]"

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 22
    sget-object v0, Lcom/agy/log/LogRedactor;->CSRF_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, "csrf_token=[REDACTED]"

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 23
    sget-object v0, Lcom/agy/log/LogRedactor;->KEY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, "$1=[REDACTED]"

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 24
    return-object p0

    .line 19
    :cond_1
    :goto_0
    return-object p0
.end method
