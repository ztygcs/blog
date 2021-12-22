---
title: '从0到1打造Hugo博客'
date: 2021-03-05T11:00:00+08:00
draft: false
tags: [Hugo]
dropCap: true
---

本篇博文主要记录本 Hugo 博客从 0 到 1 的简要步骤，但其适用于其他大多数 hugo 博客的搭建流程，仅仅区别于主题的不同。

## 具体流程

**{{<underline color="#ffdd00" content="准备Hugo文件">}}**

[下载 hugo 文件](https://github.com/gohugoio/hugo/releases)（extended 扩展版）并解压到自定义文件夹（例：我存放的目录为`D:\Hugo\bin`）

**{{<underline color="#ffdd00" content="配置环境变量">}}**

在 `我的电脑 --> 属性 --> 高级系统设置 --> 环境变量 --> 系统变量 --> Path` 中增加一条`D:\Hugo\bin`，即解压后的 hugo.exe 文件存放的目录。

{{< notice tip >}}
{{<underline color="#7db9de" content="D:\Hugo\bin">}}修改为自己对应文件位置路径
{{< /notice >}}

**{{<underline color="#ffdd00" content="检查版本">}}**

打开 cmd 终端执行以下命令查看是否安装成功（是否输出 Hugo 版本信息）

```bash
hugo version
```

**{{<underline color="#ffdd00" content="生成博客">}}**

打开命令窗口，进入`D:\Hugo\Sites`文件夹（生成站点的文件夹，自定义），输入命令

```bash
hugo new site myblog
```

{{< notice tip >}}
命令执行完成之后在`D:\Hugo\Sites\myblog`文件夹下会自动生成博客需要的文件
{{< /notice >}}

**{{<underline color="#ffdd00" content="安装主题">}}**

> [hugo 主题网站](https://themes.gohugo.io/)

本篇博客使用的 meme 主题，作者：[reuixiy](https://io-oi.me) 

{{< github
    name="hugo-theme-meme"
    link="https://github.com/reuixiy/hugo-theme-meme"
    description="MemE 是一个强大且可高度定制的 GoHugo 博客主题，专为个人博客设计。MemE 主题专注于优雅、简约、现代，以及代码的正确性。同时，希望你将像欣赏一个模因一样欣赏 MemE，希望你将像分享一个模因一样分享 MemE，就像你的博客和文章所做的那样😝！"
    color="#E34C26"
    language="HTML"
>}}


执行以下命令完成 meme 主题的安装。

```bash
cd myblog
git init
git submodule add --depth 1 https://github.com/reuixiy/hugo-theme-meme.git themes/meme
```

**{{<underline color="#ffdd00" content="开始写作">}}**

将 `config.toml` 替换为示例配置。

```bash
rm config.toml && cp themes/meme/config-examples/zh-cn/config.toml config.toml
```

新建一篇文章和一个关于页面：

```bash
hugo new "posts/hello-world.md"
```

```bash
hugo new "about/_index.md"
```

**{{<underline color="#ffdd00" content="本地预览">}}**

```bash
hugo server -t meme --buildDrafts
```

```bash
hugo server -D
```

**{{<underline color="#ffdd00" content="准备个人 GitHub 账号">}}**

创建个人 GitHub 账号与仓库（命名：`账号名.github.io`）

**{{<underline color="#ffdd00" content="部署到 GitHub">}}**

```bash
hugo --theme=meme --baseUrl="https://ztygcs.github.io/" --buildDrafts
```

{{< notice tip >}}
在当前myblog文件夹下会生成 public 文件夹
{{< /notice >}}

接着将 public 文件夹上传至 GitHub 仓库

```bash
cd public
git init
git add .
git commit -m 'model：博客第一次提交'
git remote add origin https://github.com/ztygcs/ztygcs.github.io.git
git push -u origin master
```

**{{<underline color="#ffdd00" content="在线访问网站">}}**

访问网址：[ztygcs.github.io](https://ztygcs.github.io)
