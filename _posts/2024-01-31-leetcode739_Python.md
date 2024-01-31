---
title: "[python3] 739. Daily Temperatures"
author: egogit
date: '2024-01-31 12:08:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- stack
---

**풀이 일자: 24.01.31**

**난이도: \[Medium\]**

**분류: \[Array/Stack\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

> Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.

<br/>

온도 배열이 주어졌을 때 각 원소들은 해당 일의 온도로 해당 일 이후에 온도보다 더 높은 온도가 언제 처음으로 등장하는지 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 특별한 알고리즘은 필요없을 것으로 보이며 그 대신에 사용해야하는 자료구조를 생각해보았다. 그결과 스택 혹은 큐를 사용하는 방법을 생각해봤는데 처음에는 큐를 이용한 방식의 풀이를 도전했지만 큐의 경우 FIFO(First In, First Out)구조로 사실 이 문제에는 적합하지 않다. 그 이유는 들어오는 온도는 내림차순으로 들어오게 된다. 즉 마지막에 들어온 것보다 낮은 온도라면 이는 자연스럽게 일찍 들어온 것보다도 온도가 낮다는 것을 의미하게 된다.


**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 즉 스택을 이용해야 한다. 마지막에 들어온 것보다 현재 날짜의 온도가 더 높다면 stack의 위쪽부터 비교해가면서 ans에 넣으면 된다.


```python
class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        ans = [0 for i in range(len(temperatures))];

        stack = list();

        for i, temp in enumerate(temperatures):
            if len(stack) == 0:
                stack.append([temp, i]);
            else:
                while(True):
                    if len(stack) == 0:
                        break;
                    if stack[-1][0] < temp:
                        ans[stack[-1][1]] = i - stack[-1][1];
                        stack.pop();
                    else:
                        break;
                
                stack.append([temp, i]);

        return ans;

```
**Time Complexity:  O(N^2)**

temp를 확인하기 위한 for문과 내부에서 stack이 비어있는지 확인을 위한 len에 의해 최대 N^2의 시간복잡도를 가지게 된다.

**Space Complexity: O(N)**

Stack을 위한 배열을 사용하였기에 N의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 일반적인 Stack을 이용한 방식으로 해결했다.**

→ 비슷한 방식이지만 2차원 배열을 사용하지 않고 오로지 index만을 이용하여 1차원 배열만으로도 해결이 가능했다.

```python
class Solution:
    def dailyTemperatures(self, temps):
        results = [0] * len(temps)
        stack = []

        for i, temp in enumerate(temps):
            while stack and temps[stack[-1]] < temp:
                index = stack.pop()
                results[index] = i - index
            stack.append(i)

        return results

```

<br/><br/><br/>
## Problem Link

 [LeetCode - 739. Daily Temperatures](https://leetcode.com/problems/daily-temperatures/description/)
