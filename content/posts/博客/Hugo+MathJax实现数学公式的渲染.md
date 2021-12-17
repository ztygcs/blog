---
title: "MathJax渲染数学公式"
date: 2020-02-20T21:30:12+08:00
draft: false
tags: [MathJax]
toc: false
dropCap: false
---

> 如何使用MathJax渲染数学公式？

# 添加代码

> 文件路径：\themes\meme\layouts\partials\custom\footer.html

在<span class="filenamestyle">footer.html</span>文件中，添加下面代码
```diff
+<script type="text/x-mathjax-config">
+    MathJax.Hub.Config({
+        tex2jax: {
+            inlineMath: [['$','$'], ['\\(','\\)']],
+            displayMath: [['$$','$$'], ['\[','\]']],
+            processEscapes: true,
+            processEnvironments: true,
+            skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
+            TeX: {
+                equationNumbers: { autoNumber: "AMS" },
+                extensions: ["AMSmath.js", "AMSsymbols.js"]
+            }
+        }
+    });
+</script>
+<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML"></script>
```

在下篇文章《LaTeX数学符号公式汇总》中进一步了解如何使用各种数学符号与数学公式。
