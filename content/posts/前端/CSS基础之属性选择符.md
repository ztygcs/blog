---
title: 'CSS基础之属性选择符'
date: 2021-04-20T17:48:24+08:00
draft: false
tags: [css]
toc: true
---

## 简单属性选择符

如果想选择具有某个属性的元素(不管属性的值是什么)，可以使用简单属性选择符。

选择具有`classs`属性的所有`h4`元素，并改变文本颜色

<table>
<tbody>
<tr><th>代码</th><th>效果</th></tr>
<tr><th style="text-align:left">

```html
<div>
  <h4 class="a">A</h4>
  <h4>B</h4>
  <h4 class="c">C</h4>
</div>
<style>
  h4[class] {
    color: #ffdd00;
  }
</style>
```

</th><th>
<h4 style="color:#ffdd00;">A</h4>
<h4>B</h4>
<h4 style="color:#ffdd00;">C</h4></th></tr>
</tbody></table>

```css
/* 将所有具有title属性的元素字体加粗*/
*[title] {
  font-weight: bold;
}
/* 为所有具有alt属性的图像加一个边框*/
img[alt] {
  border: 3px solid red;
}
/* 基于多个属性的选择*/
a[href][title] {
  font-weight: bold;
}
```

## 根据精准属性值选择

选择`title`属性值为 1 的`span`元素，并设置字体

<table>
<tbody>
<tr><th>代码</th><th>效果</th></tr>
<tr>
<th style="text-align:left">

```html
<div>
  <span>你好</span>
  <span title="1">你好</span>
  <span title="2">你好</span>
</div>
<style>
  span[title='1'] {
    font-weight: bold;
  }
</style>
```

</th>
<th>
<span>你好</span>
<span title = "1" style = "font-size: 20px">你好</span>
<span title = "2">你好</span>
</th>
</tr>
</tbody></table>

如果`title`属性的值有多个，则必须完全匹配才能生效，如：

```html
<span title="word1 word2">内容</span>
```

则对应的样式选择器必须为：

```css
span[title='word1 word2'] {
  font-weight: bold;
}
```

## 根据部分属性值选择

有时候我们需要根据属性的一部分选择元素，而不是完整的值，则需要用到以下的匹配子串

<table>
<tr>
<th>形式</th>
<th>说明</th>
</tr>
<tr>
<th>[foo |="bar"]</th>
<th>选择的元素有foo元素，且其值以bar或bar-开头</th>
</tr>
<tr>
<th>[foo ~="bar"]</th>
<th>选择的元素有foo元素，且其值是包含bar这个词的一组词</th>
</tr>
<tr>
<th>[foo *="bar"]</th>
<th>选择的元素有foo元素，且其值包含子串bar</th>
</tr>
<tr>
<th>[foo ^="bar"]</th>
<th>选择的元素有foo元素，且其值以bar开头</th>
</tr>
<tr>
<th>[foo $="bar"]</th>
<th>选择的元素有foo元素，且其值以bar结尾</th>
</tr>
</table>

**{{<underline color="#ffdd00" content="特殊属性选择符">}}**

```css
*[lang|='en'] {
  color: white;
}
```

| 🔲  |               示例               |
| :-: | :------------------------------: |
| ✅  |   `<h1 lang="en">Hello!</h1> `   |
| ✅  |   `<p lang="en-us">Hello!</p>`   |
| ✅  | `<div lang="en-au">Hello!</div>` |
| ❎  |    `<p lang="fr">Hello!</p> `    |
| ❎  |  `<h4 lang="cy-en">Hello!</h4>`  |

**{{<underline color="#ffdd00" content="匹配以空格分割的一组词中的一个">}}**


```css
span[class~='barren'] {
  font-style: italic;
}
```

| 🔲  |                     示例                      |
| :-: | :-------------------------------------------: |
| ✅  |    `<span class = "barren rocky"></span>`     |
| ✅  |    `<span class = "cloudy barren"></span>`    |
| ❎  | `<span class = "life-bearing cloudy"></span>` |

**{{<underline color="#ffdd00" content="匹配属性值的子串">}}**

```css
span[class*='cloud'] {
  font-style: italic;
}
```

| 🔲  |                     示例                      |
| :-: | :-------------------------------------------: |
| ✅  |    `<span class = "cloudy barren"></span>`    |
| ✅  | `<span class = "life-bearing cloudy"></span>` |
| ❎  |    `<span class = "barren rocky"></span>`     |

**{{<underline color="#ffdd00" content="匹配属性值开头的子串">}}**

```css
a[href^='https:'] {
  font-weight: bold;
}
a[href^='mailto:'] {
  font-weight: italic;
}
```

**{{<underline color="#ffdd00" content="匹配属性值结尾的子串">}}**

```css
a[href$='.pdf'] {
  font-weight: bold;
}
```

## 不区分大小写的标识符

在 CSS Selectors Level 4 中提供了一个不区分大小写的选项。在结束方括号前加上`i`，匹配属性值时不区分大小写。

```css
a[href$='.pdf' i]
```

加了 i 之后，这个选择符便可以匹配 href 属性的值以.pdf 结尾的任何 a 元素，而不管 P、D 和 F 三个字母的大小写
