---
title: "[python3] 198. House Robber"
author: egogit
date: '2024-01-21 16:26:00'
categories:
- Algorithm
- LeetCode(uncomplete)
tags:
- python
- leetcode
- medium
- dp
---

**풀이 일자: 24.01.21**

**난이도: \[Medium\]**

**분류: \[Array/Dynamic Programming\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

> You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.\
\
Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

<br/>

각 집에 존재하는 돈이 들어있는 배열을 제공한다고 했을 때 반드시 한 집이상은 걸러 돈을 훔쳐야 한다고 했을 때 훔칠 수 있는 최대의 금액을 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 작은 부분부터 최대의 금액을 계산해나가면서 최종적인 금액을 구해야 하기에 DP가 적합할 것이라고 생각이 들었다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 배열을 순회하면서 현재 기준으로 한칸 띄운 곳부터 처음까지의 가질 수 있는 돈 중 max를 구해서 현재의 집에 더해주면 그 집을 포함해서 그 집까지 훔쳤을 때 가질 수 있는 돈이 계산된다.


```python
class Solution:
    def rob(self, nums: List[int]) -> int:
        for i in range(2, len(nums)):
            prev = max(nums[:i-1]);
            nums[i] += prev;
        
        return max(nums);

```
**Time Complexity:  O(N^2)**

외부 for문과 내부적으로 최대값을 찾는 함수에 의해 시간복잡도는 N^2일 것이다.


**Space Complexity: O(1)**

별다른 자료구조를 사용하지 않았기 때문에 1의 공간복잡도를 가진다.



<br/><br/><br/>
## Other's Solution

**3\. 내 Solution은 사실상 DP로 풀었다고 하기에는 조금 애매하기도 하고 비효율적으로 푼 면이 존재한다.**

→  for문을 한번만 사용하고 몇 개의 변수만을 사용해서 이를 해결할 수 있는 다른 유저의 풀이가 있었다.

```python
class Solution(object):
    def rob(self, nums):
        rob, norob = 0, 0
        for num in nums:
            newRob = norob + num
            newNoRob = max(norob, rob)
            rob, norob = newRob, newNoRob
        return max(rob, norob)
```
**Time Complexity:  O(N)**

외부 for문 하나만 사용했기에 N의 시간복잡도를 가진다.


**Space Complexity: O(1)**

다른 자료구조 사용하지 않고 일반적인 변수만 사용했기에 1의 공간복잡도를 가진다.


<br/><br/><br/>
## Problem Link

 [LeetCode - 198. House Robber](https://leetcode.com/problems/house-robber/description/)
