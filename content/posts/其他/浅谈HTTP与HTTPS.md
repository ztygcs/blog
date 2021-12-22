---
title: '浅谈HTTP与HTTPS'
date: 2019-04-20T20:25:00+08:00
draft: false
tags: [Http, 密码体制]
toc: true
dropCap: false
badge: false
---

![图片.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/04/HttpAndHttps.png 'HTTP与HTTPS')

## 概念

{{<underline color="#ffdd00" content="HTTP" >}}（HyperText Transfer Protocol：**超文本传输协议**）是一种用于分布式、协作式和超媒体信息系统的**应用层协议**。
简单来说就是一种发布和接收 HTML 页面的方法，被用于在 Web 浏览器和网站服务器之间传递信息。

{{<underline color="#ffdd00" content="HTTPS" >}}（Hypertext Transfer Protocol Secure：**超文本传输安全协议**或 HTT Pover SSL）是一种透过计算机网络进行安全通信的传输协议。

## 区别

> 1. HTTP 默认工作在 TCP 协议{{<underline color="#ff2200" content="80 端口" >}}
> 2. 用户访问网站 以{{<underline color="#ff2200" content="http://" >}}打头
> 3. HTTP 协议以{{<underline color="#ff2200" content="明文" >}}方式发送内容，{{<underline color="#ff2200" content="不安全" >}}

{{<notice error>}}
注：HTTP 协议不提供任何方式的数据加密，如果攻击者截取了 Web 浏览器和网站服务器之间的传输报文，就可以直接读懂其中的信息，因此，HTTP 协议不适合传输一些敏感信息，比如：信用卡号、密码等支付信息。
{{</notice>}}

>1. HTTPS 默认工作在 TCP 协议{{<underline color="#ff2200" content="443端口" >}}
>2. 用户访问网站 以{{<underline color="#ff2200" content="https://" >}}打头
>3. HTTPS 经由 HTTP 进行通信，但利用 SSL（Secure Socket Layer,安全套接字层）/TLS（Transport Layer Security,运输层安全） 来{{<underline color="#ff2200" content="加密" >}}数据包。{{<underline color="#ff2200" content="安全" >}}

{{<notice error>}}
注：HTTPS 开发的主要目的，是提供对网站服务器的身份认证，保护交换数据的隐私与完整性。
{{</notice>}}

**你也可以说：HTTPS = HTTP + SSL**

**HTTPS 在 HTTP 应用层的基础上使用安全套接字层作为子层。**
  ![图片.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/04/HttpAndHttps2.png 'HTTP与HTTPS的结构')

---

在讲 HTTPS 原理之前，先介绍下**两类密码体制**

> 当你需要在一个购物网站输入账号以及密码时，含有你的账号与密码信息的数据会被发送到服务器，在发送的过程中，数据会有两种加密形式—— ..共享密钥加密.. 和 ..公开密钥加密..。

> **{{<underline color="#66cc55" content="共享密钥加密" >}}**可以这样理解，服务器为了使数据传输更安全，送给你一把钥匙，这把钥匙可以将数据锁在一个盒子里，当然也可以打开已经锁上的盒子。当数据送至服务器时，服务器会用同样的钥匙打开盒子。这种方法的坏处是，一旦贼人得到钥匙，便可以打开已经锁上的盒子。而公开密钥则避免了这种情况。

> **{{<underline color="#66cc55" content="公开密钥加密" >}}**会使用两把钥匙，服务器会发送给你一把只能锁上盒子却不能打开盒子的钥匙，而服务器自己会留一把可以打开盒子的钥匙，这样就避免了钥匙在中途被其他人抢走风险。当服务器发回响应时会用同样的方式，只不过留有可以打开盒子钥匙的人变成了你。

## 密码体制

**{{<underline color="#ffdd00" content="密码体制 1——对称密钥密码体制" >}}**

对称密钥密码体制又称为..共享秘钥加密..，（`加密密钥与解密密钥使用相同的密码`）
![图片.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/04/HttpAndHttps3.png '共享秘钥加密')

- 客户端与服务器使用相同的密码对内容进行加密与解密
- 但这样也必须将密钥也发给对方，造成了另一个问题（**怎样将密钥安全的发给对方？**）
- 任何人只要获取了密钥便可解密密文
- 一旦第三方攻击者获得了密钥，加密也就毫无意义

![图片.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/04/HttpAndHttps4.png '危害')

**{{<underline color="#ffdd00" content="密码体制 2——公钥密码体制" >}}**

公钥密码体制又称为 ..公开秘钥加密..，（`加密密钥与解密密钥使用不同的密码（但有关联）`）
![图片.png](https://zccon.oss-cn-beijing.aliyuncs.com/Hugo/images/tech/2019/04/HttpAndHttps5.png '公开秘钥加密')

- 加密密钥也称为`公钥`（public key），是向公众**公开**的
- 解密密钥也称为`私钥`或`秘钥`（secret key），是需要**保密**的

## 简要过程

**{{<underline color="#ffdd00" content="HTTP" >}}**

1. 浏览器打开一个 TCP 连接
2. 浏览器发送 HTTP 请求到服务器端
3. 服务器发送 HTTP 回应信息到浏览器
4. TCP 连接关闭

**{{<underline color="#ffdd00" content="SSL" >}}**

1. 验证服务器端
2. 允许客户端和服务器端选择加密算法和密码，确保双方都支持
3. 验证客户端(可选)
4. 使用公钥加密技术来生成共享加密数据
5. 创建一个加密的 SSL 连接
6. 基于该 SSL 连接传递 HTTP 请求

**{{<underline color="#ffdd00" content="HTTPS" >}}**

1. 使用 HTTPS 连接时，服务器要求有公钥和签名的证书。
2. 当使用 https 连接，服务器响应初始连接，并提供它所支持的加密方法。
3. 作为回应，客户端选择一个连接方法，并且客户端和服务器端交换证书验证彼此身份。
4. 完成之后，在确保使用相同密钥的情况下传输加密信息，然后关闭连接。
5. 为了提供 https 连接支持，服务器必须有一个公钥证书，该证书包含经过证书机构认证的密钥信息，大部分证书都是通过第三方机构授权的，以保证证书是安全的。

> 注：如果某个网站要求你填写信用卡信息，首先你要检查该网页是否使用 https 加密连接，如果没有，那么请 ..不要输入.. 任何敏感信息如信用卡号。
