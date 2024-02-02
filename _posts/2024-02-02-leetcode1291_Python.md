---
title: "[python3] 1291. Sequential Digits"
author: egogit
date: '2024-02-02 14:12:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- easy
- enumeration
---

**풀이 일자: 24.02.02**

**난이도: \[Medium\]**

**분류: \[Enumeration\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>An integer has sequential digits if and only if each digit in the number is one more than the previous digit.\
\
Return a sorted list of all the integers in the range [low, high] inclusive that have sequential digits.

<br/>

상한과 하한이 주어졌을 때 그 사이에 들어갈 수 있는 연속적인 수로 이루어진 숫자들의 배열을 리턴하는 문제다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 딱히 별다른 알고리즘은 필요하지 않고 단순 구현 문제이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 처음에는 연속적인 수로 이루어진 숫자 중 범위내의 가장 작은 수와 가장 큰 수를 찾아서 그 사이의 수를 구해보고자 했고 이 문제에서의 핵심은 첫자리 수와 자릿수가 결정되면 문제를 간단하게 볼 수 있다고 생각했었다. 하지만 이러한 풀이는 결과적으로 복잡한 풀이를 의미하며 이것 대신에 자릿수를 정하고 Sliding window를 통해 low와 high사이에 해당 수가 위치하는지 확인하면서 하나씩 넣는 것이 적합하다는 생각이 들어 풀이를 틀었다.


```python
class Solution:
    def sequentialDigits(self, low: int, high: int) -> List[int]:
        ans = list();

        digit = [str(i) for i in range(1,10)];
        ln = len(str(low));
        hn = len(str(high));

        for i in range(ln, hn + 1):
            for s in range(9-i+1):
                n = int(''.join(digit[s:s+i]));
                if low <= n <= high:
                    ans.append(n);
                elif n > high:
                    break;
                else:
                    pass;


        return ans;


```
**Time Complexity:  O(N^2)**

자릿수와 시작가능 시점의 갯수는 반비례 관계이지만 최악의 경우는 N^2의 시간복잡도를 가진다고 볼 수 있다.

**Space Complexity: O(N)**

숫자를 생성하기 위한 digit배열과 ans배열을 사용하였기 때문에 N의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 다른 풀이들에서 많이 채택한 방식은 첫 숫자를 기준으로 붙여나가는 방식이다.**

→ 숫자를 기준으로 계속해서 붙여나가면서 low와 high 사이에 존재하는지 확인하면서 넣는 방식으로 내 방식와 비슷하다.


<br/><br/><br/>
## Problem Link

 [LeetCode - 1291. Sequential Digits](https://leetcode.com/problems/sequential-digits/description/)
