---
title: 组合数学进阶初步——以防你觉得自己会组合数学
date: 2025-03-16 00:00:00
tags: []
categories: []
description: 

cover: 
banner:
# 海报（全图封面卡片，可选）
poster:
  # 标题上方的小字
  topic:
  # 大标题（必选）
  headline:
  # 标题下方的小字
  caption:
  # 标题颜色
  color:

# 数字越大越靠前
sticky:
mermaid: true
katex: true
mathjax: true

# 专栏 ID
topic: 
author: a023a
references:
# 设置 false 禁止评论
comments: 
# 设置 false 避免被搜索
indexing: 
# 设置 false 隐藏面包屑导航
breadcrumb: 
leftbar: 
rightbar:
# 设置为 '' 隐藏标题
h1: ''
# tech/story
type: tech
---

# 组合数学进阶初步——以防你觉得自己会组合数学

$$
\Large\tt{\text{Produced by KK_pikate & Harvey}}\\
——迪克2025年3月月报学术栏目
$$

组合数学（Combinatorial mathematics），又称为离散数学。广义的组合数学就是离散数学，狭义的组合数学是离散数学除图论、代数结构、数理逻辑等的部分。组合数学是一门研究离散对象的科学。

为了进一步推动迪克报社发展，~~并一定程度上防止被叫卷苟~~，所以投稿到迪克3月月报上，~~并祸害更多的同学~~。笔者认为，与其通过大家早就知道的知识来构建知识体系，不如通过更高等的知识来构建，~~就像笔者本人关于微积分的知识体系的构建花了一两年一样~~，这里推荐一下德国数学家菲利克斯·克莱因（Felix Christian Klein）的《高观点下的初等数学》（~~真的有人会这么闲吗~~）。关于思维方面的书籍，笔者推荐大数学家G.波利亚（George Pólya）的 《How to Solve It》。本文章将默认各位读者已经掌握了高考所需掌握的组合数学内容，并对容斥原理有初步的了解（理解反演之前的基本容斥内容）。文中所有的组合数 $C_n^m$ 将表示成 $\binom{n}{m}$ 。少部分内容可能不易直接在网上找到。

——CAUTION——：高考不考，大部分内容高联也不涉及

~~我嘞个数学阅读啊~~

## 生成函数（GF）

生成函数又称母函数。在介绍生成函数前先来了解一下广义二项式定理。

什么？你说生成函数并不严格属于离散数学？这不重要。

### 广义二项式定理

大数学家、大物理学家艾萨克·牛顿的墓碑上刻着的唯一公式既不是关于牛顿力学，也不是关于微积分，而是 $(P+PQ)^{\frac{m}{n}}=P^{\frac{m}{n}}+\frac{m}{n} AQ+\frac{m-n}{2n} BQ+\frac{m-2n}{3n} CQ+\frac{m-3n}{4n}DQ+⋯$ ，这个公式名为牛顿二项式，事实上，后来的微积分正是由牛顿二项式孕育而来。

牛顿二项式写成大家熟悉的形式就是 $(1+x)^p=1+px+\frac{p(p-1)}{2!}x^2+\frac{p(p-1)(p-2)}{3!}x^3 +\cdot\cdot\cdot$ ，其中 $p\in \Bbb{Q}$ 。

牛顿猜测出这样的展开式之后并没有给出证明，最终实数域和复数域的证明由欧拉和柯西分别完成。

广义二项式定理：
$$
\boxed{(x+y)^\alpha=\sum\limits_{k=0}^{\infty}\binom{\alpha}{k}x^{\alpha-k}y^k}
$$
其中， $\binom{\alpha}{k}=\frac{\alpha(\alpha-1)\cdots(\alpha-k+1)}{k!},\alpha\in\Bbb{C},k\in\Bbb{N}$ （离散时，若 $m<0~\or m>n$ ，则 $\binom{n}{m}=0$ ）。

广义二项式定理的证明需要用到高等数学，在此不赘述。

使用平凡广义二项式定理可以得到部分代数式的幂级数展开：
$$
\frac{1}{1-x}=1+x+x^2+x^3+\cdots\tag{*}\\
\frac{1}{1+x}=1-x+x^2-x^3+\cdots\\
$$
 $(*)$ 式又被称作无穷递缩等比数列求和公式。

通过其他方法，还可以得到
$$
\frac{1}{(1-x)^k}=\sum\limits_{n=0}^{\infty}\binom{n+k-1}{k-1}x^n\\
e^x=\sum\limits_{n\ge0}\frac{1}{n!}x^n\\
————etc.————
$$
在此不做详细介绍。

### 第一类生成函数（普通型生成函数OGF）

我们称形式幂级数 $F(x)=\sum\limits_{k=0}^{\infty}a_kx^k$ 为 $\{a_n\}$ 的第一类生成函数，OGF常常和“无标号”计数有关。在形式幂级数中， $x$ 从来不指定一个数值，且对收敛和发散的问题不感兴趣，感兴趣的是系数序列 $\{a_n\}$ 。

### 第二类生成函数（指数型生成函数EGF）

对于 $\{a_n\}$ ，其第二类生成函数定义为 $\hat F(x)=\sum\limits_{k=0}^{\infty}a_k\frac{x^k}{k!}$ ，EGF常常与“有标号”计数相关，更确切地说，EGF 主要被用于处理若干序列的合并问题。

### 狄利克雷生成函数（DGF）

生成函数还有狄利克雷生成函数 $\tilde F(x) = \sum\limits_{k\ge 1}\frac{f_k}{k^x}$ 。

后两种生成函数~~由于笔者不会~~，暂不做讨论。

## 卡特兰数（Catalan数）

~~终于进入本文章想要重点介绍的地方了~~（至于为什么是终于，那是因为 $\LaTeX$ 打着实在太累人了）

卡特兰数，又称明安图数，是组合数学中第一个初高中没教过的知识点，在组合数学中出现频繁，最早在推导三角函数的幂级数时被发现。其定义十分丰富，感兴趣的可以自行查阅，~~绝对不是笔者想找其组合意义合集没找到~~。

### 通过路径方案数定义（很直观）

考虑在平面直角坐标系中从 $(0,0)$ 开始，每次向上或者向右走一格，走到 $(n,m)$ 的方案数，显然答案为 $\binom{n+m}{n}$ 。在此基础上规定，走的过程中不能触碰到直线 $y=x+1$ ，走到 $(n,n)$ 的方案数即为卡特兰数 $H(n)$ 。

考虑将路径画出，在不违背“每次只能向上或者向右走一步”的前提下，每个非法方案都触碰了 $y=x+1$ 至少一次，设该方案第一次触碰 $y=x+1$ 时的点为 $A$ 点，将 $A$ 点之后的路径沿 $y=x+1$ 翻折，终点变为 $(n-1,n+1)$ ，则每条到达 $(n,n)$ 的非法路径都唯一对应着一条到达 $(n-1,n+1)$ 的无限制路径，不难发现到达 $(n-1,n+1)$ 的每条路径都必定触碰至少一次直线 $y=x+1$ ，则每条到达 $(n-1,n+1)$ 都唯一对应一条到达 $(n,n)$ 的非法路径，故到达 $(n,n)$ 非法路径与到达 $(n-1,n+1)$ 的无限制路径形成双射，所以到达 $(n,n)$ 的非法方案数为 $\binom{2n}{n-1}$，得到卡特兰数的通项公式 $\boxed{H(n)=\binom{2n}{n}-\binom{2n}{n-1}}$ 。

由该式还可以导出卡特兰数的递推式 $H(n)=\frac{4n-2}{n+1}H(n-1)$ 。

### 通过合法括号序列数定义（直观但是难算）

定义空串为一个合法括号序列，若括号序列 $S$ 和 $T$ 合法，则 $(S)$ 和 $ST$ 均为合法括号序列。人话：左右括号恰好完全匹配的括号序列为合法括号序列（前者定义更为严谨和常见）。

长度为 $2n$ 的合法括号序列的总数即为卡特兰数 $H(n)$ ，与上面一种定义的等价性显然。

这里使用动态规划的思想解决问题（可以浅层次地理解为递推递归）。对于这个长度为 $2n$ 的括号序列，在位置 $2k$ 之后将该序列分成 $[1,2k]$ 和 $[2k+1,2n]$ 两半（可以为空串），有的人这时候会激动，直接将方案数加上 $H(n)H(n-k)$ ，但是这样会因形如 $RST$ 的括号序列而导致重复（ $R,S,T$ 均为合法括号序列）（这类问题非常容易造成重复），为了避免重复，只计数形如 $(S)T$ 的括号序列（因为 $(S)$ 必定不能被分割），其贡献为 $H(k-1)H(n-k)$ ，所以我们可以得到卡特兰数的封闭形式递推式为 $H(n)=\sum\limits_{k=1}\limits^nH(k-1)H(n-k)$ 。

该式等号右侧形式为两个相同的乘积之和，且每一项的自变量之和恒定，所以考虑使用生成函数来证明该式与通项公式等价。专业地，卡特兰数的封闭形式递推式与卷积的形式很相似，因此我们用卷积来构造关于 $H(n)$ 的方程。

构造 $H(n)$ 的生成函数为 $G(x)=\sum\limits_{i=0}\limits^{\infty}H(i)x^i$ ，根据递归式寻找方程得到
$$
G^2(x)=\sum\limits_{n=0}^{\infty}\sum\limits_{k=0}^{n}H(k)H(n-k)x^n=\frac{1}{x}\sum\limits_{n=1}^{\infty}\sum\limits_{k=0}^{n-1}H(k)H(n-1-k)x^{n}=\frac{1}{x}\sum\limits_{n=1}^{\infty}H(n)x^n=\frac{1}{x}G(x)-1
$$
解得 $G(x)=\frac{1\pm\sqrt{1-4x}}{2x}$ ，那么产生问题：我们应该取哪个根呢？我们将其分子有理化，得到 $G(x)=\frac{2}{1\mp\sqrt{1-4x}}$ ，带入 $x=0$ 得到 $G(x)$ 的常数项，也就是 $H(0)$ 。当 $G(x)=\frac{2}{1+\sqrt{1-4x}}$ 时有 $G(0)=1$ 满足要求，而 $G(x)=\frac{2}{1-\sqrt{1-4x}}$ 在 $x=0$ 处不收敛所以舍弃。因此 $G(x)=\frac{1-\sqrt{1-4x}}{2x}$ 。

对 $G(x)$ 利用广义二项式定理展开得到
$$
\begin{alignat*}{2}
G(x)&=\frac{1}{2x}\sum_{n=1}^{\infty}{\frac{(-1)^n(2n-3)!!}{2^{n}n!}}(-4x)^n\\
&=\frac{1}{2x}\sum_{n=1}^{\infty}{\frac{1}{2^{n}n!}}\frac{(2n-2)!}{(2n-2)!!}(4x)^n\\
&=\sum_{n=1}^{\infty}\frac{(2n-2)!}{n!(n-1)!}x^{n-1}\\
&=\sum_{n=1}^{\infty}\frac{1}{n}\binom{2n-2}{n-1}x^{n-1}\\
&=\sum_{n=0}^{\infty}\frac{1}{n+1}\binom{2n}{n}x^n
\end{alignat*}
$$
所以 $\boxed{H(n)=\sum\limits_{k=1}^nH(k-1)H(n-k)=\frac{1}{n+1}\binom{2n}{n}=\binom{2n}{n}-\binom{2n}{n-1}}$ ，证毕。

## 折线容斥

像卡特兰数路径方案数定义中对折线进行翻折等操作来求解的方法叫做折线法。可以从卡特兰数的到达 $(n,n)$ 推广到 $(n,m)$ ，或将直线 $y=x+1$ 推广到 $y=x+b$ ，求解方法同理。

继续对卡特兰数进行扩展，将一条直线不能触碰的限制改为两条，变为从 $(0,0)$ 到 $(n,m)$ 并且不能触碰直线 $y=x+b$ 和 $y=x+c$ 的路径数（保证起点终点在两直线之间）。

（这或许是本文最困难的地方，笔者当时被大佬一堆“显然”的讲解硬控了好几天没想明白）

或许有的读者想要效仿上文的做法，直接写出式子 $\binom{n+m}{n}-\binom{n+m}{n+b}-\binom{n+m}{n+c}$ （ $(n,m)$ 关于 $y=x+b$ 的对称点为 $(m-b,n+b)$ ），然后，炸了。

设触碰一次直线 $y=x+b$ （设为 $Line~A$ ）为事件 $A$ ，触碰一次直线 $y=x+c$ （设为 $Line~B$ ）为事件 $B$ 。上式 $\binom{n+m}{n+b}$ 是对与 $Line~A$ 的第一次触碰点之后的折线做翻折后的方案数，倘若在触碰了 $Line~A$ 之前先触碰了 $Line~B$ ，则该路径会被 $\binom{n+m}{n+c}$ 再计算一次，被算重了。故必然需要使用容斥。

路径的状态可以表示为形如 $AABBAAAABB$ 等的一个字符串，根据卡特兰数通项公式推导过程可以发现连续触碰了几次同一条直线无关痛痒，所以状态简化为 $ABAB$ 。设终点 $(n,m)$ 为点 $P$ ，点 $P$ 关于 $Line~A$ 的对称点为点 $P'$ 。从另一个角度审视 $(0,0)\to P'$ 的路径，设该路径最后一次与 $Line~A$ 接触的点为点 $X$ ，将 $X\to P'$ 的折线沿 $Line~A$ 翻折回来（变为 $X\to P$ ），则 $X\to P$ 必定不与 $Line~A$ 接触，所以原路径状态末尾一定为 $A_0$ 或者 $A_0B_0$ （以下用 $\or$ 代替“或者”）。~~由于我们除了翻折就不会了~~，考虑将点 $P'$ 沿 $Line~B$ 翻折至点 $P''$ ，则 $(0,0)\to P''$ 的折线唯一对应一条 $(0,0)\to P'$ 且经过过 $Line~B$ 的折线，由于该 $(0,0)\to P''$ 的折线所映射到的 $(0,0)\to P'$ 的折线最后一定触碰了 $Line~A$ ，所以每条 $(0,0)\to P''$ 的折线唯一映射一条以 $B_1A_0\or B_1A_0B_0$ 为末状态的 $(0,0)\to P$ 的折线。同理构造点 $P'''$ 为点 $P''$ 关于 $Line~A$ 的对称点，则每条 $(0,0)\to P'''$ 的折线都唯一映射一条以 $A_1B_1A_0\or A_1B_1A_0B_0$ 为末状态的 $(0,0)\to P$ 的折线。设奇数次沿 $Line~A$ 翻折后的点所对应的无限制路径数为 $F_{2k-1}$ ，偶数次沿 $Line~B$ 翻折后的点所对应的无限制路径数为 $F_{2k}$ ，则状态以 $A$ 开头的路径的条数为 $\sum\limits_{k\ge1}(-1)^{k-1}F_k$ ，同理可得状态以 $B$ 开头的路径的条数 $\sum\limits_{k\ge1}(-1)^{k-1}G_k$ ，最终答案即为 $\binom{n+m}{n}+\sum\limits_{k\ge1}(-1)^kF_k+\sum\limits_{k\ge1}(-1)^kG_k$ 。

~~没错问题还可以继续扩展~~，问题可以继续扩展至限制直线斜率不为 $1$ 的问题，或者三维甚至更高维空间内的问题，由于笔者只是听说过，不作讨论。

## 斯特林数（Stirling）

### 第一类斯特林数

将 $n$ 个不同元素构成 $m$ 个圆排列的方案数就是第一类斯特林数，一般记作 $\small\begin{bmatrix}n\\m\end{bmatrix}$。考虑其组合意义可以得到递推式 $\small\begin{bmatrix}n\\k\end{bmatrix}=\begin{bmatrix}n-1\\k-1\end{bmatrix}+(n-1)\begin{bmatrix}n-1\\k\end{bmatrix}$ 。

### 第二类斯特林数

将 $n$ 个不同元素划分成 $m$ 个非空子集的方案数就是第二类斯特林数，一般记作 $\small\begin{Bmatrix}n\\m\end{Bmatrix}$。同理可以得到递推式 $\small\begin{Bmatrix}n\\k\end{Bmatrix}=\begin{Bmatrix}n-1\\k-1\end{Bmatrix}+k\begin{Bmatrix}n-1\\k\end{Bmatrix}$ 。第二类斯特林数远比第一类斯特林数应用广泛。

我们实际上做过本质为第二类斯特林数的题目。对两类斯特林数的进一步认识读者可以自行查阅。

## 一些题目

1.证明 $\sum\limits_{i=1}^ni^2\binom{n+i}{i}=\frac{n(n+1)^3{\binom{2n+1}{n+1}}}{(n+2)(n+3)}$ .

2.利用生成函数证明恒等式 $\sum\limits_{i=0}^n\binom{n}{i}\binom{n+i}{i}=\sum\limits_{i=0}^n2^i\binom{n}{i}^2$ 和 $\sum\limits_{k=0}^n\small{\begin{pmatrix}n\\k\end{pmatrix}}2^{n-k}\small{\begin{pmatrix}k\\ [\frac{k}{2}]\end{pmatrix}}=\small{\begin{pmatrix}2n+1\\n\end{pmatrix}}$ .

3.已知 $m^n=\sum\limits_{i=0}^m\small{\begin{Bmatrix}n\\i\end{Bmatrix}}m^\underline{i}$ ，试证明 $\sum\limits_{i=1}^ni^k=\sum\limits_{j=0}^n\small{\begin{Bmatrix}k\\j\end{Bmatrix}}j!\small{\begin{pmatrix}n+1\\j+1\end{pmatrix}}$ .

4.已知 $m^n=\sum\limits_{i=0}^m\small{\begin{Bmatrix}n\\i\end{Bmatrix}}m^\underline{i}$ ，试证明 $\sum\limits_{i=0}^ni^k\binom{n}{i}(\frac{1}{m})^i(\frac{m-1}{m})^{n-i}=\frac{1}{m^n}\sum\limits_{j=0}^kj!\small{\begin{Bmatrix}k\\j\end{Bmatrix}}\binom{n}{j}m^{n-j}$ .