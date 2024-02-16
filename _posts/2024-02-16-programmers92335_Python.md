---
title: "[python3] 92335. k진수에서 소수 개수 구하기(2022 KAKAO BLIND RECRUITMENT)"
author: egogit
date: '2024-02-16 16:51:00'
categories:
- Algorithm
- Programmers
tags:
- python
- programmers
- level2
- string
---

**풀이 일자: 24.02.16**

**난이도: \[Level 2\]**

**분류: \[String/Math\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

주어진 수를 k진수로 바꾸었을 때 0을 포함하지 않는 소수의 갯수를 구하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 일반적으로 k진수를 구하는 알고리즘과 prime인지 확인하는 알고리즘이 필요할 것이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ n을 k진수로 변환한다 -> 0을 기준으로 자른다 -> 나누어진 수들 중 prime의 갯수를 센다.


```python
import math;

def isPrime(n):
    prime = True;
    if n == 1:
        return False;
        
    for i in range(2, int(math.sqrt(n)) + 1):
        if n % i == 0:
            prime = False;
            break;
    return prime;

def tokBase(n, k):
    digit = "";
    while n != 0:
        digit += str(n % k);
        n //= k;
    return digit;

def solution(n, k):
    answer = 0;
    digit = "";
    
    digit = tokBase(n, k);
    digit = digit[::-1];
    digit = digit.split('0');
    
    for d in digit:
        if len(d) > 0:
            p = int(d);
            if isPrime(p):
                answer += 1;
    return answer;

```
**Time Complexity:  O(N^2)**

잘라진 수를 가지고 prime을 확인하는 부분에서 N^2정도의 시간복잡도를 갖는다.

**Space Complexity: O(N)**

0을 기준으로 잘라진 수들을 저장하는 N정도의 공간복잡도를 갖는다.


<br/><br/><br/>
## Other's Solution

**3\. 간단한 문제라 가장 높은 추천수를 받은 코드도 나와 코드가 비슷했다.**




<br/><br/><br/>
## Problem Link

 [Programmers - 92335. k진수에서 소수 개수 구하기(2022 KAKAO BLIND RECRUITMENT)](https://school.programmers.co.kr/learn/courses/30/lessons/92335)
