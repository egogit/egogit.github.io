---
title: "[python3] 150369. 택배 배달과 수거하기(2023 KAKAO BLIND RECRUITMENT)"
author: egogit
date: '2024-02-13 16:44:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- easy
- level2
---

**풀이 일자: 24.02.13**

**난이도: \[Level 2\]**

**분류: \[Stack\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

배달과 수거 배열이 주어졌을 때 최소한의 이동으로 배달과 수거를 마친다고 하면 최소 이동 거리를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 처음에 떠올렸던 방법은 two-pointer를 이용하는 방법이지만 stack이라는 힌트를 보고 stack을 이용하여 풀었다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 배달과 수거는 한번에 처리하는 것이 적합하며 배당과 수거 중 멀리 있는 위치에 대해 들려서 중간중간에 내려놓고 들고와야 한다.


```python
def solution(cap, n, deliveries, pickups):
    answer = 0;
    
    deliveryNum = sum(deliveries);
    pickupNum = sum(pickups);
    
    while(len(deliveries) > 0 or len(pickups) > 0 ):
        while(len(deliveries) > 0 and deliveries[-1] == 0):
            deliveries.pop();
        while(len(pickups) > 0 and pickups[-1] == 0):
            pickups.pop();
        
        load = min(cap, deliveryNum);
        deliveryNum -= load;
        target = max(len(deliveries),len(pickups))
        
        while(load != 0 and len(deliveries) > 0):
            if deliveries[-1] >= load:
                deliveries[-1] -= load;
                load = 0;
            else:
                load -= deliveries.pop();
        
        load = 0;
        answer += target;
        
        while(load != cap and len(pickups) > 0):
            if pickups[-1] >= cap - load:
                pickups[-1] -= cap - load;
                load = cap;
            else:
                load += pickups.pop();
        
        answer += target;
    
    return answer

```
**Time Complexity:  O(N)**

시간복잡도는 한방향으로만 이동하는 것이기에 N정도의 시간복잡도를 가진다.

**Space Complexity: O(1)**

주어진 배열외에는 사용한 자료구조가 없기 때문에 1의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 누적합을 이용하여 얼마나 왔다갔다 해야하는지 계산하는 방법이다**

→ 이 경우에는 불필요한 코드도 줄고 간략하다.

```python
def solution(cap, n, deliveries, pickups):
    answer = 0

    for i in range(n-2, -1, -1):
        deliveries[i] += deliveries[i+1]
        pickups[i] += pickups[i+1]
    k = 0
    for i in range(n-1, -1, -1):
        while deliveries[i] > cap*k or pickups[i] > cap*k:
            answer += (i+1)*2
            k += 1
    return answer


```
**Time Complexity:  O(N)**

for문과 while문을 동시에 사용하고 있지만 실질적으로 k의 범위가 크지 않기 때문에 N정도의 시간복잡도로 볼 수 있다.

**Space Complexity: O(1)**

주어진 배열외에는 사용한 자료구조가 없기 때문에 1의 공간복잡도를 가진다.

<br/><br/><br/>
## Problem Link

 [Programmers - 150369. 택배 배달과 수거하기(2023 KAKAO BLIND RECRUITMENT)](https://school.programmers.co.kr/learn/courses/30/lessons/150369)
