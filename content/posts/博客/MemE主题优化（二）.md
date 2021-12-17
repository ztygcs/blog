---
title: "MemE主题优化（二）"
date: 2019-11-27T21:55:38+08:00
draft: false
toc: true
tags: [MemE,Hugo]
dropCap: false
---

## 字体排版

> 说明：任何一项留空，浏览器都会回退到主体字体 `fontFamilyBody`，故没必要全部设置。此外，如果你的品牌栏用的 SVG，则可留空品牌栏字体。
	
### 品牌栏
```toml
fontFamilySiteBrand = "'Liu Jian Mao Cao', cursive"
```	
### 菜单栏
```toml
fontFamilyMenu = ""
```	
### 各类标题

> 文章标题、文章副标题、列表标题、列表的年份和月份标题、相关文章标题、文章上下篇标题

```toml
#fontFamilyTitle = "Comfortaa, sans-serif"
fontFamilyTitle = "'Cinzel Decorative', 'Noto Serif SC', serif"
```
### 目录、分节标题
> 分节标题、目录标题


```toml
#fontFamilyHeadings = "Comfortaa, sans-serif"
fontFamilyHeadings = "'Cinzel Decorative', 'Noto Serif SC', serif"
```	
### 代码、上标
> 代码、上标、文章元信息、文章更新徽章、文章的 Git 版本信息、极简页脚


```toml
#fontFamilyCode = "'Source Code Pro', monospace"
fontFamilyCode = "'Source Code Pro', 'Noto Serif SC', monospace"
```
### 引用
```toml
fontFamilyQuote = "'EB Garamond', 'STKaiti', 'KaiTi', 'SimKai', 'Noto Serif SC', serif"
```
### 文章目录
```toml
fontFamilyTOC = ""
```
### 说明文字
```toml
fontFamilyCaption = ""
```	
### 页脚
```toml
fontFamilyFooter = "'Ma Shan Zheng', cursive"
```	
### 主体
```toml
fontFamilyBody = "'EB Garamond', 'Noto Serif SC', serif"
```
### 网络字体链接
```toml
fontsLink = "https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,700,700i|Noto+Serif+SC:400,700|Source+Code+Pro:400,400i,700,700i|Cinzel+Decorative:700|Ma+Shan+Zheng:|Liu+Jian+Mao+Cao:&display=swap&subset=chinese-simplified"
```   
#### 具体设置方式
 进入https://fonts.google.com/ 之后，搜索或选择喜欢的字体库
![](/images/tech/2019/11/FontSelect.png "选择字体")
点击加号，在屏幕右下角的弹框的`CUSTOMIZE`标签中进一步选择
![](/images/tech/2019/11/FontSelect2.png "勾选所需风格")
点击`EMBED`标签
![](/images/tech/2019/11/FontSelect3.png "生成链接")
这里有生成的字体链接：

`https://fonts.googleapis.com/css?family=Noto+Serif+SC:300,400,500,700&display=swap&subset=chinese-simplified`以及设置字体时填入的参数` 'Noto Serif SC', serif`

例如，假设你的字体链接为`fontsLink = "https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,700,700i|Noto+Serif+SC:400,700|Source+Code+Pro:400,400i,700,700i|Cinzel+Decorative:700&display=swap&subset=chinese-simplified"`

现在你想给页脚`fontFamilyFooter`配置另一种字体，比如`ZCOOL XiaoWei`，去网站选择之后生成的信息如下：
![](/images/tech/2019/11/FontSelect4.png "example")
现在你需要在原来的字体链接`&display=swap&subset=chinese-simplified`的前面加上`|ZCOOL+XiaoWei:`，然后设置`fontFamilyFooter = "'ZCOOL XiaoWei', serif"`，在本地预览一下，应该成功了！(注意观察上图生成的代码和你添加到配置文件中的区别)

> 说明：要想读者一定体验到你设置的字体，最好采用网络字体。MemE 主题目前仅支持Google Fonts 的链接，请前往 https://fonts.google.com/ 获取。此项留空，则不会采用网络字体。

### 字号（单位：px）
```toml
fontSize = 16
```

## 行间距
```toml
lineHeight = 2
```
> 说明：只会应用到文章的段落和目录

## 段首缩排
```toml
# 是否开启
enableParagraphIndent = true

# 分段样式（全局设置）
paragraphStyle = "margin"
```
> 说明：段间距式（margin）或段首缩排（indent）文章的 Front Matter 中 `indent`的优先级高于此处

## 两端对齐
```toml
# 是否开启（全局设置）
enableJustify = true
```
> 说明：文章的 Front Matter 中的 `align`的优先级高于此处

## 首字下沉
```toml
# 是否开启（全局设置）
enableDropCap = true
```
> 说明：文章的 Front Matter 中的 `dropCap`的优先级高于此处

```toml
# 是否在每一分隔线之后首字下沉（全局设置）
enableDropCapAfterHr = false
```
> 说明：文章的 Front Matter 中的 `dropCapAfterHr`的优先级高于此处

   
```toml
# 是否删除首字下沉前的分隔线（全局设置）
deleteHrBeforeDropCap = false
```
> 说明：文章的 Front Matter 中的 `deleteHrBeforeDropCap`的优先级高于此处

## 大型小写（英文）
```toml
# 是否开启（全局设置）
enableSmallCaps = false
```
> 说明：只会应用到分节标题和目录标题文章的 Front Matter 中的 `smallCaps`的优先级高于此处

## 着重号

> 说明：MemE 主题自创的新 Markdown, 语法为在内容左右两边分别加上两个半角状态下的点`..`

```toml
# 是否开启
enableEmphasisPoint = true
```

## 文章版权
```toml
#是否开启
enablePostCopyright = true

displayPostCopyright = false
```
> 说明：文章的 Front Matter 中的 `displayCopyright`的优先级高于此处

## 文章更新徽章
```toml
# 是否开启
enablePostUpdatedBadge = true

# 是否显示（全局设置）
displayUpdatedBadge = true   
```
> 说明：文章的 Front Matter 中的 `badge`的优先级高于此处
	
   
```toml
# 是否添加 `title`
enableBadgeTitle = true
# `title` 的前缀
badgeTitlePrefix = "Updated @ "
```

## 相关文章
```	toml
# 是否开启
enableRelatedPosts = true

# 是否显示（全局设置）
displayRelatedPosts = true
```
> 说明：文章的 Front Matter 中的 `related`的优先级高于此处

```toml
# 相关文章数
relatedPostsNumber = 5
# 相关文章标题右边的图标
relatedPostsIcon = "plus-circle"
```
### 文章标签
```toml
# 是否开启
enablePostTags = true
# 标签图标
postTagsIcon = "tag"
```

### 文章上下篇
> 说明：在 MemE 主题中，文章上下篇是从空间位置角度设计的，而不是像大多数其它主题所做的那样——从时间角度设计。因此，如果你点击左边的上篇，跳转的是一篇更新的文章；如果你点击右边的下篇，跳转的是一篇更旧的文章。


```toml
# 是否开启
enablePostNav = true

# 是否仅限于相同的文章分区
postNavInSection = false
```
## 页脚
```toml
# 是否开启
enableFooter = true
```
> 说明：「诗意人生」和「视频片段」首页布局的首页没有页脚


```toml
# 是否显示版权符号（©）
displayCopyrightSymbol = true

# 是否显示站点的创建年份
displaySiteCreatedYear = true

# Leave it empty("") if you don’t wantthe icon
# 年份与作者之间的图标
iconBetweenYearAndAuthor = "heart"
iconColor = "#e93448"

# 是否开启图标的跳动效果
iconAnimation = true

# 是否显示 Hugo 和 MemE 的链接
displayPoweredBy = true

# 是否显示站点的版权信息
displaySiteCopyright = true

# 自定义页脚（支持 Markdown）
customFooter = ""
```

## 极简页脚
```toml
# 是否开启
enableMinimalFooter = true

# 是否开启关于页面的极简页脚
enableAboutPageMinimalFooter = true
```

## 返回顶部按钮
```toml
# 是否开启
enableBackToTop = true
# 是否在首页显示
displayBackToTopInHome = true
# 按钮图标
backToTopIcon = "arrow-up"
```

## 多语言
```toml
# 是否开启多语言按钮
enableLangToggle = true

# 是否在首页隐藏多语言按钮
hideLangToggleInHome = false

# 是否自动隐藏多语言按钮
autoHideLangToggle = false
```
> 说明：即仅当该文章有相应的翻译版本时才显示按钮


## back-to-top样式
在文件{{<filename back-to-top.scss>}}中：

> ~~文件原始位置：`\themes\meme\assets\scss\_common\back-to-top.scss`~~
>
> 文件位置更新为：`\themes\meme\assets\scss\components\back-to-top.scss`
```scss
.back-to-top {
    font-size: 120%;
    color: var(--color-contrast-medium);
    position: fixed;
    bottom: 1.2em;
    right: 1.2em;
    z-index: 1;
}
```

## 归档、分类及标签页样式

### 归档样式代码：
在文件{{<filename list.scss>}}中：

> ~~文件原始位置：`\themes\meme\assets\scss\_common\list.scss`~~
>
> 文件位置更新为：`\themes\meme\assets\scss\layout\list.scss`
```scss
//归档页总标题（posts）
.list-title {
    text-align: center;
}
//归档页文章列表
.list {
    ul {
        list-style: none;
        padding: 0;
    }
}
//文章列表
.list-item {
    line-height: 2;
    position: relative;
    transition: border $duration;
    border-bottom: 1px dashed var(--color-contrast-low);
    margin-top: 1em;
    padding-bottom: 0.5em;
    display: flex;
    align-items: baseline;
    &:hover {
        border-bottom-color: var(--color-primary);
        ::before {
            background: var(--color-primary);
        }
    }
    ::before {
        content: " ";
        position: absolute;
        left: 0.618em;
        top: 0.618em;
        width: $fontSize / 3;
        height: $fontSize / 3;
        background: var(--color-contrast-low);
        border-radius: 50%;
        border: 1px solid var(--color-bg);
        transition: background $duration;
        font-size: $fontSize;
    }
}
//列表中文章标题
.list-item-title {
    margin: 0 0.618em 0 2em;
    font-size: 1.1em;
    line-height: 1.2;
}
//列表中时间
.list-item-time {
    margin: 0 0.618em 0 2em;
    color: var(--color-contrast-medium);
    line-height: 1.2;
}
//年份
.list-year {
    display: flex;
    justify-content: space-between;
    align-items: baseline;
}
```

### 分类样式代码：
> 文件位置：`\themes\meme\assets\scss\pages\_tree-categories.scss`
```scss
.category-item {
    color: #02a1ff;
    font-size: 1.2em;
    &:hover {
        color: blueviolet;
    }
}
.category-count {
    color: var(--color-contrast-medium);
}
```

### 标签样式代码：
> 文件位置：`\themes\meme\assets\scss\pages\_tag-cloud.scss`
```scss
.tag-cloud {
    text-align: center;
}
.tag-cloud-item {
    margin: ($fontSize * 0.5);
    display: inline-block;
}
```

## 多媒体
### audio标签
```html
<!--通过<audio>标签插入-->
<audio controls height="100" width="100" style="clear:both;display:block;margin:auto">
  <source src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/audios/Lame.mp3" type="audio/mpeg">
  <embed height="50" width="100" src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/audios/Lame.mp3">
</audio>
```
<hr>
DEMO:

<audio controls height="100" width="100" style="clear:both;display:block;margin:auto">
  <source src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/audios/Lame.mp3" type="audio/mpeg">
  <embed height="50" width="100" src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/audios/Lame.mp3">
</audio>

### video标签
```html
<video poster="https://zccon.oss-cn-beijing.aliyuncs.com/images/%E5%A4%A9%E6%89%8D%E5%B0%91%E5%A5%B3.png" controls>
<source src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/videos/GeniusGirl.mp4">
</video>
```
<hr>
DEMO:

<video poster="https://zccon.oss-cn-beijing.aliyuncs.com/images/%E5%A4%A9%E6%89%8D%E5%B0%91%E5%A5%B3.png" controls>
<source src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/videos/GeniusGirl.mp4">
</video>


### 网易云外链方式添加音乐

在网页版[网易云音乐](https://www.baidu.com/link?url=rMp-eLGywbp55zR56zgyg3mbCHH4-y1cFGrhdaBOeJi&wd=&eqid=885cca3900008090000000065de22b10)中搜索需要的歌（不支持 ..无版权.. 或 ..会员.. 歌曲）

![](/images/tech/2019/11/towers.png "搜索需要的歌")

点击`生成外链播放器`

![](/images/tech/2019/11/towers2.png "生成链接")

将生成的代码直接复制到文章中即可：（`width`和`height`自己调整）

<hr>
DEMO:

```html
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=100% height=86 src="//music.163.com/outchain/player?type=2&id=167732&auto=0&height=66"></iframe>
```
效果：

<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=100% height=86 src="//music.163.com/outchain/player?type=2&id=167732&auto=0&height=66"></iframe>

## 自定义

### 诗歌引用格式
{{< notice notice-note>}}
内容来自[这里](https://guanqr.com/tech/website/hugo-shortcodes-customization/#quote-center)
{{< /notice >}}

新建 {{<filename quote-center.html>}} 文件，其内容如下：
> 文件位置：`blog\layouts\shortcodes`文件夹下

```html
<blockquote class="quote-center">
    {{- $content := .Inner | markdownify -}}
    {{- if not (strings.HasPrefix $content "<p>") }}
        {{ printf `<p>%s</p>` $content | safeHTML }}
    {{- else }}
        {{- $content }}
    {{- end -}}
</blockquote> 
```

接着在文件 {{<filename  custom.scss>}} 中添加样式：
> 文件位置：`\themes\meme\assets\scss\custom\_custom.scss`

```css
blockquote.quote-center {
    position: relative;
    border-left: none;
    padding-left: 0;
    border-top: 1px solid var(--color-contrast-lower);
    border-bottom: 1px solid var(--color-contrast-lower);
    p{
        text-align: center !important;
        margin-top: 1.5em;
        margin-bottom: 1.5em;
    }
    &::before {
        position: absolute;
        left: 0;
        content: '“';
        color: var(--color-contrast-low);
        font-size: 3em;
        font-weight: bold;
        margin-top: -0.42em;
    }
    &::after {
        position: absolute;
        right: 0;
        content: '”';
        color: var(--color-contrast-low);
        font-size: 3em;
        font-weight: bold;
        margin-top: -0.7em;
    }
}
```

<hr>
DEMO:

语法：

```
{{</* quote-center */>}}
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
{{</* /quote-center */>}}
```

效果：
{{< quote-center >}}
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
{{< /quote-center >}}


### 卡片风格
在文件{{<filename  custom.scss>}}中加入以下样式：

> ~~文件原始位置：`\themes\meme\assets\scss\_custom\custom.scss`~~
> 
> 文件更新位置：`\themes\meme\assets\scss\custom\_custom.scss`
```scss
.mytag{
    position: relative;
    left: 0; right: 0;
    width: 100%;
    height: 100%;
    line-height: 2;
    margin: auto;
    border-radius: 5px;
    background: rgba(255, 255, 255, .2);
    box-shadow: 3px 3px 6px 3px rgba(0, 0, 0, .5);
    overflow: hidden;
}
.mytag::before{
    content: '';
    position: relative;
    left: 0; right: 0;
    filter: blur(20px);
    z-index: -1;
    margin: -30px;
}
```
<hr>
DEMO:

语法：
```html
<div class="mytag">
<p style="margin:25px">
   <b>"少年贪玩，青年迷恋爱情，壮年汲汲于成名成家，暮年自安于自欺欺人。人寿几何，顽铁能炼成的精金，能有多少？但不同程度的锻炼，必有不同程度的成绩；不同程度的纵欲放肆，必积下不同程度的顽劣。"<br />上苍不会让所有幸福集中到某个人身上，得到爱情未必拥有金钱；拥有金钱未必得到快乐；得到快乐未必拥有健康；拥有健康未必一切都会如愿以偿。保持知足常乐的心态才是淬炼心智、净化心灵的最佳途径。一切快乐的享受都属于精神，这种快乐把忍受变为享受，是精神对于物质的胜利，这便是人生哲学。"</b>
</p>
<div style="text-align:right;margin:15px" ><footer>——<cite>杨绛</cite></footer></div>	
</div>
```

效果：
<div class="mytag">
<p style="margin:25px">
   <b>"少年贪玩，青年迷恋爱情，壮年汲汲于成名成家，暮年自安于自欺欺人。人寿几何，顽铁能炼成的精金，能有多少？但不同程度的锻炼，必有不同程度的成绩；不同程度的纵欲放肆，必积下不同程度的顽劣。"<br />上苍不会让所有幸福集中到某个人身上，得到爱情未必拥有金钱；拥有金钱未必得到快乐；得到快乐未必拥有健康；拥有健康未必一切都会如愿以偿。保持知足常乐的心态才是淬炼心智、净化心灵的最佳途径。一切快乐的享受都属于精神，这种快乐把忍受变为享受，是精神对于物质的胜利，这便是人生哲学。"</b>
</p>
<div style="text-align:right;margin:15px" ><footer>——<cite>杨绛</cite></footer></div>	
</div>



### 文字渐变色
在文件{{<filename  custom.scss>}}中添加..渐变..样式：

> ~~文件位置：`\themes\meme\assets\scss\\_custom\custom.scss`~~
>
> 文件位置更新为：`\themes\meme\assets\scss\custom\_custom.scss`
```scss
.colorfulfont {
background: linear-gradient(to right, red,#45ed63);
-webkit-background-clip: text;
color: transparent;
}
```

<hr>
DEMO:

语法：

```html
<font class = "colorfulfont">
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
</font>
```
效果：

<font class = "colorfulfont">
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
</font>

### 添加博客已运行时间

{{< notice notice-note>}}
[参考网址](http://www.vipshan.com/zhoubian/79.html)
{{< /notice >}}

在文件{{<filename  custom.js>}}中添加自定义的js代码
> 文件位置：`\themes\meme\assets\js\custom.js`

```js
//计算博客运行时间（2020.06.03添加）
function siteTime(){
    window.setTimeout("siteTime()", 1000);
    var seconds = 1000
    var minutes = seconds * 60
    var hours = minutes * 60
    var days = hours * 24
    var years = days * 365
    var today = new Date()
    var todayYear = today.getFullYear()
    var todayMonth = today.getMonth() + 1
    var todayDate = today.getDate()
    var todayHour = today.getHours()
    var todayMinute = today.getMinutes()
    var todaySecond = today.getSeconds()
    var t1 = Date.UTC(2019, 11, 26, 19, 06, 00)
    var t2 = Date.UTC(todayYear,todayMonth,todayDate,todayHour,todayMinute,todaySecond)
    var diff = t2-t1
    var diffYears = Math.floor(diff/years)
    var diffDays = Math.floor((diff/days)-diffYears*365)
    var diffHours = Math.floor((diff-(diffYears*365+diffDays)*days)/hours)
    var diffMinutes = Math.floor((diff-(diffYears*365+diffDays)*days-diffHours*hours)/minutes)
    var diffSeconds = Math.floor((diff-(diffYears*365+diffDays)*days-diffHours*hours-diffMinutes*minutes)/seconds)

    if(diffYears==0){
        document.getElementById("sitetime").innerHTML=" "+diffDays+" 天 "+diffHours+" 小时 "+diffMinutes+" 分钟 "+diffSeconds+" 秒"
    }else{
        document.getElementById("sitetime").innerHTML=" "+diffYears+" 年 "+diffDays+" 天 "+diffHours+" 小时 "+diffMinutes+" 分钟 "+diffSeconds+" 秒"
    }
}
    siteTime()
```
其中`var t1 = Date.UTC(2019, 11, 26, 19, 06, 00)`设置为需要计算的起始日期，如时间是：2020年01月01号00点00分00秒则设置为：
```js
var t1 = Date.UTC(2020,01,01,00,00,00)
```
<hr>
DEMO:

```html
运行时间<span id="sitetime" style="color:#fb7312"></span>
```
运行时间<span id="sitetime" style="color:#fb7312"></span>

### 添加hugo-notice
{{< notice notice-note>}}
内容来自[这里](https://guanqr.com/tech/website/hugo-shortcodes-customization/#notice)
{{< /notice >}}

1. 新建文件{{<filename notice.html>}},并输入以下内容。
> 文件位置：`blog\layouts\shortcodes`文件夹下
```html
{{- $noticeType := .Get 0 -}}

{{- $raw := (markdownify .Inner | chomp) -}}

{{- $block := findRE "(?is)^<(?:address|article|aside|blockquote|canvas|dd|div|dl|dt|fieldset|figcaption|figure|footer|form|h(?:1|2|3|4|5|6)|header|hgroup|hr|li|main|nav|noscript|ol|output|p|pre|section|table|tfoot|ul|video)\\b" $raw 1 -}}

{{ $icon := (replace (index $.Site.Data.SVG $noticeType) "icon" "icon notice-icon") }}
<div class="notice {{ $noticeType }}" {{ if len .Params | eq 2 }} id="{{ .Get 1 }}" {{ end }}>
    <div class="notice-title">{{ $icon | safeHTML }}</div>
    {{- if or $block (not $raw) }}{{ $raw }}{{ else }}<p>{{ $raw }}</p >{{ end -}}
</div>
```

2. 在文件{{<filename custom.scss>}}中添加样式：
> 文件位置：`\themes\meme\assets\scss\custom\_custom.scss`
```css
.notice {
    position:relative;
    padding: 1em 1em 1em 2.5em;
    margin-bottom: 1em;
    border-radius: 4px;
    p:last-child {
        margin-bottom: 0;
    }
    .notice-title {
        position: absolute;
        left: 0.8em;
        .notice-icon {
            width: 1.2em;
            height: 1.2em;
        }
    }
    &.notice-warning {
        background: hsla(0, 65%, 65%, 0.15);
        border-left: 5px solid hsl(0, 65%, 65%);
        .notice-title {
            color: hsl(0, 65%, 65%);
        }
    }
    &.notice-info {
        background: hsla(30, 80%, 70%, 0.15);
        border-left: 5px solid hsl(30, 80%, 70%);
        .notice-title {
            color: hsl(30, 80%, 70%);
        }
    }
    &.notice-note {
        background: hsla(200, 65%, 65%, 0.15);
        border-left: 5px solid hsl(200, 65%, 65%);
        .notice-title {
            color: hsl(200, 65%, 65%);
        }
    }
    &.notice-tip {
        background: hsla(140, 65%, 65%, 0.15);
        border-left: 5px solid hsl(140, 65%, 65%);
        .notice-title {
            color: hsl(140, 65%, 65%);
        }
    }
}

[data-theme="dark"] .notice {
    &.notice-warning {
        background: hsla(0, 25%, 35%, 0.15);
        border-left: 5px solid hsl(0, 25%, 35%);
        .notice-title {
            color: hsl(0, 25%, 35%);
        }
    }
    &.notice-info {
        background: hsla(30, 25%, 35%, 0.15);
        border-left: 5px solid hsl(30, 25%, 35%);
        .notice-title {
            color: hsl(30, 25%, 35%);
        }
    }
    &.notice-note {
        background: hsla(200, 25%, 35%, 0.15);
        border-left: 5px solid hsl(200, 25%, 35%);
        .notice-title {
            color: hsl(200, 25%, 35%);
        }
    }
    &.notice-tip {
        background: hsla(140, 25%, 35%, 0.15);
        border-left: 5px solid hsl(140, 25%, 35%);
        .notice-title {
            color: hsl(140, 25%, 35%);
        }
    }
}

```

3. 在{{<filename SVG.toml>}}文件中插入图标
> 文件位置：`\themes\meme\data\SVG.toml
```svg
# Notice Icon
notice-warning = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 576 512"><path d="M570 440c18 32-5 72-42 72H48c-37 0-60-40-42-72L246 24c19-32 65-32 84 0l240 416zm-282-86a46 46 0 100 92 46 46 0 000-92zm-44-165l8 136c0 6 5 11 12 11h48c7 0 12-5 12-11l8-136c0-7-5-13-12-13h-64c-7 0-12 6-12 13z"/></svg>'
notice-info = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 512 512"><path d="M256 8a248 248 0 100 496 248 248 0 000-496zm0 110a42 42 0 110 84 42 42 0 010-84zm56 254c0 7-5 12-12 12h-88c-7 0-12-5-12-12v-24c0-7 5-12 12-12h12v-64h-12c-7 0-12-5-12-12v-24c0-7 5-12 12-12h64c7 0 12 5 12 12v100h12c7 0 12 5 12 12v24z"/></svg>'
notice-note = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 512 512"><path d="M504 256a248 248 0 11-496 0 248 248 0 01496 0zm-248 50a46 46 0 100 92 46 46 0 000-92zm-44-165l8 136c0 6 5 11 12 11h48c7 0 12-5 12-11l8-136c0-7-5-13-12-13h-64c-7 0-12 6-12 13z"/></svg>'
notice-tip = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 512 512"><path d="M504 256a248 248 0 11-496 0 248 248 0 01496 0zM227 387l184-184c7-6 7-16 0-22l-22-23c-7-6-17-6-23 0L216 308l-70-70c-6-6-16-6-23 0l-22 23c-7 6-7 16 0 22l104 104c6 7 16 7 22 0z"/></svg>'

```

<hr>
DEMO:

```
{{</*notice notice-warning*/>}}
This is warning
{{</*/notice*/>}}
```
{{<notice notice-warning>}}
This is warning
{{</notice>}}

```
{{</*notice notice-note*/>}}
This is note
{{</*/notice*/>}}
```
{{<notice notice-note>}}
This is note
{{</notice>}}

```
{{</*notice notice-info*/>}}
This is info
{{</*/notice*/>}}
```
{{<notice notice-info>}}
This is info
{{</notice>}}

```
{{</*notice notice-tip*/>}}
This is tip
{{</*/notice*/>}}
```
{{<notice notice-tip>}}
This is tip
{{</notice>}}



