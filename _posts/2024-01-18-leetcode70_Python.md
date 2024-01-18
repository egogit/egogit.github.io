---
title: "[python3] 70. Climbing Stairs"
author: egogit
date: '2024-01-18 11:40:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- easy
- dp
---

**풀이 일자: 24.01.18**

**난이도: \[Easy\]**

**분류: \[Math/Dynamic Progamming\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>You are climbing a staircase. It takes n steps to reach the top. \
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

<br/>

n개의 계단이 주어졌을 때 1이나 2씩 올라가는 경우 가능한 경우의 수를 반환하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 처음부터 딱 답을 낼 수 없는 문제로 어차피 작은 부분부터 차례대로 계산해 나가야 한다. 그렇다면 이 문제는 DP문제이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 첫번째 방식은 DP를 사용하면서 수학적으로 경우의 수를 계산하는 방법을 사용해보았다. DP는 factorial을 계산할 때 사용하고 1계단 올라가는 것과 2계단 올라가는 것의 횟수에 따른 경우의 수를 계산하는 방법이다. 
<br/>
예를 들어 계단이 5개가 있다고 해보자. 

1 + 1 + 1 + 1 + 1 > 1이 5개인 경우 나올 수 있는 경우의 수는 5!/(5!*0!)으로 1이다.

2 + 1 + 1 + 1 > 2가 1개 1이 3개인 경우 나올 수 있는 경우의 수는 4!/(3!*1!)으로 4이다.

2 + 2 + 1 > 2가 2개 1이 1개인 경우 나올 수 있는 경우의 수는 3!/(2!*1!)으로 3이다.

총 8가지 경우가 나오게 된다. 만약 factorial 식이 이해되지 않는다면 전체를 흩뿌려 놓을 수 잇는 경우의 수는 n!이며 여기서 각각 중복되는 부분을 빼야 하므로 중복되는 원소의 갯수만큼 factorial로 같은 수가 있는 순열로 키워드로 검색하면 나온다.


```python
class Solution:
    def climbStairs(self, n: int) -> int:
        ans = 0;
        facto = [1];

        for i in range(1, n+1):
            facto.append(facto[-1] * i);

        for i in range(n//2 + 1):
            step2 = i;
            step1 = n - 2*i; 
            
            case = facto[step1+step2] // (facto[step1]*facto[step2]);
            ans += case;
        
        return ans;
        
```
**Time Complexity:  O(N)**

시간복잡도는 factorial을 계산할 때 사용하는 for문에 의해 N의 시간복잡도를 가진다.

**Space Complexity: O(N)**

공간복잡도는 factorial을 메모이제이션하기 위해 사용한 배열에 의해 N의 공간복잡도를 가진다.
<br/><br/><br/>

**3\. 수학적인 방식이 아닌 다른 방식으로 풀어본다면 DP의 경우 뭔가 패턴을 찾는 것으면 끝난다.**

→ 직접 적어보자.

n = 1 => 1가지 <br/>
n = 2 => 2가지 <br/>
n = 3 => 3가지 <br/>
n = 4 => 5가지 <br/>
n = 5 => 8가지 <br/>

뭔가 패턴이 보인다. case[n] = case[n-2] + case[n-1]의 점화식을 갖는다. 즉 피보나치 수열의 패턴을 가진다고 이야기할 수 있다. 
이를 이용하면 

```python
class Solution:
    def climbStairs(self, n: int) -> int:
        ans = 0;
        fibo = [1, 2];

        for i in range(2, n):
            case = fibo[i-2] + fibo[i-1];
            fibo.append(case);
        
        ans = fibo[n-1];
        
        return ans;
```

**Time Complexity:  O(N)**

시간복잡도는 피보나치 수열을 계산할 때 사용하는 for문에 의해 N의 시간복잡도를 가진다.

**Space Complexity: O(N)**

공간복잡도는 피보나치 수열을 메모이제이션하기 위해 사용한 배열에 의해 N의 공간복잡도를 가진다.

<br/><br/><br/>
## Other's Solution

**4\. 다른 풀이는 TLE가 나오는 recursion방법과 배열 대신 변수로 이전 결과를 저장하는 Space Optimization방법이 존재했다.**

→ 다양한 아이디어가 나왔지만 Space optimization은 해당 문제에서만 적합하고 일반적으로는 메모이제이션하는 것이 많은 수의 input에 대해서 더 적합하다고 생각한다. recursion방식이 TLE가 나오는 이유는 결국에는 recursion을 할 경우 한 번에 2개의 재귀가 발생하고 이 경우 시간 복잡도는 2^N으로 급격히 커지기 때문에 그렇다.



<br/><br/><br/>
## Problem Link

 [LeetCode - 70. Climbing Stairs](https://leetcode.com/problems/climbing-stairs/description/)
