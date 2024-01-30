---
title: "[python3] 150. Evaluate Reverse Polish Notation"
author: egogit
date: '2024-01-30 14:57:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- easy
- stack
---

**풀이 일자: 24.01.30**

**난이도: \[Medium\]**

**분류: \[Stack\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.\
\
Evaluate the expression. Return an integer that represents the value of the expression.

<br/>

일반적인 operator를 모두 사용하며 나눗셈의 경우 몫을 제외하고 다 버린다. 문제 자체는 후위순회 알고리즘이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 주어진 배열은 후위순회방식의 피연산자와 연산자의 합을 제공하고 있기 때문에 이를 해결할 수 있는 방법은 스택을 이용하는 방법이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 숫자가 나오면 스택에 넣고 연산자가 나오면 스택에서 2개의 피연산자를 pop해서 계산 후 다시 넣는 방식이 일반적인 방식이다.


```python
class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        stack = list();

        for token in tokens:
            if token not in ["+","-","*","/"]:
                stack.append(int(token));
            else:
                b = stack.pop();
                a = stack.pop();

                if token == "+":
                    stack.append(a+b);
                elif token == "-":
                    stack.append(a-b);
                elif token == "/":
                    result = int(a/b);
                    stack.append(result);
                elif token == "*":
                    stack.append(a*b);
                else:
                    pass;
        
        result = stack[-1];
        return result

```
**Time Complexity:  O(N)**

후위표기법으로 넣어진 연산자와 피연산자를 읽기 위한 for문을 사용했기에 N의 시간복잡도를 가진다.

**Space Complexity: O(N)**

Stack을 사용하기 위한 배열에 의해 N의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 전형적인 후위표기법 계산 문제였기에 풀이의 차이는 크게 없었다.**

→ 다만 주의해야 하는 부분은 python에서의 // 연산에 대해서이다. 처음에는 나머지를 버린다기에 몫만을 구하는 // 연산자를 사용했다. 하지만 파이썬의 경우 -2//10과 같은 경우 -1이 나오게 된다. 따라서 // 대신에 int(a/b)의 형태를 사용해야 문제에서 알맞는 값이 나온다.



<br/><br/><br/>
## Problem Link

 [LeetCode - 150. Evaluate Reverse Polish Notation](https://leetcode.com/problems/evaluate-reverse-polish-notation/description/)
