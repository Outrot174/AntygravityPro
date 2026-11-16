.class public final Lcom/agy/ui/splash/SplashLoadingHtml;
.super Ljava/lang/Object;
.source "SplashLoadingHtml.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public static getLoadingHtml(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<!DOCTYPE html>\n<html>\n<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<style>\n  :root {\n    --bg: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ";\n    --fg: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ";\n  }\n  html, body {\n    margin: 0;\n    padding: 0;\n    height: 100%;\n    width: 100%;\n    background: var(--bg);\n    color: var(--fg);\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    overflow: hidden;\n    -webkit-user-select: none;\n  }\n  @keyframes dot-bounce {\n    0%, 100% { transform: translateY(0); }\n    15% { transform: translateY(-2px); }\n    30% { transform: translateY(0); }\n  }\n  .animate-dot-bounce {\n    display: inline-block;\n    width: 3px;\n    height: 3px;\n    border-radius: 50%;\n    background-color: currentColor;\n    animation: dot-bounce 1.6s ease-in-out infinite;\n  }\n</style>\n</head>\n<body>\n  <span style=\"display:inline-flex;align-items:center;gap:2px;height:16px;padding:0 4px;opacity:0.5;\" aria-label=\"Loading\">\n    <span class=\"animate-dot-bounce\" style=\"animation-delay:0ms;\"></span>\n    <span class=\"animate-dot-bounce\" style=\"animation-delay:120ms;\"></span>\n    <span class=\"animate-dot-bounce\" style=\"animation-delay:240ms;\"></span>\n  </span>\n</body>\n</html>\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static load(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 65
    if-nez p0, :cond_0

    .line 66
    return-void

    .line 68
    :cond_0
    const/4 v1, 0x0

    invoke-static {p1, p2}, Lcom/agy/ui/splash/SplashLoadingHtml;->getLoadingHtml(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "text/html"

    const-string v4, "utf-8"

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    return-void
.end method
