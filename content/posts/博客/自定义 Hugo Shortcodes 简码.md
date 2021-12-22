---
title: '自定义 Hugo Shortcodes 简码'
date: 2021-12-18T17:09:38+08:00
draft: false
toc: true
tags: [Shortcodes, Hugo]
dropCap: false
---

> MemE 通过 Hugo 管道实现使用 SCSS 生成 CSS，而非静态的 CSS 文件，同时提供一个 `\_custom.scss` 文件以供用户定制。
>
> 直接新建一个 ~/blog/assets/scss/custom/\_custom.scss 并将你自己的样式加入其中，就能覆盖主题的 ~/blog/themes/meme/assets/scss/custom/\_custom.scss 文件，且其会正确地被应用。
>
> 事实上，在 Hugo 中你可以覆盖主题的任何模板，见这个非官方的镜像网页：https://gohugobrasil.netlify.com/themes/customizing/

在这里自定义的组件均采用`shortcodes + 自定义样式`的方式实现，其中：

|  文件   |        文件路径 📂        |
| :-----: | :-----------------------: |
| `.html` | ~\blog\layouts\shortcodes |
| `.scss` | ~\blog\assets\scss\custom |

{{<notice tip>}}

1. 文中所涉及到的文件夹\文件若不存在则需自行创建
2. 所有的独立样式文件需要 import 到 `\_custom.scss>` 文件中
3. 具体使用方法请查看每个组件的详细使用教程

{{</notice>}}

[参考：《自定义 Hugo Shortcodes 简码》](https://guanqr.com/tech/website/hugo-shortcodes-customization/#quote-center)

## 排版

1. 在`blog\layouts\shortcodes\align.html`中增加以下内容：

```html
<p style="text-align:{{ index .Params 0 }}">{{ index .Params 1 | markdownify }}</p>
```

2. 示例：

```html
{{</* align left "文字居左" */>}}
```

{{< align left "文字居左" >}}

```html
{{</* align center "文字居中" */>}}
```

{{< align center "文字居中" >}}

```html
{{</* align right "文字居右" */>}}
```

{{< align right "文字居右" >}}

## 下划线

1. 在`blog\layouts\shortcodes\underline.html`中增加以下内容：

```html
<span style="border-bottom: {{ .Get "color" }} 2px solid">
  {{ .Get "content" }}
</span>
```

2. 示例

```html
{{</* underline color="#ffdd00" content="谁在用琵琶弹奏一曲东风破" */>}}
<br/>
{{</* underline color="#ff2200" content="岁月在墙上剥落看见小时候" */>}}
```

{{< underline color="#ffdd00" content="谁在用琵琶弹奏一曲东风破" >}}
<br/>
{{< underline color="#ff2200" content="岁月在墙上剥落看见小时候" >}}

## 诗歌引用

1. 在`blog\layouts\shortcodes\quote-center.html`中增加以下内容：

```html
<blockquote class="quote-center">
  {{- $content := .Inner | markdownify -}} {{- if not (strings.HasPrefix $content "
  <p>") }} {{ printf `</p>
  <p>%s</p>
  ` $content | safeHTML }} {{- else }} {{- $content }} {{- end -}}
</blockquote>
```

2. 在 `\blog\assets\scss\custom\_shortcodes.scss` 中增加以下内容：

```scss
// 诗歌引用格式
blockquote.quote-center {
  position: relative;
  border-left: none;
  padding-left: 0;
  border-top: 1px solid var(--color-contrast-lower);
  border-bottom: 1px solid var(--color-contrast-lower);
  p {
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

3. 在`\blog\assets\scss\custom\_custom.scss`中导入样式

```scss
@import 'shortcodes';
```

4. 示例：

```html
{{</* quote-center */>}}
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
{{</* /quote-center */>}}
```

{{< quote-center >}}
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
{{< /quote-center >}}

## 卡片

1. 在`blog\layouts\shortcodes\card.html`中增加以下内容：

```html
{{- $raw := (markdownify .Inner | chomp) -}} {{- $block := findRE
"(?is)^<(?:address|article|aside|blockquote|canvas|dd|div|dl|dt|fieldset|figcaption|figure|footer|form|h(?:1|2|3|4|5|6)|header|hgroup|hr|li|main|nav|noscript|ol|output|p|pre|section|table|tfoot|ul|video)\\b"
$raw 1 -}}
<div class="mycard">
  <div class="content">{{- if or $block (not $raw) }}{{ $raw }}{{ else }} {{ $raw }} {{ end -}}</div>
</div>
```

2. 在 `\blog\assets\scss\custom\_card.scss` 中增加以下内容：

```scss
// 卡片样式
.mycard {
  padding: 10px 20px;
  margin: 20px 0;
  border-radius: 4px;
  word-break: break-all;
  background: transparent;
  box-shadow: 0 6px 10px 0 alpha(var(--color-contrast-high), 0.15);
  .content {
    line-height: 30px;
  }
}
```

3. 在`\blog\assets\scss\custom\_custom.scss`中导入样式

```scss
@import 'card';
```

4. 示例：

```html
{{</* card */>}}
缓缓飘落的枫叶像思念
<br />
我点燃烛火温暖岁末的秋天
{{</* /card */>}}
```

{{< card >}}
缓缓飘落的枫叶像思念
<br />
我点燃烛火温暖岁末的秋天
{{< /card >}}

## 文字渐变

1. 在 `\blog\assets\scss\custom\_colorfont.scss` 中增加以下内容：

```scss
.colorfulfont {
  background: linear-gradient(to right, red, #45ed63);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
}
```

2. 在`\blog\assets\scss\custom\_custom.scss`中导入样式

```scss
@import 'colorfont';
```

3. 示例：

```html
<font class="colorfulfont"> 伟大的小丑帕格里亚齐来了<br />去看他的表演吧<br />他能让你振作起来 </font>
```

<font class = "colorfulfont">
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
</font>

## hugo-notice

1. 在`blog\layouts\shortcodes\notice.html`中增加以下内容：

```html
<!--https://github.com/martignoni/hugo-notice-->
{{- $noticeType := .Get 0 -}} {{- $raw := (markdownify .Inner | chomp) -}} {{- $block := findRE
"(?is)^<(?:address|article|aside|blockquote|canvas|dd|div|dl|dt|fieldset|figcaption|figure|footer|form|h(?:1|2|3|4|5|6)|header|hgroup|hr|li|main|nav|noscript|ol|output|p|pre|section|table|tfoot|ul|video)\\b"
$raw 1 -}} {{ $icon := (replace (index $.Site.Data.SVG $noticeType) "icon" "icon notice-icon") }}
<div class="notice {{ $noticeType }}" {{ if len .Params | eq 2 }} id="{{ .Get 1 }}" {{ end }}>
  <div class="notice-title">{{ $icon | safeHTML }}</div>
  {{- if or $block (not $raw) }}{{ $raw }}{{ else }}
  <p>{{ $raw }}</p>
  {{ end -}}
</div>
```

2. 在 `\blog\assets\scss\custom\_shortcodes.scss` 中增加以下内容：

```scss
.notice {
  position: relative;
  padding: 1em 1em 1em 2.5em;
  margin: 1em 0;
  border-radius: 4px;
  box-shadow: 0 6px 10px 0 alpha(var(--color-contrast-high), 0.15);
  p:last-child {
    margin: 0;
  }
  .notice-title {
    position: absolute;
    left: 0.8em;
    .notice-icon {
      width: 1.2em;
      height: 1.2em;
    }
  }
  &.error {
    background: hsla(0, 65%, 65%, 0.25);
    border-left: 5px solid hsl(0, 65%, 55%);
    word-break: break-all;
    .notice-title {
      color: hsl(0, 65%, 55%);
    }
  }
  &.warning {
    background: hsla(30, 80%, 70%, 0.25);
    border-left: 5px solid hsl(30, 80%, 55%);
    word-break: break-all;
    .notice-title {
      color: hsl(30, 80%, 55%);
    }
  }
  &.tip {
    background: hsla(200, 65%, 65%, 0.25);
    border-left: 5px solid hsl(200, 65%, 55%);
    word-break: break-all;
    .notice-title {
      color: hsl(200, 65%, 55%);
    }
  }
  &.success {
    background: hsla(140, 65%, 65%, 0.25);
    border-left: 5px solid hsl(140, 65%, 55%);
    word-break: break-all;
    .notice-title {
      color: hsl(140, 65%, 55%);
    }
  }
}

[data-theme='dark'] .notice {
  &.error {
    background: hsla(0, 29%, 41%, 0.65);
    border-left: 5px solid hsl(0, 67%, 50%);
    .notice-title {
      color: hsl(0, 67%, 50%);
    }
  }
  &.warning {
    background: hsla(28, 46%, 58%, 0.493);
    border-left: 5px solid hsl(30, 72%, 50%);
    .notice-title {
      color: hsl(30, 72%, 50%);
    }
  }
  &.tip {
    background: hsla(200, 56%, 55%, 0.548);
    border-left: 5px solid hsl(200, 74%, 57%);
    .notice-title {
      color: hsl(200, 74%, 57%);
    }
  }
  &.success {
    background: hsla(140, 35%, 44%, 0.603);
    border-left: 5px solid hsl(140, 73%, 55%);
    .notice-title {
      color: hsl(140, 73%, 55%);
    }
  }
}
```

3. 在`\blog\assets\scss\custom\_custom.scss`中导入样式（若前面已导入则无需重复导入）

```scss
@import 'shortcodes';
```

4. 在`\themes\meme\data\SVG.toml`文件中插入图标

```svg
# Notice Icon
error = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 576 512"><path d="M570 440c18 32-5 72-42 72H48c-37 0-60-40-42-72L246 24c19-32 65-32 84 0l240 416zm-282-86a46 46 0 100 92 46 46 0 000-92zm-44-165l8 136c0 6 5 11 12 11h48c7 0 12-5 12-11l8-136c0-7-5-13-12-13h-64c-7 0-12 6-12 13z"/></svg>'
warning = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 512 512"><path d="M256 8a248 248 0 100 496 248 248 0 000-496zm0 110a42 42 0 110 84 42 42 0 010-84zm56 254c0 7-5 12-12 12h-88c-7 0-12-5-12-12v-24c0-7 5-12 12-12h12v-64h-12c-7 0-12-5-12-12v-24c0-7 5-12 12-12h64c7 0 12 5 12 12v100h12c7 0 12 5 12 12v24z"/></svg>'
tip = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 512 512"><path d="M504 256a248 248 0 11-496 0 248 248 0 01496 0zm-248 50a46 46 0 100 92 46 46 0 000-92zm-44-165l8 136c0 6 5 11 12 11h48c7 0 12-5 12-11l8-136c0-7-5-13-12-13h-64c-7 0-12 6-12 13z"/></svg>'
success = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 512 512"><path d="M504 256a248 248 0 11-496 0 248 248 0 01496 0zM227 387l184-184c7-6 7-16 0-22l-22-23c-7-6-17-6-23 0L216 308l-70-70c-6-6-16-6-23 0l-22 23c-7 6-7 16 0 22l104 104c6 7 16 7 22 0z"/></svg>'
```

5. 示例：

```
{{</*notice error*/>}}This is error{{</*/notice*/>}}
```

{{<notice error>}}This is error{{</notice>}}

```
{{</*notice tip*/>}}This is tip{{</*/notice*/>}}
```

{{<notice tip>}}This is tip{{</notice>}}

```
{{</*notice warning*/>}}This is warning{{</*/notice*/>}}
```

{{<notice warning>}}This is warning{{</notice>}}

```
{{</*notice success*/>}}This is success{{</*/notice*/>}}
```

{{<notice success>}}This is success{{</notice>}}

## github 风格

1. 在`blog\layouts\shortcodes\github.html`中增加以下内容：

```html
<div class="github">
    <div class="logo">
        {{ replace $.Site.Data.SVG.repository "icon" "icon github-icon" | safeHTML }}
        <a class="name" href={{ .Get "link" }} target="_blank">{{ .Get "name" }}</a>
    </div>
    <div class="description">{{ .Get "description" }}</div>
    <div class="language">
        <span class="language-color" style="background-color: {{ .Get "color" }}"></span>
        <span class="language-name">{{ .Get "language" }}</span>
    </div>
</div>
```

2. 在 `\blog\assets\scss\custom\_shortcodes.scss` 中增加以下内容：

```scss
.github {
  border: 1px solid var(--color-contrast-low);
  border-radius: 3px;
  margin: 0 auto;
  margin-bottom: 1em;
  padding: 1em;
  .github-icon {
    width: 1.2em;
    height: 1.2em;
    margin-right: 0.5em;
    margin-bottom: 0.2em;
    fill: var(--color-contrast-high);
    transition: all 0.5s;
  }
  .name {
    font-weight: bold;
    color: var(--color-primary);
    text-decoration: none;
  }
  .description {
    margin-top: 0.5em;
    margin-bottom: 1em;
    color: var(--color-contrast-high);
    text-align: justify;
    font-size: 90%;
    transition: all 0.5s;
  }
  .language-color {
    position: relative;
    top: 1px;
    display: inline-block;
    width: 0.75em;
    height: 0.75em;
    border-radius: 50%;
  }
  .language-name {
    color: var(--color-contrast-high);
    font-size: 90%;
    margin-left: 0.5em;
    transition: all 0.5s;
  }
}
```

3. 在`\themes\meme\data\SVG.toml`文件中插入图标

```toml
repository = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 16 16"><path fill-rule="evenodd" clip-rule="evenodd" d="M2 2.5C2 1.83696 2.26339 1.20107 2.73223 0.732233C3.20108 0.263392 3.83696 0 4.5 0L13.25 0C13.4489 0 13.6397 0.0790176 13.7803 0.21967C13.921 0.360322 14 0.551088 14 0.75V13.25C14 13.4489 13.921 13.6397 13.7803 13.7803C13.6397 13.921 13.4489 14 13.25 14H10.75C10.5511 14 10.3603 13.921 10.2197 13.7803C10.079 13.6397 10 13.4489 10 13.25C10 13.0511 10.079 12.8603 10.2197 12.7197C10.3603 12.579 10.5511 12.5 10.75 12.5H12.5V10.5H4.5C4.30308 10.5 4.11056 10.5582 3.94657 10.6672C3.78257 10.7762 3.65442 10.9312 3.57816 11.1128C3.50191 11.2943 3.48096 11.4943 3.51793 11.6878C3.5549 11.8812 3.64816 12.0594 3.786 12.2C3.92524 12.3422 4.0023 12.5338 4.00024 12.7328C3.99818 12.9318 3.91716 13.1218 3.775 13.261C3.63285 13.4002 3.4412 13.4773 3.24222 13.4752C3.04325 13.4732 2.85324 13.3922 2.714 13.25C2.25571 12.7829 1.99929 12.1544 2 11.5V2.5ZM12.5 1.5V9H4.5C4.144 9 3.806 9.074 3.5 9.208V2.5C3.5 2.23478 3.60536 1.98043 3.79289 1.79289C3.98043 1.60536 4.23478 1.5 4.5 1.5H12.5ZM5 12.25V15.5C5 15.5464 5.01293 15.5919 5.03734 15.6314C5.06175 15.6709 5.09667 15.7028 5.1382 15.7236C5.17972 15.7444 5.22621 15.7532 5.27245 15.749C5.31869 15.7448 5.36286 15.7279 5.4 15.7L6.85 14.613C6.89328 14.5805 6.94591 14.563 7 14.563C7.05409 14.563 7.10673 14.5805 7.15 14.613L8.6 15.7C8.63714 15.7279 8.68131 15.7448 8.72755 15.749C8.77379 15.7532 8.82028 15.7444 8.8618 15.7236C8.90333 15.7028 8.93826 15.6709 8.96266 15.6314C8.98707 15.5919 9 15.5464 9 15.5V12.25C9 12.1837 8.97366 12.1201 8.92678 12.0732C8.87989 12.0263 8.81631 12 8.75 12H5.25C5.1837 12 5.12011 12.0263 5.07322 12.0732C5.02634 12.1201 5 12.1837 5 12.25Z"/></svg>'
```

4. 示例：

```html
{{</* github
    name="hugo-theme-meme"
    link="https://github.com/reuixiy/hugo-theme-meme"
    description="MemE 是一个强大且可高度定制的 GoHugo 博客主题，专为个人博客设计。MemE 主题专注于优雅、简约、现代，以及代码的正确性。同时，希望你将像欣赏一个模因一样欣赏 MemE，希望你将像分享一个模因一样分享 MemE，就像你的博客和文章所做的那样😝！"
    color="#E34C26"
    language="HTML"
*/>}}
```

{{< github name="hugo-theme-meme" link="https://github.com/reuixiy/hugo-theme-meme" description="MemE 是一个强大且可高度定制的 GoHugo 博客主题，专为个人博客设计。MemE 主题专注于优雅、简约、现代，以及代码的正确性。同时，希望你将像欣赏一个模因一样欣赏 MemE，希望你将像分享一个模因一样分享 MemE，就像你的博客和文章所做的那样😝！" color="#E34C26" language="HTML" >}}

## 友链样式

1. 在`blog\layouts\shortcodes\friends.html`中增加以下内容：

```html
<div class="blogroll">
  <img class="avatar medium-zoom-image" src="{{ .Get "imgSrc" }}" />
  <a class="friend" href="{{ .Get "blogSrc" }}" target="_blank">
    <div class="name">{{ .Get "name" }}</div>
    <div class="excerpt">{{ .Get "desc" }}</div>
  </a>
</div>
```

2. 在`\blog\assets\scss\custom\_blogroll.scss`中增加以下内容：

```scss
// 友链样式
.blogroll-link::after {
  content: ' ';
  display: block;
  clear: both;
}

.blogroll-link {
  display: grid;
  grid-gap: 0 1.5em;
  grid-template-columns: 1fr 1fr;
}

.blogroll {
  padding: 1em 0;
  border-bottom: 1px dashed var(--color-contrast-low);
  display: flex;
  transition: all 0.5s;
  text-decoration: none !important;
  overflow: hidden;
  .friend {
    text-decoration: none;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
  }
  .name {
    font-weight: bold;
    margin: 0.375em 0;
  }
  .excerpt {
    font-size: 0.875em;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
  }
  .avatar {
    width: 4em !important;
    height: 4em !important;
    border-radius: 8px;
    margin: 0 1em 0 0 !important;
    z-index: 0;
  }
}

@media (max-width: $maxWidth) {
  .blogroll-link {
    grid-template-columns: 1fr;
  }
}
```

3. 示例

```html
{{</* friends
imgSrc="https://ztygcs.github.io/icons/android-chrome-512x512.png"
blogSrc="https://ztygcs.github.io/"
name="一路向北"
desc="学习笔记，生活杂碎"
*/>}}
```

{{< friends
imgSrc="https://ztygcs.github.io/icons/android-chrome-512x512.png"
blogSrc="https://ztygcs.github.io/"
name="一路向北"
desc="学习笔记，生活杂碎" >}}
