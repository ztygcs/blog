---
title: 'TypeScript入门介绍'
date: 2021-06-04T15:03:07+08:00
draft: false
tags: [TypeScript]
toc: true
dropCap: false
#是否显示更新时间
badge: false
---

## 学习之前

### 理论基础

TypeScript 并不是一门新的语言，准确来说它是 JavaScript 的超集。也就是说所有合法的 JavaScript 语言都可以在 TypeScript 中运行。

> TypeScript 给 JavaScript 带来了强类型的定义。

{{< notice notice-warning >}}
注意：TypeScript 无法在浏览器中运行,因此我们编写完了 TypeScript 代码后需要借助编译器将 TypeScript 语言翻译成 JavaScript。
{{< /notice >}}

### 开发环境

在命令行中输入`npm install -g typescript`完成 TypeScript 的全局安装

```
npm install -g typescript
```

查看版本信息

```
tsc -v
```

编写完 ts 文件（test.ts）后通过以下指令编译

```
tsc test.ts
```

我们可以看到当前目录下自动创建了一个`test.js`文件
运行 js 文件

```
node test.js
```

## 基础类型学习

### 数字

`number`类型既能表示整数也能表示浮点数，甚至也可以表示正负数

```ts
function add(n1: number, n2: number) {
  return n1 + n2
}

add(1, 2) //正常
add('1', 2) //报错
```

> 限制 add 参数 n1 和 n2 必须为 number 类型

### 布尔

```ts
let isTrue: boolean
```

### 字符串

字符串|说明
:-:|:-:
"hello"|-
'hello'|-
\`hello\`|\`\` 可以创建一个字符串模板，在其中可以实现内容的分段、分行以及填充变量

```ts
let text1: string = 'hello'
let text2 = `${text1} world` //``定义模板字符串
```

### 数组

数组中可以存放任意类型的数据，并且可以同时存在

```ts
// 定义元素类型为number的数组
let list1: number[] = [1, 2, 3, 4]
// 使用泛型定义数组，效果同上
let list2: Array<number> = [1, 2, 3, 4]
// 不定义类型，效果同上
let list3 = [1, 2, 3, 4]

// 这里定义的数组元素类型为（string|number），即元素要么是数字要么是字符串
let list4 = [1, 'ddd']
// 这里定义的数组元素可以存放任意类型
let list5: any[] = [1, 'a', true]
```

### 元组

```ts
// 其实是一个固定长度、固定类型的数组
let list1: [number, string] = [1, '张三']
```

### 联合

```ts
// 一个变量可以同时支持两个或多个类型
let union: string | number
```

### 字面量

```ts
// 不仅确定类型范围，同时确定了取值范围
let literal: 0 | 1 | 2
// 结合字面量与联合类型灵活运用
let literal2: 1 | 'hello' | true | [1, 2, 3, 4]
```

### 枚举

> 枚举类型，顺序默认从 0 开始，也可自定义

```ts
enum Color {
  red, // => 0
  green, // => 1
  blue // => 2
}
let color = Color.blue
// 输出2，对应blue的顺序
console.log(color)
```

```ts
enum Color {
  red = 5, // => 5
  green, // => 6
  blue // => 7
}
```

```ts
enum Color {
  red = 'red', // Color.red => 'red'
  green = 'green', // Color.green => 'green'
  blue = 1 // Color.blue => 1
}
```

### any

> 任意类型,any 类型的变量其类型可变

```ts
let randomValue: any = 6
randomValue = true
randomValue = 'hello'
randomValue = {}
```

### unknow

定义为 unknow 类型的变量在一定时候需要做逻辑判断，相比较 any 来说更安全

### void、undefined 与 never

- void：不存在
- undefined：存在但未定义

```ts
// 函数throwError永远不会执行完（抛出了异常），其类型为never
function throwError(message: string, errorCode: number): never {
  throw {
    message,
    errorCode
  }
}
throwError('not found', 404)
```

## 类型适配(类型断言)

```ts
let message: any
message = 'abc'
// 无法调用endWith()函数，其类型任为any
message.endWith('c')
```

```ts
let message: any
;(<string>message)(
  // 将message类型转为string
  message as string
) // 效果同上
```

## 面向对象

### 对象 Object

```ts
const person = {
  name: 'zhang',
  age: 18
}
// 正常调用，输出18
console.log(person.age)
```

```ts
const person ：{
  name:string,
  age:number
}= {
  name:'zhang',
  age:18
}
```

### interface 与 class

```ts
let drawPoint = (point:Point) =>{
  console.log({point.x,point.y})
}
drawPoint({x:100,y:50}) // 输出100,50
drawPoint({x:"100",y:"50"}) // 非法

interface Point{
  x:number;
  y:number;
}
```

```ts
interface IPoint {
  x: number
  y: number
  drawPoint: () => void
  getDistances: (p: IPoint) => number
}

class Point implements IPoint {
  x: number
  y: number

  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }

  drawPoint = () => {
    console.log('x:', this.x, 'y:', this.y)
  }
  getDistances = (p: IPoint) => {
    return Math.pow(p.x - this.x, 2) + Math.pow(p.y - this.y, 2)
  }
}

const point = Point(2, 3)
```
