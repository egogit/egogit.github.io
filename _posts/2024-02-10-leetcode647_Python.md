---
title: "[python3] 647. Palindromic Substrings"
author: egogit
date: '2024-02-10 22:40:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- easy
- dp
---

**풀이 일자: 24.02.10**

**난이도: \[Medium\]**

**분류: \[Dynamic Programming\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

> Given a string s, return the number of palindromic substrings in it.\
\
A string is a palindrome when it reads the same backward as forward.\
\
A substring is a contiguous sequence of characters within the string.

<br/>

substring중에서 palindrome의 갯수를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 가장 먼저 DP를 떠올렸으나 구현 방법이 생각나지 않아 Brute-Force방법으로 해결하였다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 모든 subString에 대해 원본과 reverse가 같은지를 카운트하는 방식이다.


```python
class Solution:
    def countSubstrings(self, s: str) -> int:
        ans = 0;

        for i in range(len(s)+1):
            for j in range(i+1, len(s)+1):
                rev = ''.join(reversed(s[i:j]));
                if s[i:j] == rev:
                    ans += 1;
        
        return ans;

```
**Time Complexity:  O(N^2)**

substring을 만들기 위한 2중 for문에 의해 N^2의 시간복잡도를 가진다.

**Space Complexity: O(1)**

어떠한 자료구조를 추가로 사용하지 않고 있다.

<br><br>
다만 매우 매우 비효율적인 방식이다. 이미 된다고 앞서 계산했던 것을 다시 확인하기 때문이다.


<br/><br/><br/>
## Other's Solution

**3\. 좀더 효율적인 방식의 방법을 찾을 수 있다.**

→ Brute-force방식은 이전에 palindrome을 계산했음에도 다시 한번 더 계산하는 비효율적인 모습을 보인다. 이에 현재 가르키고 있는 것을 중앙으로 잡고 양 옆을 비교하여 같은 경우에만 cnt하고 만약 같지 않은 경우에는 중심을 이동하면 된다.

```python
class Solution:
    def countSubstrings(self, s: str) -> int:
        n, ans = len(s), 0;

        def palindromeCount(left: int, right: int) -> int:
            count = 0;
            while left >= 0 and right < n and s[left] == s[right]:
                left -= 1;
                right += 1;
                count += 1;
            return count;

        for i in range(n):
            even = palindromeCount(i,i+1);
            odd = palindromeCount(i,i);
            ans += even + odd
        
        return ans;

```
**Time Complexity:  O(N^2)**

N^2보다는 중간에 빠져나가는 부분도 있고 양쪽을 확인하는 것이기에 시간복잡도가 작겠지만 N^2정도로 볼 수 있다.

**Space Complexity: O(1)**

이또한 어떠한 자료구조를 사용하지 않기 때문에 1의 공간복잡도를 가진다.

<br><br>

**4\. 원래 문제의 의도는 DP를 사용하는 방법이다.**

→ length를 처음부터 늘려가면서 양쪽 끝을 확인하고 만약 길이가 2보다 작거나 이미 이전에 pandrome이라는 결론이 났다면 해당 부분을 True로 바꾼후 1을 더하는 형식이다.

```python
class Solution:
    def countSubstrings(self, s: str) -> int:
        n = len(s);
        dp = [[False]*n for _ in range(n)];
        ans = 0;

        for length in range(1, n+1):
            for i in range(n-length+1):
                if s[i] == s[i + length - 1] and (length <=2 or dp[i+1][i+length-2]):
                    dp[i][i+length-1] = True;
                    ans += 1;
        
        return ans;

```
**Time Complexity:  O(N^2)**

길이와 palindrome을 카운트하는 기준을 위해 N^2정도의 시간복잡도를 가져 위의 코드보다는 많은 시간이 걸린다.

**Space Complexity: O(N^2)**

시작과 끝을 기반으로 해당 문자가 palindrome임을 체크하는 2차원 배열을 사용하였기에 N^2의 공간복잡도를 가진다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 647. Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/)
