---
title: "[Number Theory] Lagrange's Four-square Theorem"
author: egogit
date: '2024-02-09 13:12:00'
categories:
- Math
- Number Theory
tags:
- math
- thm
math: true
---

## Lagrange's four-square Theorem
> Every natural number can be represented as a sum of four non-negative integer squares

<br><br>
### Lemma1
> Let p be prime, then there are integers u, v such that $$  u^2+v^2+1\equiv 0 \left (mod \; p \right)  $$

**증명**

Let
$$ \; p=2n+1(n\in \mathbb{Z_+}), \quad A=\left\{ a^2\mid a=0,1,\cdots ,n\right\}, \quad B=\left\{ -b^2-1|b=0,1,\cdots ,n\right\} $$

<br><br>
**State: In set A,B, there are no elements that are equivalent mod p**

Assume that there are some elements that are equivalent mod p, 

$$ \exists x,y\in A \quad (0\leq x\neq y \leq n) $$

$$ x^2\equiv y^2 (mod \; p) $$

$$ p\mid x^2-y^2=(x-y)(x+y) $$ 

$$ p\mid (x-y) \; or \; p\mid (x+y) (\because p \; is \; a \; prime)$$

<br>

i)
$$ -n\leq x - y \leq n $$

$$ p\mid (x-y)=0 $$

it is contradiction $$ (\because x \neq y) $$

ii)
$$ 1\leq x + y \leq 2n-1 $$

$$ p \nmid x+y $$ ($$\because $$ p: prime $$ x+y<p, \quad p=2n+1 ) $$

Since p is prime, there is no divisor $$ d $$ in $$ 0 \leq d \leq p-1 $$

<br>

In this way, B is also the same, $$ (\because \exists i,j \in B, \quad 0\leq i\neq j \leq n, \quad  -i^2-1 \equiv -j^2-1, \quad i^2 \equiv j^2) $$

<br>

So, There are no elements that are equivalent mod p in A and B.

(집합 A, B내부에 각각 p에 대해 서로 equivalent한 원소가 없다는 것을 의미)

<br><br>
**State: $$ A\cap B \neq \emptyset $$**

Assume that $$ A\cap B = \emptyset $$

Let $$ C=\left\{ 0,1,2,\cdots ,p-1\right\}, \quad  A\cup B \subseteq C $$

(A와 B의 원소에 대해 mod p인것을 보고 있기 때문에 A와 B의 원소는 0과 p-1사이에 있다고 봐야하며 A와 B의 합집합도 C에 속하게 되어있다.)

$$ n(A \cup B) = 2n+2 \quad n(C)=p=2n+1 $$

it is contradiction $$ (\because \quad A\cup B \subseteq C \quad but \quad n(A \cup B)=2n+2 > n(C)=2n+1 )$$

So, $$ A\cap B \neq \emptyset  $$

There is at least one element in the intersection of sets A and B.

We can choose a,b in A,B that are equivalent mod p

$$ \exists a \in A, \quad  \exists b \in B \quad a^2 \equiv -1-b^2 \quad (mod \; p)$$

$$ a^2+b^2+1 \equiv 0 \quad (mod \; p)  \quad \quad \blacksquare $$

<br>

$$ p \mid a^2+b^2+1 \quad \exists k \in \mathbb{Z_+}  \quad a^2+b^2+1=pk$$

$$ kp = a^2+b^2+1 \leq n^2+n^2+1 = 2n^2+1 < (2n+1)(2n+1) = p^2, \quad k < p $$

<br><br>
### Lemma2
> There are integers m,n such that $$ m=a^2+b^2+c^2+d^2 \quad n=e^2+f^2+g^2+h^2 $$ then mn also cna be expressed as a sum of four non-negative squares

**증명**

$$ m=a^2+b^2+c^2+d^2 \quad n=e^2+f^2+g^2+h^2 $$

$$ mn = (a^2+b^2+c^2+d^2)(e^2+f^2+g^2+h^2) $$

$$    = (ae-bf-cg-dh)^2 + (af+be+eh-dg)^2 + (ag+ce+df-bh)^2 + (ah+de+bg-cf)^2 \quad \quad \blacksquare $$

<br><br>
### Lemma3
> If an even integer $$ 2m $$ can be expressed as a sum of two non-negative integer squares, m also can be expressed as a sum of two integer squares

**증명**

$$ 2m = x^2 + y^2 (x,y,m \in \mathbb{Z_+}) $$

$$ 2 \mid x^2 + y^2 $$

It means that x, y should have the same parity.

$$ m = \frac{x^2+y^2}{2}= \frac{2x^2+2y^2}{4}= \frac{x^2+y^2+2xy+x^2+y^2-2xy}{4}=\frac{(x+y)^2+(x-y)^2}{4} $$

$$   = (\frac{x+y}{2})^2+(\frac{x-y}{2})^2 $$

$$ 2\mid x+y, \quad  2\mid x-y $$
$$ (\because $$ x, y has the same parity)

$$ \therefore \quad $$ m also can be expressed as a sum of two integer squares  $$ \quad \quad \blacksquare $$

<br><br>
### Proof

**i) p=1**

It is trivial $$ 1 = 1^2 + 0^2 + 0^2 + 0^2 $$

**ii) p=2**

It is also trivial $$ 2 = 1^2 + 1^2 + 0^2 + 0^2 $$

<br>

iii) $$p \nmid 2, \quad p:$$ prime

**State: If kp is the smallest multiple of p that can be expressed as the sum of four non-negative squares, then k = 1**

**a) $$ 2\mid k \quad x^2 + y^2 + z^2 + w^2 = kp $$**

It means $$ 2\mid x^2 + y^2 + z^2 + w^2 $$

$$x,y,z,w$$ can have several parity combination (even, odd) in [(4,0),[3,1],[0,4]]

Then I can pick $$a,b,c,d$$ that satisfies $$ a \equiv b \quad (mod \; 2) \quad c \equiv d \quad (mod \; 2) $$

By Lemma 3,

$$ (\frac{x+y}{2})^2+(\frac{x-y}{2})^2+(\frac{z+w}{2})^2+(\frac{z-w}{2})^2=(\frac{k}{2})p $$

Then $$ kp $$ is also even.

We have several parity combination (even, odd) for $$ x, y, z, w $$

1) all numbers are even or odd
- numbers in parentheses are integer

$$ (\frac{2a+2b}{2})^2+(\frac{2a-2b}{2})^2+(\frac{2c+2d}{2})^2+(\frac{2c-2d}{2})^2 $$

$$ (\frac{2a+2b+2}{2})^2+(\frac{2a-2b}{2})^2+(\frac{2c+2d+2}{2})^2+(\frac{2c-2d}{2})^2$$

2) two numbers for even, others for odd

- If x, y has same parity, numbers in parentheses are integer
- If x, y has different parity, numbers in parentheses are not integer.

$$ (\frac{2a+2b}{2})^2+(\frac{2a-2b}{2})^2+(\frac{2c+2d+2}{2})^2+(\frac{2c-2d}{2})^2$$

$$ (\frac{2a+2b+1}{2})^2+(\frac{2a-2b+1}{2})^2+(\frac{2c+2d+1}{2})^2+(\frac{2c-2d+1}{2})^2$$

Thus $$ (\frac{k}{2})p $$ would not be even 

But $$ \frac{k}{2} $$ is an integer and $$ \frac{k}{2} < k $$

So it is contradiction $$ (\because$$ k is the smallest positive integer $$ ) $$

**b) $$ 2\nmid k \quad k \geq 3 $$**

계속 추가할 예정
