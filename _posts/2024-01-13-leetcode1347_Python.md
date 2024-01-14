---
title: "[python3] 1347. Minimum Number of Steps to Make Two Strings Anagram"
author: egogit
date: 2024-01-13 14:10:00 +0900
categories: [Algorithm, LeetCode]
tags: [python, leetcode, medium, hash]
---

**풀이 일자: 24.01.13**

**난이도: \[Medium\]**

**분류: \[Hash/String/Counting\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

> You are given two strings of the same length s and t. In one step you can choose any character of t and replace it with another character. Return the minimum number of steps to make t an anagram of s. An Anagram of a string is a string that contains the same characters with a different (or the same) ordering.
<br/>

anagram이란 한 단어의 철자를 서로 바꾸어 목표하는 단어로 바꾸는 행위를 의미한다. 문제에서는 s에서 t로의 anagram이 가능하게 하려면 철자 몇개를 바꾸어야 하는지 문제이다.

<br/><br/><br/>
## Solution

**1\. anagram을 위해서는 철자의 종류와 갯수가 s와 t 서로 같아야 한다는 점이 중요하다.**

→ 이를 위해서는 철자의 종류와 갯수를 저장해두어야 하고 이를 위해서 Hash나 나올 수 있는 글자가 26개로 한계가 있으므로 배열을 사용해도 좋다.

**2\. 철자의 종류와 갯수를 저장하는 방법은 그냥 철자 단어 자체를 key로 사용하거나 알파벳 순서로 바꿔 index로 사용해도 좋다.**

→ 2가지 방법을 모두 사용해보았고 count는 s에 대한 철자는 + t에 대한 철자는 -를 해서 양수가 나오는 부분만 count를 더해서 답을 낸다.

```python
class Solution:
    def minSteps(self, s: str, t: str) -> int:
        dic = dict();
        ans = 0;

        for i in range(len(s)):
            sc, tc = s[i], t[i];

            dic[sc] = 1 if sc not in dic else dic[sc] + 1
            dic[tc] = -1 if tc not in dic else dic[tc] - 1

        ans = sum(list(filter(lambda x: x > 0, dic.values())))
        
        return ans;
```
**Time Complexity:  O(N^2)**

외부 for문과 내부적으로 dic에 넣기 위해 해당 key의 존재유무를 체크하기에 N^2정도의 시간복잡도를 가진다.

**Space Complexity: O(N)**

count를 위한 dictionary정도의 N정도의 공간복잡도를 가진다.
<br/>
```python
class Solution:
    def minSteps(self, s: str, t: str) -> int:
        sc = [0]*26;
        ans = 0;

        for i in range(len(s)):
            sind = ord(s[i]) - ord('a');
            tind = ord(t[i]) - ord('a');

            sc[sind] += 1;
            sc[tind] -= 1;

        for i in range(26):
            ans += sc[i] if sc[i] > 0 else 0;
            
        return ans;
```

**Time Complexity:  O(N)**

s의 크기 만큼의 반복이 진행되기에 시간 복잡도는 N이다.

**Space Complexity: O(N)**

횟수를 count하기 위한 sc 배열 크기의 공간 복잡도 N을 가진다.

<br/><br/><br/>
## Other's Solution

간단한 문제로 이를 벗어나는 풀이가 없었다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 1347. Minimum Number of Steps to Make Two Strings Anagram](https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram/description/)
