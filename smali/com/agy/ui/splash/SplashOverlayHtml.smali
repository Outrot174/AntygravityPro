.class public final Lcom/agy/ui/splash/SplashOverlayHtml;
.super Ljava/lang/Object;
.source "SplashOverlayHtml.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method

.method private static escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 117
    const-string v0, "&"

    const-string v1, "&amp;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "<"

    const-string v1, "&lt;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, ">"

    const-string v1, "&gt;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getOverlayHtml(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .line 25
    if-nez p0, :cond_0

    const-string p0, "Antigravity"

    :cond_0
    invoke-static {p0}, Lcom/agy/ui/splash/SplashOverlayHtml;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 26
    if-nez p1, :cond_1

    const-string p1, "unknown error"

    :cond_1
    invoke-static {p1}, Lcom/agy/ui/splash/SplashOverlayHtml;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 27
    if-eqz p4, :cond_2

    .line 28
    const-string p4, "  <div class=\"btn-group\">\n    <button class=\"btn retry\" onclick=\"agyRetry()\">Retry</button>\n    <button class=\"btn sec\" onclick=\"agyCopyLogs()\">Copy Logs</button>\n    <button class=\"btn sec\" onclick=\"agySaveLogs()\">Save Logs</button>\n  </div>\n"

    goto :goto_0

    .line 33
    :cond_2
    const-string p4, ""

    .line 34
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<!DOCTYPE html>\n<html>\n<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<style>\n  body {\n    margin: 0;\n    padding: 24px;\n    box-sizing: border-box;\n    background: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";\n    color: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";\n    font-family: system-ui, -apple-system, sans-serif;\n    display: flex;\n    flex-direction: column;\n    align-items: center;\n    justify-content: center;\n    height: 100vh;\n    text-align: center;\n  }\n  .title { font-size: 15px; font-weight: 600; margin-bottom: 10px; }\n  .msg {\n    font-size: 12px;\n    opacity: 0.75;\n    word-break: break-word;\n    max-width: 90vw;\n    white-space: pre-wrap;\n  }\n  .btn-group {\n    display: flex;\n    flex-wrap: wrap;\n    gap: 10px;\n    justify-content: center;\n    align-items: center;\n    margin-top: 20px;\n  }\n  .btn {\n    padding: 9px 18px;\n    font-size: 13px;\n    font-weight: 500;\n    border-radius: 6px;\n    cursor: pointer;\n    box-sizing: border-box;\n    font-family: inherit;\n  }\n  .retry {\n    color: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, ";\n    background: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, ";\n    border: none;\n  }\n  .sec {\n    color: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, ";\n    background: transparent;\n    border: 1px solid "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, ";\n    opacity: 0.85;\n  }\n</style>\n</head>\n<body>\n  <div class=\"title\">"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, "</div>\n  <div class=\"msg\">"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "</div>\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "  <script>\n    function agyRetry() {\n      if (window.SplashRetry && window.SplashRetry.retry) {\n        window.SplashRetry.retry();\n      }\n    }\n    function agyCopyLogs() {\n      if (window.SplashRetry && window.SplashRetry.copyLogs) {\n        window.SplashRetry.copyLogs();\n      }\n    }\n    function agySaveLogs() {\n      if (window.SplashRetry && window.SplashRetry.saveLogs) {\n        window.SplashRetry.saveLogs();\n      }\n    }\n  </script>\n</body>\n</html>\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static show(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 14
    if-nez p0, :cond_0

    .line 15
    return-void

    .line 17
    :cond_0
    const-string v0, "https://app.antigravity.local/"

    .line 18
    invoke-static {p1, p2, p3, p4, p5}, Lcom/agy/ui/splash/SplashOverlayHtml;->getOverlayHtml(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p2

    const-string p3, "text/html"

    const-string p4, "utf-8"

    const/4 p5, 0x0

    .line 17
    move-object p1, v0

    invoke-virtual/range {p0 .. p5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    return-void
.end method
