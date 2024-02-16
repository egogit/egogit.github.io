---
title: "[python3] 92341. 주차 요금 계산(2022 KAKAO BLIND RECRUITMENT)"
author: egogit
date: '2024-02-16 17:07:00'
categories:
- Algorithm
- Programmers
tags:
- python
- programmers
- level2
- hash
---

**풀이 일자: 24.02.16**

**난이도: \[Level 2\]**

**분류: \[Hash\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

주차장의 요금표와 차량의 출입기록을 통해 주차요금을 계산하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 단순한 구현문제이며 효율적인 관리를 위해서 해시를 사용하는 것이 적합하다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 차량마다 몇 분을 주차했는지 저장해놓고 요금표를 통해 요금을 계산한다.


```python
import math;
        
def solution(fees, records):
    answer = [];
    inRecord = dict();
    timeList = dict();
    [baseTime, baseFee, unitTime, unitFee] = fees;
    maxTime = 23 * 60 + 59;
    
    for record in records:
        time, carNum, inOut = record.split();
        hour, minute = map(int, time.split(':'));
        totalTime = hour*60 + minute;
        
        if inOut == 'IN':
            inRecord[carNum] = totalTime;
        else:
            parkTime = totalTime - inRecord[carNum];
            if carNum not in timeList:
                timeList[carNum] = 0;
            timeList[carNum] += parkTime;
            del inRecord[carNum];
    
    for carNum, inTime in inRecord.items():
        parkTime = maxTime - inTime;
        if carNum not in timeList:
            timeList[carNum] = 0;
        timeList[carNum] += parkTime;
    
    for carNum, totalTime in sorted(timeList.items()):
        extraFee = 0;
        if baseTime < totalTime:
            extraFee = math.ceil((totalTime - baseTime)/unitTime)*unitFee;
        fee = baseFee + extraFee;
        answer.append(fee);
    
    return answer

```
**Time Complexity:  O(N)**

차량마다 몇 분을 주차했는지 저장해놓고 요금표를 통해 요금을 계산하는 과정이 N정도의 시간 복잡도를 가진다.

**Space Complexity: O(N)**

여러개의 dictionary를 사용하긴 했으나 N정도의 공간 복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 해당 문제는 단순 구현 문제였기에 구현의 아이디어의 차이는 크게 없었다.**


<br/><br/><br/>
## Problem Link

 [Programmers - 92341. 주차 요금 계산(2022 KAKAO BLIND RECRUITMENT)](https://school.programmers.co.kr/learn/courses/30/lessons/92341)
