---
title: "[python3] 76. Minimum Window Substring"
author: egogit
date: '2024-02-04 21:13:00'
categories:
- Algorithm
- LeetCode(uncomplete)
tags:
- python
- leetcode
- hard
- hash
- sliding_window
---

**풀이 일자: 24.02.04**

**난이도: \[Hard\]**

**분류: \[Hash Table/String/Sliding Window\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

> Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".\
\
The testcases will be generated such that the answer is unique.

<br/>

문제의 내용은 s와 t가 주어졌을 때 t의 원소를 모두 포함하는 substring 중 길이가 가장 작은 substring을 리턴하는 것이 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 우선 t를 모두 포함하면서 최단 길이의 substring을 찾아야 하기 때문에 sliding window를 사용하여 풀어야 하는 문제이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 최소가 되려면 시작점은 t에 들어있는 문자로 시작해야 하며 조금씩 위치를 증가시키면서 t의 문자들이 모두 포함되었는지 확인하고 모두 포함이 된 경우 해당 문자열의 길이와 이전에 구해두었던 문자열의 길이를 비교하여 길이가 더 짧다면 해당 문자열을 채택하는 식으로 진행하면 된다.


```python
class Solution:
    def minWindow(self, s: str, t: str) -> str:
        pos = list();
        tcnt = dict();
        ans = s + 'a';

        for i, ch in enumerate(s):
            if ch in t:
                pos.append([ch, i]);
        posType = len(pos);

        for ch in t:
            if ch not in tcnt:
                tcnt[ch] = 0; 
            tcnt[ch] += 1;
        
        for i in range(posType-len(t)+1):
            start = pos[i][1];
            ccnt = tcnt.copy();

            for j in range(i, posType):
                if pos[j][1] - start + 1 > len(ans):
                    break;
                ch, idx = pos[j];

                ccnt[ch] -= 1;

                check = False;
                for k in ccnt.values():
                    if k > 0:
                        check = True;
                        break;
                
                if not check:
                    ans = s[start:idx+1];
        
        if ans == s + 'a':
            ans = "";

        return ans;

```

→ 최대한 시간을 줄여보려고 했으나 계속해서 마지막에서 2번째 예제에서 TLE가 발생하여 결국에는 성공하지 못했다.

**Time Complexity:  O(N^3)**

가장 최악의 경우 N^3의 시간복잡도를 가져 3중 for문 부분이 TLE에 크게 기여하는 것으로 보이는데 방법을 잘 모르겠다.

**Space Complexity: O(N)**

공간복잡도는 일차원 배열들만 사용했기 때문에 N정도의 공간복잡도를 가질 것이다.


<br/><br/><br/>
## Other's Solution

**3\. 계속해서 고민해볼 예정이다.**

→ TBD

```python



```
**Time Complexity:  O()**



**Space Complexity: O()**



<br/><br/><br/>
## Problem Link

 [LeetCode - 76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/description/)
