---
title: 'MemE主题优化（二）'
date: 2019-11-27T21:55:38+08:00
draft: false
toc: true
tags: [MemE, Hugo]
dropCap: false
---

## 字体排版

> 说明：任何一项留空，浏览器都会回退到主体字体 `fontFamilyBody`，故没必要全部设置。此外，如果你的品牌栏用的 SVG，则可留空品牌栏字体。

{{< underline content="品牌栏" color="#ffdd00">}}

```toml
fontFamilySiteBrand = "'Liu Jian Mao Cao', cursive"
```

{{< underline content="菜单栏" color="#ffdd00">}}

```toml
fontFamilyMenu = ""
```

{{< underline content="各类标题" color="#ffdd00">}}

> 文章标题、文章副标题、列表标题、列表的年份和月份标题、相关文章标题、文章上下篇标题

```toml
#fontFamilyTitle = "Comfortaa, sans-serif"
fontFamilyTitle = "'Cinzel Decorative', 'Noto Serif SC', serif"
```

{{< underline content="目录、分节标题" color="#ffdd00">}}

```toml
#fontFamilyHeadings = "Comfortaa, sans-serif"
fontFamilyHeadings = "'Cinzel Decorative', 'Noto Serif SC', serif"
```

{{< underline content="代码、上标" color="#ffdd00">}}

> 代码、上标、文章元信息、文章更新徽章、文章的 Git 版本信息、极简页脚

```toml
#fontFamilyCode = "'Source Code Pro', monospace"
fontFamilyCode = "'Source Code Pro', 'Noto Serif SC', monospace"
```

{{< underline content="引用" color="#ffdd00">}}

```toml
fontFamilyQuote = "'EB Garamond', 'STKaiti', 'KaiTi', 'SimKai', 'Noto Serif SC', serif"
```

{{< underline content="文章目录" color="#ffdd00">}}

```toml
fontFamilyTOC = ""
```

{{< underline content="说明文字" color="#ffdd00">}}

```toml
fontFamilyCaption = ""
```

{{< underline content="页脚" color="#ffdd00">}}

```toml
fontFamilyFooter = "'Ma Shan Zheng', cursive"
```

{{< underline content="主体" color="#ffdd00">}}

```toml
fontFamilyBody = "'EB Garamond', 'Noto Serif SC', serif"
```

{{< underline content="网络字体链接" color="#ffdd00">}}

```toml
fontsLink = "https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,700,700i|Noto+Serif+SC:400,700|Source+Code+Pro:400,400i,700,700i|Cinzel+Decorative:700|Ma+Shan+Zheng:|Liu+Jian+Mao+Cao:&display=swap&subset=chinese-simplified"
```

> 具体设置方式

进入https://fonts.google.com/ 之后，搜索或选择喜欢的字体库
![](/images/tech/2019/11/FontSelect.png '选择字体')
点击加号，在屏幕右下角的弹框的`CUSTOMIZE`标签中进一步选择
![](/images/tech/2019/11/FontSelect2.png '勾选所需风格')
点击`EMBED`标签
![](/images/tech/2019/11/FontSelect3.png '生成链接')

{{< card >}}
这里有生成的字体链接：`https://fonts.googleapis.com/css?family=Noto+Serif+SC:300,400,500,700&display=swap&subset=chinese-simplified`以及设置字体时填入的参数` 'Noto Serif SC', serif`
{{< /card >}}

{{< card >}}
例如，假设你的字体链接为`fontsLink = "https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,700,700i|Noto+Serif+SC:400,700|Source+Code+Pro:400,400i,700,700i|Cinzel+Decorative:700&display=swap&subset=chinese-simplified"`
{{< /card >}}

现在你想给页脚`fontFamilyFooter`配置另一种字体，比如`ZCOOL XiaoWei`，去网站选择之后生成的信息如下：
![](/images/tech/2019/11/FontSelect4.png 'example')

{{< card >}}
现在你需要在原来的字体链接`&display=swap&subset=chinese-simplified`的前面加上`|ZCOOL+XiaoWei:`，然后设置`fontFamilyFooter = "'ZCOOL XiaoWei', serif"`，在本地预览一下，应该成功了！(注意观察上图生成的代码和你添加到配置文件中的区别)
{{< /card >}}

> 说明：要想读者一定体验到你设置的字体，最好采用网络字体。MemE 主题目前仅支持 Google Fonts 的链接，请前往 https://fonts.google.com/ 获取。此项留空，则不会采用网络字体。

{{< underline content="字号（单位：px）" color="#ffdd00">}}

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
# 说明：文章的 Front Matter 中的 `dropCap`的优先级高于此处
enableDropCap = true
# 是否在每一分隔线之后首字下沉（全局设置）
# 说明：文章的 Front Matter 中的 `dropCapAfterHr`的优先级高于此处
enableDropCapAfterHr = false
# 是否删除首字下沉前的分隔线（全局设置）
# 说明：文章的 Front Matter 中的 `deleteHrBeforeDropCap`的优先级高于此处
deleteHrBeforeDropCap = false
```
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

```toml
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

{{< underline content="文章标签" color="#ffdd00">}}

```toml
# 是否开启
enablePostTags = true
# 标签图标
postTagsIcon = "tag"
```

{{< underline content="文章上下篇" color="#ffdd00">}}

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

## back-to-top 样式

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

{{< underline content="归档样式" color="#ffdd00">}}

> 文件位置：`\themes\meme\assets\scss\layout\list.scss`

```scss
// 归档页总标题（posts）
.list-title {
  text-align: center;
}
// 归档页文章列表
.list {
  ul {
    list-style: none;
    padding: 0;
  }
}
// 文章列表
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
    content: ' ';
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
// 列表中文章标题
.list-item-title {
  margin: 0 0.618em 0 2em;
  font-size: 1.1em;
  line-height: 1.2;
}
// 列表中时间
.list-item-time {
  margin: 0 0.618em 0 2em;
  color: var(--color-contrast-medium);
  line-height: 1.2;
}
// 年份
.list-year {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
}
```

{{< underline content="分类样式" color="#ffdd00">}}

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

{{< underline content="标签样式" color="#ffdd00">}}

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

{{< underline content="audio 标签" color="#ffdd00">}}

```html
<!--通过<audio>标签插入-->
<audio controls height="100" width="100" style="clear:both;display:block;margin:auto">
  <source src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/audios/Lame.mp3" type="audio/mpeg" />
  <embed height="50" width="100" src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/audios/Lame.mp3" />
</audio>
```

<hr>
DEMO:

<audio controls height="100" width="100" style="clear:both;display:block;margin:auto">
  <source src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/audios/Lame.mp3" type="audio/mpeg">
  <embed height="50" width="100" src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/audios/Lame.mp3">
</audio>

{{< underline content="video 标签" color="#ffdd00">}}

```html
<video poster="https://zccon.oss-cn-beijing.aliyuncs.com/images/%E5%A4%A9%E6%89%8D%E5%B0%91%E5%A5%B3.png" controls>
  <source src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/videos/GeniusGirl.mp4" />
</video>
```

<hr>
DEMO:

<video poster="https://zccon.oss-cn-beijing.aliyuncs.com/images/%E5%A4%A9%E6%89%8D%E5%B0%91%E5%A5%B3.png" controls>
<source src="https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/videos/GeniusGirl.mp4">
</video>

{{< underline content="网易云外链方式添加音乐" color="#ffdd00">}}

在网页版[网易云音乐](https://www.baidu.com/link?url=rMp-eLGywbp55zR56zgyg3mbCHH4-y1cFGrhdaBOeJi&wd=&eqid=885cca3900008090000000065de22b10)中搜索需要的歌（不支持 ..无版权.. 或 ..会员.. 歌曲）

![](/images/tech/2019/11/towers.png '搜索需要的歌')

点击`生成外链播放器`

![](/images/tech/2019/11/towers2.png '生成链接')

将生成的代码直接复制到文章中即可：（`width`和`height`自己调整）

<hr>
DEMO:

```html
<iframe
  frameborder="no"
  border="0"
  marginwidth="0"
  marginheight="0"
  width="100%"
  height="86"
  src="//music.163.com/outchain/player?type=2&id=167732&auto=0&height=66"
></iframe>
```

效果：

<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=100% height=86 src="//music.163.com/outchain/player?type=2&id=167732&auto=0&height=66"></iframe>

## 自定义
[自定义 Hugo Shortcodes 简码](https://ztygcs.github.io/posts/%E5%8D%9A%E5%AE%A2/%E8%87%AA%E5%AE%9A%E4%B9%89-hugo-shortcodes-%E7%AE%80%E7%A0%81/)