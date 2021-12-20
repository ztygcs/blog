---
title: "MathJax渲染数学公式"
date: 2020-02-20T21:30:12+08:00
draft: false
tags: [MathJax]
toc: false
dropCap: false
---

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

在下篇文章[《LaTeX数学符号公式汇总》](https://ztygcs.github.io/posts/%E5%85%B6%E4%BB%96/latex%E6%95%B0%E5%AD%A6%E7%AC%A6%E5%8F%B7%E4%B8%8E%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F%E6%B1%87%E6%80%BB/)中进一步了解如何使用各种数学符号与数学公式。
