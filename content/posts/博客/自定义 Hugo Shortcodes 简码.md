---
title: '自定义 Hugo Shortcodes 简码'
date: 2021-12-18T17:09:38+08:00
draft: false
toc: true
tags: [Shortcodes, Hugo]
dropCap: false
---

> 在这里自定义的组件均采用`shortcodes + 自定义样式`实现，其中：
> .html 文件定义在\blog\layouts\shortcodes 文件夹 📂 下，样式文件定义在\blog\assets\scss\custom 文件夹 📂 下。
> 注意：
> 1. 若不存在对应文件夹则自行创建
> 2. 所有的独立样式文件需要import到_custom.scss文件中
> 3. 具体使用方法请查看每个组件的详细使用教程

{{<notice notice-info>}}

- MemE 通过 Hugo 管道实现使用 SCSS 生成 CSS，而非静态的 CSS 文件，同时提供一个 \_custom.scss 文件以供用户定制。
- 直接新建一个 ~/blog/assets/scss/custom/\_custom.scss 并将你自己的样式加入其中，就能覆盖主题的 ~/blog/themes/meme/assets/scss/custom/\_custom.scss 文件，且其会正确地被应用。
- 事实上，在 Hugo 中你可以覆盖主题的任何模板，见这个非官方的镜像网页：https://gohugobrasil.netlify.com/themes/customizing/
  {{</notice>}}

[参考：《自定义 Hugo Shortcodes 简码》](https://guanqr.com/tech/website/hugo-shortcodes-customization/#quote-center)

## 诗歌引用格式

在`blog\layouts\shortcodes`文件夹📂下新建 {{<filename quote-center.html>}} 文件，其内容如下：

```html
<blockquote class="quote-center">
  {{- $content := .Inner | markdownify -}} {{- if not (strings.HasPrefix $content "
  <p>") }} {{ printf `</p>
  <p>%s</p>
  ` $content | safeHTML }} {{- else }} {{- $content }} {{- end -}}
</blockquote>
```

接着在 `\blog\assets\scss\custom` 文件夹📂下新建{{<filename _shortcodes.scss>}} 文件并写入以下代码

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

在`\blog\assets\scss\custom\_custom.scss`中导入`_shortcodes.scss`

```scss
@import "shortcodes";
```
示例：

```html
{{</* quote-center */>}}
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
{{</* /quote-center */>}}
```

{{< quote-center >}}
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
{{< /quote-center >}}

## 卡片风格

在`blog\layouts\shortcodes`文件夹📂下新建 {{<filename card.html>}} 文件，其内容如下：

```html
{{- $raw := (markdownify .Inner | chomp) -}} {{- $block := findRE
"(?is)^<(?:address|article|aside|blockquote|canvas|dd|div|dl|dt|fieldset|figcaption|figure|footer|form|h(?:1|2|3|4|5|6)|header|hgroup|hr|li|main|nav|noscript|ol|output|p|pre|section|table|tfoot|ul|video)\\b"
$raw 1 -}}
<div class="mycard">
  <div class="content">{{- if or $block (not $raw) }}{{ $raw }}{{ else }} {{ $raw }} {{ end -}}</div>
</div>
```

接着在 `\blog\assets\scss\custom` 文件夹📂下新建{{<filename _card.scss>}} 文件并写入以下代码

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

在`\blog\assets\scss\custom\_custom.scss`中导入`_card.scss`

```scss
@import "card";
```

示例：

```html
{{</* card */>}}
"少年贪玩，青年迷恋爱情，壮年汲汲于成名成家，暮年自安于自欺欺人。人寿几何，顽铁能炼成的精金，能有多少？但不同程度的锻炼，必有不同程度的成绩；不同程度的纵欲放肆，必积下不同程度的顽劣。"<br />上苍不会让所有幸福集中到某个人身上，得到爱情未必拥有金钱；拥有金钱未必得到快乐；得到快乐未必拥有健康；拥有健康未必一切都会如愿以偿。保持知足常乐的心态才是淬炼心智、净化心灵的最佳途径。一切快乐的享受都属于精神，这种快乐把忍受变为享受，是精神对于物质的胜利，这便是人生哲学。"
{{</* /card */>}}
```
{{< card >}}
"少年贪玩，青年迷恋爱情，壮年汲汲于成名成家，暮年自安于自欺欺人。人寿几何，顽铁能炼成的精金，能有多少？但不同程度的锻炼，必有不同程度的成绩；不同程度的纵欲放肆，必积下不同程度的顽劣。"<br />上苍不会让所有幸福集中到某个人身上，得到爱情未必拥有金钱；拥有金钱未必得到快乐；得到快乐未必拥有健康；拥有健康未必一切都会如愿以偿。保持知足常乐的心态才是淬炼心智、净化心灵的最佳途径。一切快乐的享受都属于精神，这种快乐把忍受变为享受，是精神对于物质的胜利，这便是人生哲学。"
{{< /card >}}

## 文字渐变色

在 `\blog\assets\scss\custom` 文件夹📂下新建{{<filename _colorfont.scss>}} 文件并写入以下代码

```scss
// 文字渐变色
.colorfulfont {
  background: linear-gradient(to right, red, #45ed63);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
}
```

在`\blog\assets\scss\custom\_custom.scss`中导入`_colorfont.scss`

```scss
@import "colorfont";
```
示例：

```html
<font class="colorfulfont"> 伟大的小丑帕格里亚齐来了<br />去看他的表演吧<br />他能让你振作起来 </font>
```

<font class = "colorfulfont">
伟大的小丑帕格里亚齐来了<br/>去看他的表演吧<br/>他能让你振作起来
</font>

## 添加博客已运行时间

[参考网址](http://www.vipshan.com/zhoubian/79.html)

在文件`\themes\meme\assets\js\custom.js`中添加自定义的 js 代码

```js
//计算博客运行时间（2020.06.03添加）
function siteTime() {
  window.setTimeout('siteTime()', 1000)
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
  var t2 = Date.UTC(todayYear, todayMonth, todayDate, todayHour, todayMinute, todaySecond)
  var diff = t2 - t1
  var diffYears = Math.floor(diff / years)
  var diffDays = Math.floor(diff / days - diffYears * 365)
  var diffHours = Math.floor((diff - (diffYears * 365 + diffDays) * days) / hours)
  var diffMinutes = Math.floor((diff - (diffYears * 365 + diffDays) * days - diffHours * hours) / minutes)
  var diffSeconds = Math.floor(
    (diff - (diffYears * 365 + diffDays) * days - diffHours * hours - diffMinutes * minutes) / seconds
  )

  if (diffYears == 0) {
    document.getElementById('sitetime').innerHTML =
      ' ' + diffDays + ' 天 ' + diffHours + ' 小时 ' + diffMinutes + ' 分钟 ' + diffSeconds + ' 秒'
  } else {
    document.getElementById('sitetime').innerHTML =
      ' ' + diffYears + ' 年 ' + diffDays + ' 天 ' + diffHours + ' 小时 ' + diffMinutes + ' 分钟 ' + diffSeconds + ' 秒'
  }
}
siteTime()
```

其中`var t1 = Date.UTC(2019, 11, 26, 19, 06, 00)`设置为需要计算的起始日期，如时间是：2020 年 01 月 01 号 00 点 00 分 00 秒则设置为：

```js
var t1 = Date.UTC(2020, 01, 01, 00, 00, 00)
```

<hr>
DEMO:

```html
运行时间<span id="sitetime" style="color:#fb7312"></span>
```

运行时间<span id="sitetime" style="color:#fb7312"></span>

## 添加 hugo-notice

1. 在`blog\layouts\shortcodes`文件夹📂下新建 {{<filename notice.html>}} 文件，其内容如下：

```html
<!--https://github.com/martignoni/hugo-notice-->
{{- $noticeType := .Get 0 -}}

{{- $raw := (markdownify .Inner | chomp) -}}

{{- $block := findRE "(?is)^<(?:address|article|aside|blockquote|canvas|dd|div|dl|dt|fieldset|figcaption|figure|footer|form|h(?:1|2|3|4|5|6)|header|hgroup|hr|li|main|nav|noscript|ol|output|p|pre|section|table|tfoot|ul|video)\\b" $raw 1 -}}

{{ $icon := (replace (index $.Site.Data.SVG $noticeType) "icon" "icon notice-icon") }}
<div class="notice {{ $noticeType }}" {{ if len .Params | eq 2 }} id="{{ .Get 1 }}" {{ end }}>
    <div class="notice-title">{{ $icon | safeHTML }}</div>
    {{- if or $block (not $raw) }}{{ $raw }}{{ else }}<p>{{ $raw }}</p >{{ end -}}
</div>
```

2. 在 `\blog\assets\scss\custom\_shortcodes.scss` 文件下👇写入以下代码

```scss
.notice {
  position: relative;
  padding: 1em 1em 1em 2.5em;
  margin: 1em 0;
  border-radius: 4px;
  // box-shadow: 0 6px 10px 0 rgba(95, 101, 105, 0.15);
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
  &.notice-warning {
    background: hsla(0, 65%, 65%, 0.25);
    border-left: 5px solid hsl(0, 65%, 55%);
    word-break: break-all;
    .notice-title {
      color: hsl(0, 65%, 55%);
    }
  }
  &.notice-info {
    background: hsla(30, 80%, 70%, 0.25);
    border-left: 5px solid hsl(30, 80%, 55%);
    word-break: break-all;
    .notice-title {
      color: hsl(30, 80%, 55%);
    }
  }
  &.notice-note {
    background: hsla(200, 65%, 65%, 0.25);
    border-left: 5px solid hsl(200, 65%, 55%);
    word-break: break-all;
    .notice-title {
      color: hsl(200, 65%, 55%);
    }
  }
  &.notice-tip {
    background: hsla(140, 65%, 65%, 0.25);
    border-left: 5px solid hsl(140, 65%, 55%);
    word-break: break-all;
    .notice-title {
      color: hsl(140, 65%, 55%);
    }
  }
}
// 黑暗模式
[data-theme='dark'] .notice {
  &.notice-warning {
    background: hsla(0, 25%, 35%, 0.35);
    border-left: 5px solid hsl(0, 25%, 45%);
    // word-break: break-all;
    .notice-title {
      color: hsl(0, 25%, 45%);
    }
  }
  &.notice-info {
    background: hsla(30, 25%, 35%, 0.35);
    border-left: 5px solid hsl(30, 25%, 45%);
    .notice-title {
      color: hsl(30, 25%, 45%);
    }
  }
  &.notice-note {
    background: hsla(200, 25%, 35%, 0.35);
    border-left: 5px solid hsl(200, 25%, 45%);
    .notice-title {
      color: hsl(200, 25%, 45%);
    }
  }
  &.notice-tip {
    background: hsla(140, 25%, 35%, 0.35);
    border-left: 5px solid hsl(140, 25%, 45%);
    .notice-title {
      color: hsl(140, 25%, 45%);
    }
  }
}
```

3. 在`\blog\assets\scss\custom\_custom.scss`中导入`_shortcodes.scss`（前面已经导入则此处无需重复导入）

```scss
@import "shortcodes";
```
4. 在`\themes\meme\data\SVG.toml`文件中插入图标

```svg
# Notice Icon
notice-warning = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 576 512"><path d="M570 440c18 32-5 72-42 72H48c-37 0-60-40-42-72L246 24c19-32 65-32 84 0l240 416zm-282-86a46 46 0 100 92 46 46 0 000-92zm-44-165l8 136c0 6 5 11 12 11h48c7 0 12-5 12-11l8-136c0-7-5-13-12-13h-64c-7 0-12 6-12 13z"/></svg>'
notice-info = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 512 512"><path d="M256 8a248 248 0 100 496 248 248 0 000-496zm0 110a42 42 0 110 84 42 42 0 010-84zm56 254c0 7-5 12-12 12h-88c-7 0-12-5-12-12v-24c0-7 5-12 12-12h12v-64h-12c-7 0-12-5-12-12v-24c0-7 5-12 12-12h64c7 0 12 5 12 12v100h12c7 0 12 5 12 12v24z"/></svg>'
notice-note = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 512 512"><path d="M504 256a248 248 0 11-496 0 248 248 0 01496 0zm-248 50a46 46 0 100 92 46 46 0 000-92zm-44-165l8 136c0 6 5 11 12 11h48c7 0 12-5 12-11l8-136c0-7-5-13-12-13h-64c-7 0-12 6-12 13z"/></svg>'
notice-tip = '<svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 512 512"><path d="M504 256a248 248 0 11-496 0 248 248 0 01496 0zM227 387l184-184c7-6 7-16 0-22l-22-23c-7-6-17-6-23 0L216 308l-70-70c-6-6-16-6-23 0l-22 23c-7 6-7 16 0 22l104 104c6 7 16 7 22 0z"/></svg>'

```

示例：

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