---
title: 'MemE主题优化（一）'
date: 2019-11-27T21:45:38+08:00
draft: false
toc: true
tags: [MemE, Hugo]
dropCap: false
---

## 前言

折腾了两天，总算是把这个博客给搭建起来了 😉😉!

在写这篇文章之前，让我先啰嗦一下，毕竟认真搞了这么久，总有些话想说，想直接看..正文..的同学就..跳过..这段直接到第一章节吧！

首先要感谢 👏 几个博主，第一次看到这个 ..博客主题.. [MemE](https://github.com/reuixiy/hugo-theme-meme) 是从 [reuixiy](https://io-oi.me/) 博客上看到的。第一眼就觉得这个主题特别干净，也就激起了我又一次搭建博客的兴趣（`之前我其实就搭建过一个博客，当时是用hexo搭建的，现在博客还在用，不过由于速度确实不太行，就很少在上面写东西了`）。说实话，我感觉 [reuixiy](https://io-oi.me/) 博主讲得实在太..详细..了，所以感觉自己只是在..照葫芦画瓢..🙃🙃🙃 。

搭建博客的过程很简单，一般都不会有什么问题，所以这里我就写写关于`MemE`主题的各个细节的配置问题:<br/>
..一来..是自己想要更改博客主题样式的时候知道去哪个地方改？怎么改？🖊️<br/>
..二来..可以提供给需要的朋友一些参考，让更多的人加入这个主题中来！❤️<br/>

虽然之前有看过 [reuixiy](https://io-oi.me/) 博主的详细 [站点配置文件](https://github.com/reuixiy/hugo-theme-meme/blob/master/config-examples/en-us/config.toml) ，不过都是英文的，看得实在有点累（我的英文太水了 😐）。虽然基本上都是..见名知义..的，可我觉得还是一份中文的文档 📄 比较适合我。

在更改各个配置的时候我所参考的大部分内容是来自 [Guanqr](https://blog.guanqr.com/) 博主提交到 github 中的{{<filename config.toml>}}文件，里面所有的注释都是中文的，对我来说简直太爽了 😁😁😁！！！。然后有一些博客的写作格式也是从该博主的 [commit](https://github.com/guanqr/blog/commits/master) 中找到的，自己也尝试着动手改改看，效果还不错！

所以，这里就先谢谢这两位博主了 🎉🎉🎉，当然中途出现了一些问题都是从网上找到方法解决的，所以也要感谢那么多给我提供过帮助的博主们！！！🎉🎉🎉

好了，不多说了，步入正题，首先给大家看看我的..博客结构目录..：

## 博客目录结构

```
blog
│
├── archetypes
├── content
├── data
├── layouts
├── public
├── resources
├── static
├── themes
└── config.toml
```

然后我们按照{{<filename config.toml>}}文件的大致内容依次梳理(会有部分内容与原文上下位置..不一致..)，其实大部分设置只需要..更改参数..就可以了，这里我就只把对应的..关键字..给出来，你们去自己的{{<filename config.toml>}}中查找关键字然后自己..更改参数..试试。这里附上我的[{{<filename config.toml>}}](https://github.com/ztygcs/config.toml/blob/master/config.toml)文件。

## 每一分页文章数

```toml
paginate = 6
```

## 代码高亮

```toml
# 代码块
# 是否开启高亮
enableHighlight = true

# 是否开启竖直滚动
enableOverflowY = false
# 最大高度
maxHeight = 20
# 单位：em

# 是否开启复制
enableCopy = true
# 是否开启自动隐藏
enableCopyAutoHide = false
```

## 作者信息

```toml
[author]
    # 名字
    name = "name"
    # 邮箱
    email = "zccon1996@163.com"
    # 座右铭或简介
    motto = "motto"
    # 头像
    avatar = "/icons/apple-touch-icon.png"
    # 网站（默认值：baseURL）
    website = "https://ztygcs.github.io"
    # 推特
    #twitter = ""
```

## 菜单栏

{{< underline content="菜单开关项" color="#ffdd00">}}

> 说明：如果`activeInSection`开启(设置为`true`)，那么当某一文章的分区名是某一菜单项中的 `url` 时，该文章页面中的该菜单项也会被高亮

```toml
# 是否开启菜单栏
enableMenu = true
#  是否在首页显示
displayMenuInHome = true
# 是否按文章分区高亮当前菜单项
activeInSection = true
```

{{< underline content="菜单配置项" color="#ffdd00">}}

MemE 主题支持以下四种菜单：

```toml
# 1. main       顶栏下方的菜单栏
# 2. home       首页的底部链接（适用于「诗意人生」和「视频片段」布局）
# 3. socials    社交栏（关于页面的极简页脚）
# 4. links      链接栏（关于页面的极简页脚）
```

{{< underline content="菜单内的配置说明" color="#ffdd00">}}

```toml
# url           链接地址
# name          文本（留空（""）则无）
# weight        位置
# pre           内链（internal）或外链（external）
# post          图标（留空（""）则无）
# identifier    图标的 Class 名（菜单栏无效）

```

```toml
[menu]
    ## Menu bar
    [[menu.main]]
        url = "/"
        name = "首页"
        weight = 1
        pre = "internal"
        post = "home"
    [[menu.main]]
        url = "/posts/"
        name = "归档"
        weight = 2
        pre = "internal"
        post = "archive"
    [[menu.main]]
        url = "/categories/"
        name = "分类"
        weight = 3
        pre = "internal"
        post = "th"
    [[menu.main]]
        url = "/tags/"
        name = "标签"
        weight = 4
        pre = "internal"
        post = "tags"
    [[menu.main]]
        url = "/about/"
        name = "关于"
        weight = 5
        pre = "internal"
        post = "user-circle"
```

上面代码效果：
![](/images/tech/2019/11/MenuBar.png '菜单栏')

## 顶栏

```toml
# 是否开启
enableHeader = true

# 是否在首页显示
displayHeaderInHome = true
```

{{< underline content="品牌栏（在顶栏内）" color="#ffdd00">}}

![](/images/tech/2019/11/TopBar.png '品牌栏')

> （SVG 图片..文件位置..：`\themes\meme\data\SVG.toml`）

```toml
# siteBrandSVG为true时显示 SVG 图片（请将你的 SVG 放到 `SVG.toml` 文件内，并配置以下项。单位：px）
# siteBrandSVG为false时使用你的站点标题作为默认值，并以文字的形式显示（下方可配置字号和字色。字体到底部的字体部分配置。单位：em）
siteBrandSVG = false
# SVG宽度
siteBrandSVGWidth = 250
# SVG高度
siteBrandSVGHeight = 100
siteBrandSVGFill = "#fff"

siteBrandFontSize = 3
siteBrandFontColor = "#fff"
```

> 注意：背景色和背景图片只能..二选一..

```toml
# 用来设置背景色（hsl 格式）
#siteBrandBackgroundColor = "hsl(240, 8%, 12%)"
# 背景图片
siteBrandBackgroundImage = "linear-gradient(90deg, #f79533 0, #f37055 15%, #ef4e7b 30%, #a166ab 44%, #5073b8 58%, #1098ad 72%, #07b39b 86%, #6dba82 100%)"
```

## 首页布局

MemE 主题有以下四种首页布局：

|  布局   |   说明   |
| :-----: | :------: |
| poetry  | 诗意人生 |
| footage | 视频片段 |
|  posts  | 文章摘要 |
|  page   | 普通页面 |

```toml
#这里设置为文章摘要
homeLayout = "posts"

## 「诗意人生」
# 诗句，支持 Markdown
homePoetry = []
# 底部链接的内间距，单位：em
homeLinksPadding = 1

## 「视频片段」
homePoster = ""
homeVideoWebm = ""
homeVideoMp4 = ""
homeLogo = ""
homeLogoLink = ""
homeTitle = ""
homeMotto = ""
homeDescription = ""
homeKeywords = ""
homeLinksDelimiter = ""
```

## 分类页面

{{< underline content="分类方式" color="#ffdd00">}}

MemE 主题支持以下两种分类方式：

|  分类方式  | 说明 |
| :--------: | :--: |
|  sections  | 分区 |
| categories | 部类 |

> 其中:<br/>
> 分区是基于站点的`content`目录下的文件夹和子文件夹；<br/>
> 部类是基于文章的`Front Matter`。<br/>
> 分类即树状分类，Hexo 是基于文章的 Front Matter，Hugo 则是基于文件系统的结构。由于设计理念的不同，导致了 Hexo 与 Hugo 的这个差异，故在此设计这个选项，以对从 Hexo 过来的用户友好。但是请注意：Hugo 中无法完全实现基于 Front Matter 的树状分类，故如需保留树状分类，建议适应 Hugo 的设计理念——分区。

```
categoryBy = "categories"
```

> 注意：如果你设置为 `sections`，请务必将此配置文件中的类别（taxonomies）中的 `categories` 删除，不然分类页面会失效。

```toml
# 类别
[taxonomies]
category = "categories"
tag = "tags"
```

{{< underline content="分类设置" color="#ffdd00">}}

> 注意：如果你设置 categoryBy 为 `sections`，则无法关闭树状布局

```toml
# 是否开启树状布局
enableTree = true
# 分类页面中是否显示文章标题
displayPosts = false
# 分类页面中是否显示每一分类下的文章数
displayPostsCount = true
```

## 文章分区范围

```toml
# 说明：分区的名字即站点的 content 目录下的文件夹的名字。
# mainSections = ["posts"]

# 是否包括全文内容
includeContent = true
```

> 说明：如果`includeContent`为`false`，则只会包含文章的摘要。关于摘要，Hugo 能按你设置的字数限制自动截取，你也可以在文章中通过` < !--more-- >`(没有空格)手动控制，或者在文章的 Front Matter 中通`summary` 手动指定。其中，应用的优先级顺序：手动指定 > 手动控制 > 自动截取。还需要注意的是，在 MemE 主题自定义的 Atom 和 RSS 的模板中，有一个比手动指定更高的优先级————Front Matter 中的 `description`。

{{< underline content="文章首页摘要字数限制" color="#ffdd00">}}

```toml
summaryLength = 150
```

## 标签页面

```toml
# 是否启用标签云
enableTagCloud = true
# 单位
fontUnit = "em"
# 最大字号
largestFontSize = 2.5
# 最小字号
smallestFontSize = 1
```

## 归档列表页面

```toml
# 宽度;如果留空（""），则用 42 作为默认值,单位：em
listWidth = 36
# 是否显示列表标题
displayListTitle = true
# 日期的格式,请遵循格式 https://gohugo.io/functions/format/
#listDateFormat = "January 2"
listDateFormat = "01 月 02 日"
# 日期的位置(left或right)
listDatePosition = "right"
# 是否按月份分隔列表
groupByMonth = false
# 是否开启十二生肖
chineseZodiac = true
# 是否翻译年份（仅对年份标题有效）
i18nYear = true
# 是否翻译月份（仅对月份标题有效）
i18nMonth = true
```

## 深色模式

{{< underline content="模式设置" color="#ffdd00">}}

```toml
# 是否开启
enableDarkMode = true
# 默认模式 (浅色模式:light或深色模式:dark)
defaultTheme = "light"
# 是否隐藏模式切换开关
hideThemeToggle = false
# 是否在首页隐藏模式切换开关
hideThemeToggleInHome = false
```

> 说明：如果开启了深色模式，即使你隐藏了开关，你的读者依然可能以深色模式阅读你的博客，如果该读者的系统设置为深色模式的话。类似，如果你开启深色模式并将默认模式修改为它，即使你隐藏开关，你的读者依然可能以浅色模式模式阅读你的博客。

{{< underline content="模式颜色" color="#ffdd00">}}

```toml
# 浅色模式的主色
primaryColorLight = "220, 90%, 56%"
# 深色模式的主色
primaryColorDark = "201, 65%, 62%"
```

> 注意：只支持 ..HSL.. 颜色值

## 文章设置

> 说明：<br/> 1.`postWidth`文章的内容宽度如果留空（""），则用 42 作为默认值,单位：em<br/> 2.`original`会影响文章的作者信息和版权信息,文章的 Front Matter 中的 `original`的优先级高于此处

```toml
# 超链接的颜色变化持续时间（单位：秒）
duration = 0.5
# 文章的内容宽度
postWidth = 36
# 文章是否为原创（全局设置）
original = true
# 文章描述是否显示
displayPostDescription = true
```

{{< underline content="文章元信息" color="#ffdd00">}}

|         字段         |                              说明                              |
| :------------------: | :------------------------------------------------------------: |
|    enablePostMeta    | 是否开启（全局）【文章的 Front Matter 中的 meta 优先级高于此】 |
| enablePostMetaInHome |    是否在首页开启【仅对「文章摘要」和「普通页面」布局有效】    |
|  postMetaDateFormat  |   日期格式【请遵循格式 https://gohugo.io/functions/format/】   |

```toml
enablePostMeta = true
enablePostMetaInHome = true
postMetaDateFormat = "2006.1.2"
displayPublishedDate = true # 是否显示发布时间
publishedDateIcon = "calendar-alt" # 发布时间的图标
displayModifiedDate = true # 是否显示修改时间
modifiedDateIcon = "calendar-check" # 修改时间的图标
displayExpiredDate = true # 是否显示过期时间
expiredDateIcon = "calendar-times" # 过期时间的图标
displayCategory = true # 是否显示分类
categoryIcon = "folder" # 分类的图标
categoryDelimiter = "/" # 分类之间的分隔符
displayWordCount = true # 是否显示字数统计
wordCountIcon = "pencil-alt" # 字数统计的图标
displayReadingTime = true # 是否显示阅读时长
readingTimeIcon = "clock" # 阅读时长的图标
```

{{< underline content="文章目录" color="#ffdd00">}}

```toml
# 是否开启（全局设置）【文章的 Front Matter 中的 `toc`的优先级高于此处】
enableTOC = true
# 是否显示目录标题
displayTOCTitle = true
# 是否链接文章的分节标题到目录
linkHeadingsToTOC = true
```

{{< underline content="文章分节标题锚点" color="#ffdd00">}}

```toml
# 是否开启
enableHeadingsAnchor = true
# 分节标题的级别范围【说明：正则格式，默认 1-6，即 1|2|3|4|5|6，即 h1 到 h6。】
headingsOpt = "1-6"
# 锚点符号【说明：锚点图标的优先级高于锚点符号,默认值：§】
anchorSymbol = "#"
# 锚点图标【说明：留空（""）则回退到锚点符号】
anchorIcon = "link"
# 是否开启锚点链接
enableAnchorLink = true
# 是否自动隐藏锚点
enableAnchorAutoHide = true
```

## 图片说明文字

```toml
# 是否开启
enableCaption = true
# 说明文字的前缀
captionPrefix = "◎ "
```

## 图片外链

> 说明：仅在生产环境（production）下渲染只支持相对于网站根目录的绝对链接比如：/images/meme.jpg(~/blog/static/images/meme.jpg)

```toml
# 是否开启
enableImageHost = false
# 图片外链地址
imageHostURL = "https://example.com/"
# 是否将 HTML 的头部元数据中的图片链接也替换为外链
headAlso = false
```

## 视频外链

> 说明：仅在生产环境（production）下渲染只支持相对于站点根目录的绝对链接比如：/videos/meme.mp4

```toml
# 是否开启
enableVideoHost = false
# 视频外链地址
videoHostURL = "https://example.com/"
```

## 脚注

```toml
# 是否用方括号包裹脚注的引用序号
squareBrackets = true
# 替换脚注的返回链接中的文本为图标
footnoteReturnLinkIcon = "angle-up"
```

> 说明：如果不为空（""），则会用图标替换`footnoteReturnLinkContents`

```toml
# 是否自行插入分隔线
insertHrBySelf = true
```

> 说明：如果是，则会将自动生成的分隔线删除。实际上，你自己添加的分隔线会被删除。如果你喜欢在 Markdown 中手动插入`---` 以将文章的正文内容与脚注内容分隔开来，那么这项设置将会非常有用。
