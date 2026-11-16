.class public final Lcom/agy/browser/NativeBrowserManager;
.super Ljava/lang/Object;
.source "NativeBrowserManager.java"

.field private final static TAG:Ljava/lang/String; = "NativeBrowserManager"

.field private static volatile sInstance:Lcom/agy/browser/NativeBrowserManager;

.field private mActivityRef:Ljava/lang/ref/WeakReference;
  .annotation system Ldalvik/annotation/Signature;
    value = {
      "Ljava/lang/ref/WeakReference<",
      "Landroid/app/Activity;",
      ">;"
    }
  .end annotation
.end field

.field private volatile mCanGoBack:Z

.field private volatile mCanGoForward:Z

.field private volatile mCurrentUrl:Ljava/lang/String;

.field private volatile mIsLoading:Z

.field private volatile mIsVisible:Z

.field private mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;

.field private volatile mPageTitle:Ljava/lang/String;

.field private mWebView:Landroid/webkit/WebView;

.method private constructor <init>()V
  .registers 2
  .line 39
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 32
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/agy/browser/NativeBrowserManager;->mIsVisible:Z
  .line 33
    iput-boolean v0, p0, Lcom/agy/browser/NativeBrowserManager;->mIsLoading:Z
  .line 34
    iput-boolean v0, p0, Lcom/agy/browser/NativeBrowserManager;->mCanGoBack:Z
  .line 35
    iput-boolean v0, p0, Lcom/agy/browser/NativeBrowserManager;->mCanGoForward:Z
  .line 36
    const-string v0, ""
    iput-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mCurrentUrl:Ljava/lang/String;
  .line 37
    iput-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mPageTitle:Ljava/lang/String;
  .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/agy/browser/NativeBrowserManager;)Landroid/webkit/WebView;
  .registers 1
  .line 25
    iget-object p0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    return-object p0
.end method

.method static synthetic access$102(Lcom/agy/browser/NativeBrowserManager;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 25
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mCurrentUrl:Ljava/lang/String;
    return-object p1
.end method

.method static synthetic access$200(Lcom/agy/browser/NativeBrowserManager;)Z
  .registers 1
  .line 25
    iget-boolean p0, p0, Lcom/agy/browser/NativeBrowserManager;->mIsLoading:Z
    return p0
.end method

.method static synthetic access$202(Lcom/agy/browser/NativeBrowserManager;Z)Z
  .registers 2
  .line 25
    iput-boolean p1, p0, Lcom/agy/browser/NativeBrowserManager;->mIsLoading:Z
    return p1
.end method

.method static synthetic access$300(Lcom/agy/browser/NativeBrowserManager;)Z
  .registers 1
  .line 25
    iget-boolean p0, p0, Lcom/agy/browser/NativeBrowserManager;->mCanGoBack:Z
    return p0
.end method

.method static synthetic access$302(Lcom/agy/browser/NativeBrowserManager;Z)Z
  .registers 2
  .line 25
    iput-boolean p1, p0, Lcom/agy/browser/NativeBrowserManager;->mCanGoBack:Z
    return p1
.end method

.method static synthetic access$400(Lcom/agy/browser/NativeBrowserManager;)Z
  .registers 1
  .line 25
    iget-boolean p0, p0, Lcom/agy/browser/NativeBrowserManager;->mCanGoForward:Z
    return p0
.end method

.method static synthetic access$402(Lcom/agy/browser/NativeBrowserManager;Z)Z
  .registers 2
  .line 25
    iput-boolean p1, p0, Lcom/agy/browser/NativeBrowserManager;->mCanGoForward:Z
    return p1
.end method

.method static synthetic access$500(Lcom/agy/browser/NativeBrowserManager;)Ljava/lang/String;
  .registers 1
  .line 25
    iget-object p0, p0, Lcom/agy/browser/NativeBrowserManager;->mPageTitle:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$502(Lcom/agy/browser/NativeBrowserManager;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 25
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mPageTitle:Ljava/lang/String;
    return-object p1
.end method

.method private getActivity()Landroid/app/Activity;
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 59
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mActivityRef:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
  .line 60
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mActivityRef:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/Activity;
  .line 61
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :L0
  .line 62
    return-object v0
  :L0
  .line 67
    const/4 v0, 0
  :L1
    const-string v1, "com.agy.ui.MainActivity"
    invoke-static { v1 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v1
  .line 68
    const-string v2, "activeActivity"
    invoke-virtual { v1, v2 }, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 69
    instance-of v2, v1, Landroid/app/Activity;
    if-eqz v2, :L4
  .line 70
    check-cast v1, Landroid/app/Activity;
  :L2
    return-object v1
  :L3
  .line 72
    move-exception v1
  :L4
    nop
  .line 73
    return-object v0
.end method

.method public static getInstance()Lcom/agy/browser/NativeBrowserManager;
  .catchall { :L0 .. :L3 } :L2
  .registers 2
  .line 42
    sget-object v0, Lcom/agy/browser/NativeBrowserManager;->sInstance:Lcom/agy/browser/NativeBrowserManager;
    if-nez v0, :L4
  .line 43
    const-class v0, Lcom/agy/browser/NativeBrowserManager;
    monitor-enter v0
  :L0
  .line 44
    sget-object v1, Lcom/agy/browser/NativeBrowserManager;->sInstance:Lcom/agy/browser/NativeBrowserManager;
    if-nez v1, :L1
  .line 45
    new-instance v1, Lcom/agy/browser/NativeBrowserManager;
    invoke-direct { v1 }, Lcom/agy/browser/NativeBrowserManager;-><init>()V
    sput-object v1, Lcom/agy/browser/NativeBrowserManager;->sInstance:Lcom/agy/browser/NativeBrowserManager;
  :L1
  .line 47
    monitor-exit v0
    goto :L4
  :L2
    move-exception v1
    monitor-exit v0
  :L3
    throw v1
  :L4
  .line 49
    sget-object v0, Lcom/agy/browser/NativeBrowserManager;->sInstance:Lcom/agy/browser/NativeBrowserManager;
    return-object v0
.end method

.method public canGoBack()Z
  .registers 2
  .line 207
    iget-boolean v0, p0, Lcom/agy/browser/NativeBrowserManager;->mCanGoBack:Z
    return v0
.end method

.method public canGoForward()Z
  .registers 2
  .line 211
    iget-boolean v0, p0, Lcom/agy/browser/NativeBrowserManager;->mCanGoForward:Z
    return v0
.end method

.method public close()V
  .registers 3
  .line 192
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v0
  .line 193
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-nez v1, :L0
    goto :L1
  :L0
  .line 194
    new-instance v1, Lcom/agy/browser/NativeBrowserManager$9;
    invoke-direct { v1, p0 }, Lcom/agy/browser/NativeBrowserManager$9;-><init>(Lcom/agy/browser/NativeBrowserManager;)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 204
    return-void
  :L1
  .line 193
    return-void
.end method

.method ensureWebView(Landroid/app/Activity;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 6
  .line 229
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-eqz v0, :L0
    return-void
  :L0
  .line 231
    new-instance v0, Landroid/webkit/WebView;
    invoke-direct { v0, p1 }, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
  .line 232
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    invoke-virtual { v0 }, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
    move-result-object v0
  .line 233
    const/4 v1, 1
    invoke-virtual { v0, v1 }, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V
  .line 234
    invoke-virtual { v0, v1 }, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V
  .line 235
    invoke-virtual { v0, v1 }, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V
  .line 236
    invoke-virtual { v0, v1 }, Landroid/webkit/WebSettings;->setSupportZoom(Z)V
  .line 237
    invoke-virtual { v0, v1 }, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V
  .line 238
    const/4 v2, 0
    invoke-virtual { v0, v2 }, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V
  .line 239
    invoke-virtual { v0, v1 }, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V
  .line 240
    invoke-virtual { v0, v1 }, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V
  .line 241
    invoke-virtual { v0, v2 }, Landroid/webkit/WebSettings;->setMixedContentMode(I)V
  .line 242
    invoke-virtual { v0, v1 }, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V
  .line 243
    invoke-virtual { v0, v1 }, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V
  .line 244
    const-string v3, "Mozilla/5.0 (Linux; Android 16; 24122RKC7G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36 Antigravity/2.11.0"
    invoke-virtual { v0, v3 }, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V
  :L1
  .line 247
    invoke-static { }, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v0
  .line 248
    invoke-virtual { v0, v1 }, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V
  .line 249
    iget-object v3, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    invoke-virtual { v0, v3, v1 }, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V
  :L2
    goto :L4
  :L3
  .line 250
    move-exception v0
  :L4
    nop
  .line 252
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    new-instance v1, Lcom/agy/browser/NativeBrowserManager$10;
    invoke-direct { v1, p0 }, Lcom/agy/browser/NativeBrowserManager$10;-><init>(Lcom/agy/browser/NativeBrowserManager;)V
    invoke-virtual { v0, v1 }, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V
  .line 291
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    new-instance v1, Lcom/agy/browser/NativeBrowserManager$11;
    invoke-direct { v1, p0 }, Lcom/agy/browser/NativeBrowserManager$11;-><init>(Lcom/agy/browser/NativeBrowserManager;)V
    invoke-virtual { v0, v1 }, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V
  .line 305
    const v0, 16908290
    invoke-virtual { p1, v0 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
  .line 306
    if-nez v0, :L5
  .line 307
    invoke-virtual { p1 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p1
    move-object v0, p1
    check-cast v0, Landroid/view/ViewGroup;
  :L5
  .line 310
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;
    const v1, 8388659
    invoke-direct { p1, v2, v2, v1 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
  .line 311
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    const/16 v1, 8
    invoke-virtual { p1, v1 }, Landroid/webkit/WebView;->setVisibility(I)V
  .line 312
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual { v0, p1, v1 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
  .line 313
    return-void
.end method

.method public getTitle()Ljava/lang/String;
  .registers 2
  .line 219
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mPageTitle:Ljava/lang/String;
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mPageTitle:Ljava/lang/String;
    goto :L1
  :L0
    const-string v0, ""
  :L1
    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
  .registers 2
  .line 215
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mCurrentUrl:Ljava/lang/String;
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mCurrentUrl:Ljava/lang/String;
    goto :L1
  :L0
    const-string v0, ""
  :L1
    return-object v0
.end method

.method public goBack()V
  .registers 3
  .line 140
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v0
  .line 141
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-nez v1, :L0
    goto :L1
  :L0
  .line 142
    new-instance v1, Lcom/agy/browser/NativeBrowserManager$5;
    invoke-direct { v1, p0 }, Lcom/agy/browser/NativeBrowserManager$5;-><init>(Lcom/agy/browser/NativeBrowserManager;)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 150
    return-void
  :L1
  .line 141
    return-void
.end method

.method public goForward()V
  .registers 3
  .line 153
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v0
  .line 154
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-nez v1, :L0
    goto :L1
  :L0
  .line 155
    new-instance v1, Lcom/agy/browser/NativeBrowserManager$6;
    invoke-direct { v1, p0 }, Lcom/agy/browser/NativeBrowserManager$6;-><init>(Lcom/agy/browser/NativeBrowserManager;)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 163
    return-void
  :L1
  .line 154
    return-void
.end method

.method public isLoading()Z
  .registers 2
  .line 223
    iget-boolean v0, p0, Lcom/agy/browser/NativeBrowserManager;->mIsLoading:Z
    return v0
.end method

.method public navigate(Ljava/lang/String;)V
  .registers 4
  .line 125
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v0
  .line 126
    if-nez v0, :L0
    return-void
  :L0
  .line 128
    new-instance v1, Lcom/agy/browser/NativeBrowserManager$4;
    invoke-direct { v1, p0, v0, p1 }, Lcom/agy/browser/NativeBrowserManager$4;-><init>(Lcom/agy/browser/NativeBrowserManager;Landroid/app/Activity;Ljava/lang/String;)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 137
    return-void
.end method

.method navigateInternal(Ljava/lang/String;)V
  .registers 4
  .line 352
    if-eqz p1, :L4
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L4
  :L0
  .line 353
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
  .line 354
    const-string v0, "http://"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L3
    const-string v0, "https://"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L3
    const-string v1, "file://"
    invoke-virtual { p1, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L3
    const-string v1, "about:"
    invoke-virtual { p1, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L3
  .line 355
    const-string v1, " "
    invoke-virtual { p1, v1 }, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-nez v1, :L2
    const-string v1, "."
    invoke-virtual { p1, v1 }, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-nez v1, :L1
    goto :L2
  :L1
  .line 358
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    goto :L3
  :L2
  .line 356
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "https://duckduckgo.com/html/?q="
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
  :L3
  .line 361
    iput-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mCurrentUrl:Ljava/lang/String;
  .line 362
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    invoke-virtual { v0, p1 }, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
  .line 363
    return-void
  :L4
  .line 352
    return-void
.end method

.method notifyState(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZZ)V
  .catchall { :L0 .. :L9 } :L12
  .registers 11
  :L0
  .line 367
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v0
  .line 368
    if-nez v0, :L1
    return-void
  :L1
  .line 370
    new-instance v1, Lorg/json/JSONObject;
    invoke-direct { v1 }, Lorg/json/JSONObject;-><init>()V
  .line 371
    const-string v2, "event"
    invoke-virtual { v1, v2, p1 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
  .line 372
    const-string p1, "url"
    if-eqz p2, :L2
    goto :L3
  :L2
    iget-object p2, p0, Lcom/agy/browser/NativeBrowserManager;->mCurrentUrl:Ljava/lang/String;
  :L3
    invoke-virtual { v1, p1, p2 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
  .line 373
    const-string p1, "title"
    if-eqz p3, :L5
  :L4
    goto :L7
  :L5
    iget-object p2, p0, Lcom/agy/browser/NativeBrowserManager;->mPageTitle:Ljava/lang/String;
    if-eqz p2, :L6
    iget-object p3, p0, Lcom/agy/browser/NativeBrowserManager;->mPageTitle:Ljava/lang/String;
    goto :L4
  :L6
    const-string p3, ""
    goto :L4
  :L7
    invoke-virtual { v1, p1, p3 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
  .line 374
    const-string p1, "progress"
    invoke-virtual { v1, p1, p4 }, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
  .line 375
    const-string p1, "loading"
    invoke-virtual { v1, p1, p5 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
  .line 376
    const-string p1, "canBack"
    invoke-virtual { v1, p1, p6 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
  .line 377
    const-string p1, "canForward"
    invoke-virtual { v1, p1, p7 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
  .line 379
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string p2, "window.NativeBrowserBridge && window.NativeBrowserBridge.onNativeEvent("
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { v1 }, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string p2, ");"
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
  .line 382
    const p2, 16908290
    invoke-virtual { v0, p2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p2
    check-cast p2, Landroid/view/ViewGroup;
  .line 383
    if-eqz p2, :L11
  .line 384
    const/4 p3, 0
  :L8
    invoke-virtual { p2 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result p4
    if-ge p3, p4, :L11
  .line 385
    invoke-virtual { p2, p3 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object p4
  .line 386
    instance-of p5, p4, Landroid/webkit/WebView;
    if-eqz p5, :L10
    iget-object p5, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-eq p4, p5, :L10
  .line 387
    check-cast p4, Landroid/webkit/WebView;
  .line 388
    new-instance p2, Lcom/agy/browser/NativeBrowserManager$12;
    invoke-direct { p2, p0, p4, p1 }, Lcom/agy/browser/NativeBrowserManager$12;-><init>(Lcom/agy/browser/NativeBrowserManager;Landroid/webkit/WebView;Ljava/lang/String;)V
    invoke-virtual { v0, p2 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  :L9
  .line 394
    goto :L11
  :L10
  .line 384
    add-int/lit8 p3, p3, 1
    goto :L8
  :L11
  .line 400
    goto :L13
  :L12
  .line 398
    move-exception p1
  .line 399
    new-instance p2, Ljava/lang/StringBuilder;
    invoke-direct { p2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string p3, "Failed to notify web state: "
    invoke-virtual { p2, p3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    invoke-virtual { p1 }, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p2, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    const-string p2, "NativeBrowserManager"
    invoke-static { p2, p1 }, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
  :L13
  .line 401
    return-void
.end method

.method public open(Ljava/lang/String;FFFF)V
  .registers 14
  .line 77
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v2
  .line 78
    if-nez v2, :L0
  .line 79
    const-string p1, "NativeBrowserManager"
    const-string p2, "Cannot open native browser: activity is null"
    invoke-static { p1, p2 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
  .line 80
    return-void
  :L0
  .line 83
    new-instance v0, Lcom/agy/browser/NativeBrowserManager$1;
    move-object v1, p0
    move-object v7, p1
    move v3, p2
    move v4, p3
    move v5, p4
    move v6, p5
    invoke-direct/range { v0 .. v7 }, Lcom/agy/browser/NativeBrowserManager$1;-><init>(Lcom/agy/browser/NativeBrowserManager;Landroid/app/Activity;FFFFLjava/lang/String;)V
    invoke-virtual { v2, v0 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 98
    return-void
.end method

.method public reload()V
  .registers 3
  .line 166
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v0
  .line 167
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-nez v1, :L0
    goto :L1
  :L0
  .line 168
    new-instance v1, Lcom/agy/browser/NativeBrowserManager$7;
    invoke-direct { v1, p0 }, Lcom/agy/browser/NativeBrowserManager$7;-><init>(Lcom/agy/browser/NativeBrowserManager;)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 176
    return-void
  :L1
  .line 167
    return-void
.end method

.method public setActivity(Landroid/app/Activity;)V
  .registers 3
  .line 53
    if-eqz p1, :L0
  .line 54
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mActivityRef:Ljava/lang/ref/WeakReference;
  :L0
  .line 56
    return-void
.end method

.method public setBounds(FFFF)V
  .registers 12
  .line 101
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v2
  .line 102
    if-eqz v2, :L1
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-nez v0, :L0
    goto :L1
  :L0
  .line 104
    new-instance v0, Lcom/agy/browser/NativeBrowserManager$2;
    move-object v1, p0
    move v3, p1
    move v4, p2
    move v5, p3
    move v6, p4
    invoke-direct/range { v0 .. v6 }, Lcom/agy/browser/NativeBrowserManager$2;-><init>(Lcom/agy/browser/NativeBrowserManager;Landroid/app/Activity;FFFF)V
    invoke-virtual { v2, v0 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 110
    return-void
  :L1
  .line 102
    return-void
.end method

.method public setVisible(Z)V
  .registers 4
  .line 113
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v0
  .line 114
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-nez v1, :L0
    goto :L1
  :L0
  .line 116
    new-instance v1, Lcom/agy/browser/NativeBrowserManager$3;
    invoke-direct { v1, p0, p1 }, Lcom/agy/browser/NativeBrowserManager$3;-><init>(Lcom/agy/browser/NativeBrowserManager;Z)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 122
    return-void
  :L1
  .line 114
    return-void
.end method

.method setVisibleInternal(Z)V
  .registers 4
  .line 341
    iput-boolean p1, p0, Lcom/agy/browser/NativeBrowserManager;->mIsVisible:Z
  .line 342
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-eqz v0, :L2
  .line 343
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-eqz p1, :L0
    const/4 v1, 0
    goto :L1
  :L0
    const/16 v1, 8
  :L1
    invoke-virtual { v0, v1 }, Landroid/webkit/WebView;->setVisibility(I)V
  .line 344
    if-eqz p1, :L2
  .line 345
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->bringToFront()V
  .line 346
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->requestFocus()Z
  :L2
  .line 349
    return-void
.end method

.method public stopLoading()V
  .registers 3
  .line 179
    invoke-direct { p0 }, Lcom/agy/browser/NativeBrowserManager;->getActivity()Landroid/app/Activity;
    move-result-object v0
  .line 180
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-nez v1, :L0
    goto :L1
  :L0
  .line 181
    new-instance v1, Lcom/agy/browser/NativeBrowserManager$8;
    invoke-direct { v1, p0 }, Lcom/agy/browser/NativeBrowserManager$8;-><init>(Lcom/agy/browser/NativeBrowserManager;)V
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
  .line 189
    return-void
  :L1
  .line 180
    return-void
.end method

.method updateBoundsInternal(Landroid/app/Activity;FFFF)V
  .registers 7
  .line 316
    iget-object v0, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    if-nez v0, :L0
    return-void
  :L0
  .line 318
    invoke-virtual { p1 }, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
  .line 319
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F
  .line 321
    mul-float p2, p2, p1
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p2
  .line 322
    mul-float p3, p3, p1
    invoke-static { p3 }, Ljava/lang/Math;->round(F)I
    move-result p3
  .line 323
    mul-float p4, p4, p1
    invoke-static { p4 }, Ljava/lang/Math;->round(F)I
    move-result p4
    const/4 v0, 0
    invoke-static { v0, p4 }, Ljava/lang/Math;->max(II)I
    move-result p4
  .line 324
    mul-float p5, p5, p1
    invoke-static { p5 }, Ljava/lang/Math;->round(F)I
    move-result p1
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 326
    iget-object p5, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
    const v0, 8388659
    if-nez p5, :L1
  .line 327
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct { p2, p4, p1, v0 }, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V
    iput-object p2, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
    goto :L2
  :L1
  .line 329
    iget-object p5, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
    iput p4, p5, Landroid/widget/FrameLayout$LayoutParams;->width:I
  .line 330
    iget-object p4, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
    iput p1, p4, Landroid/widget/FrameLayout$LayoutParams;->height:I
  .line 331
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I
  .line 332
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I
  .line 333
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
  :L2
  .line 336
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    iget-object p2, p0, Lcom/agy/browser/NativeBrowserManager;->mLayoutParams:Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual { p1, p2 }, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 337
    iget-object p1, p0, Lcom/agy/browser/NativeBrowserManager;->mWebView:Landroid/webkit/WebView;
    invoke-virtual { p1 }, Landroid/webkit/WebView;->requestLayout()V
  .line 338
    return-void
.end method
