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
$$ \; p=2n+1(n\in \mathbb{Z_+}), \quad A=\left\{ a^2|a=0,1,\cdots ,n\right\}, \quad B=\left\{ -b^2-1|b=0,1,\cdots ,n\right\} $$

<br><br>
**State: In set A,B, there are no elements that are equivalent mod p**

Assume that there are some elements that are equivalent mod p, 

$$ \exists x,y\in A \quad (0\leq x\neq y \leq n) $$

$$ x^2\equiv y^2 (mod \; p) $$

$$ p|x^2-y^2=(x-y)(x+y) $$ 

$$ p|(x-y) \; or \; p|(x+y) (\because p \; is \; a \; prime)$$

<br>

i)
$$ -n\leq x - y \leq n $$

$$ p|(x-y)=0 $$

it is contradiction $$ (\because x \neq y) $$

ii)
$$ 1\leq x + y \leq 2n-1 $$

$$ x+y $$ can't be divided by p ($$\because $$ p: prime $$ x+y<p, \quad p=2n+1 ) $$

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

$$ p | a^2+b^2+1 \quad \exists k \in \mathbb{Z_+}  \quad a^2+b^2+1=pk$$

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

$$ 2 | x^2 + y^2 $$

It means that x, y should have the same parity.

$$ m = \frac{x^2+y^2}{2}= \frac{2x^2+2y^2}{4}= \frac{x^2+y^2+2xy+x^2+y^2-2xy}{4}=\frac{(x+y)^2+(x-y)^2}{4} $$

$$   = (\frac{x+y}{2})^2+(\frac{x-y}{2})^2 $$

$$ 2|x+y, \quad  2|x-y $$
$$ (\because $$ x, y has the same parity)

$$ \therefore \quad $$ m also can be expressed as a sum of two integer squares  $$ \quad \quad \blacksquare $$

<br><br>
### Proof

추가할 예정