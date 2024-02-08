---
title: "[python3] 279. Perfect Squares"
author: egogit
date: '2024-02-08 21:00:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- dp
---

**풀이 일자: 24.02.08**

**난이도: \[Medium\]**

**분류: \[Dynamic Programming/BFS/Math\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

> Given an integer n, return the least number of perfect square numbers that sum to n.\
\
A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

<br/>

문제의 내용은 n이 주어졌을 때 이 숫자를 제곱수의 합으로 나타내고자 하며 이 경우 피연산자가 최소가 되도록 하는 갯수를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 제일 먼저 이 문제를 보았을 때 떠오른 방법은 DP였다. 결과적으로 조그만한 문제들의 결과를 모아 최종적인 문제를 풀어가는 형태이기 때문이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 제곱수를 기반으로 가장 작은 제곱수의 갯수로 만들 수 있는 경우의 수를 계산해가면서 처리한다.


```python
class Solution:
    def numSquares(self, n: int) -> int:
        arr = [i for i in range(n+1)];

        i = 1;
        for i in range(1, int(sqrt(n))+1): # 제곱 수에 해당하는 부분을 1로 설정
            arr[i**2] = 1;
        
        for i in range(4, n+1): # 4부터 달라지므로 4부터 for문을 돌림.
            if arr[i] != 1: # 제곱수가 아니라면
                l = int(sqrt(i)) # 해당 숫자와 가장 가까운 제곱수부터 시작
                s = i - l**2; # 나머지를 더함

                low = 10001;
                while(l != 0): # l이 0이 될때까지
                    low = min(low, arr[s] + arr[l**2]);
                    l -= 1;  # l은 제곱수만 트래킹을 함. 그 이유는 최대한 큰 제곱수가 들어가야 피연산자의 갯수가 늘어날 수 있기 때문
                    s = i - l**2; 

                arr[i] = low;
                
        ans = arr[n];

        return ans;
        
```
**Time Complexity:  O(N)**

내부의 while문이 존재하기는 하지만 N보다는 현저하게 작게 돌아가기 때문에 N정도의 시간복잡도로 보면 될 것 같다.

**Space Complexity: O(N)**

각 n별 문제의 답을 저장하기 위핸 arr배열을 사용했기 때문에 N정도의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 수학적인 방법으로 푼 경우도 존재한다.**

→ Legendre's three-square theorem, Lagrange's four-square theorem를 활용한 풀이이다. 관련 내용은 추가로 포스팅하고 링크를 추가할 예정이다.

```python
class Solution:
    def isSquare(self, n: int) -> bool:
        return sqrt(n) == int(sqrt(n));

    def numSquares(self, n: int) -> int:
        
        while(n%4==0):
            n /= 4;
        
        if(n%8==7):
            return 4;
        
        if(self.isSquare(n)):
            return 1;

        sq = int(sqrt(n)) + 1;
        for i in range(sq):
            y = n - i**2;
            if(self.isSquare(y)):
                return 2;
        
        return 3;


```
**Time Complexity:  O(sqrt(n))**

직접 계산하지 않고 르장드르의 세제곱수 정리와 라그랑주의 네제곱수 정리에 의해 구했기 때문에 압도적인 속도를 자랑한다.

**Space Complexity: O(1)**

일반적인 변수 외에는 사용한 것이 없기 때문에 1의 공간복잡도를 가진다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 279. Perfect Squares](https://leetcode.com/problems/perfect-squares/)
