---
title: "[python3] 1143. Longest Common Subsequence"
author: egogit
date: '2024-01-25 14:25:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- dp
---

**풀이 일자: 24.01.25**

**난이도: \[Medium\]**

**분류: \[Dynamic Programming\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.\
\
A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.\
\
For example, "ace" is a subsequence of "abcde".\
A common subsequence of two strings is a subsequence that is common to both strings.

<br/>

문제는 LCS 알고리즘을 구현하는 문제이다. 가장 긴 부분공통 sequence의 길이를 찾는 문제

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ LCS를 구현하기 위한 대표적인 알고리즘은 DP이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 각 string을 행과 열에 대응시키고 같은지를 확인하면서 찾는 방식이다.

만약 같은 경우 dp[i-1][j-1] + 1한 값이 dp[i]][j]에 들어가야 하고 만약 같지 않으면 max(dp[i-1][j], dp[i][j-1])이 들어가야 한다.


```python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        w, h = len(text2), len(text1);

        dp = [[0 for i in range(w + 1)] for j in range(h + 1)];

        for i in range(1, h + 1):
            for j in range(1, w + 1):
                if text1[i-1] == text2[j-1]:
                    dp[i][j] = dp[i-1][j-1] + 1;
                else:
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
        
        ans = max(dp[h]);

        return ans;


```
**Time Complexity:  O(N^2)**

시간 복잡도는 2중 for문에 의해 N^2정도의 시간복잡도를 가진다.


**Space Complexity: O(N^2)**

각 string을 배열에 대응해서 dp를 구성하기 때문에 N^2의 공간복잡도를 가진다.



<br/><br/><br/>
## Other's Solution

**3\. 대표적인 DP문제로 항상 그렇듯 총 3가지 방식으로 풀었다.**

→ 재귀적으로 호출해서 푸는 방법, 2차원 배열을 생성해서 푸는 방법, 공간복잡도를 줄이기 위해 1차원 배열만으로 푸는 방법이다.




<br/><br/><br/>
## Problem Link

 [LeetCode - 1143. Longest Common Subsequence](https://leetcode.com/problems/longest-common-subsequence/description/)
