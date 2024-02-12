---
title: "[python3] 150370. 개인정보 수집 유효기간(2023 KAKAO BLIND RECRUITMENT)"
author: egogit
date: '2024-02-12 12:43:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- level1
- hash
---

**풀이 일자: 24.02.12**

**난이도: \[Level 1\]**

**분류: \[Hash\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

개인정보 유효기간을 지난 개인정보 번호를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 우선 약관에 따른 유효기간이 다르므로 약관의 종류와 유효기간을 dictionary로 관리하고 split을 이용하여 날짜를 계산하면 된다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 기존의 날짜에 유효기간을 더해서 오늘의 날짜와 비교한다.


```python
def solution(today, terms, privacies):
    answer = [];
    termType = dict();
    
    if(len(privacies)==1):
        return [1];
    
    baseY, baseM, baseD = today.split('.');
    
    for term in terms:
        typ, month = term.split();
        termType[typ] = int(month);
    
    for i, privacy in enumerate(privacies):
        start, term = privacy.split();
        year, month, day = start.split('.');
        
        yearInt = int(year);
        monthInt = int(month) + termType[term];
        dayInt = int(day);
        
        if monthInt > 12:
            if monthInt % 12 == 0:
                y = monthInt // 12 - 1;
            else:
                y = monthInt // 12
            monthInt -= 12*y;
            yearInt += y;
        
        if int(baseY) > yearInt:
            answer.append(i+1);
        elif int(baseY) == yearInt:
            if int(baseM) > monthInt:
                answer.append(i+1);
            elif int(baseM) == monthInt:
                if int(baseD) >= dayInt:
                    answer.append(i+1);

    return answer

```
**Time Complexity:  O(N)**

privacies를 확인하여 현재 날짜와 비교하는 for문이 있기에 N정도의 시간복잡도를 가진다.

**Space Complexity: O(N)**

약관을 정리하기 위한 dictionary를 사용하였기 때문에 N정도의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. for문을 중첩하여 사용하는 것이 아니라 다른 방법은 없을까?**

→ 가장 좋은 풀이는 연월일을 일로 환산하여 비교하는 방식이고 이 방법을 의도하였다고 생각한다. 문제에서 달에 28일로 고정되어 있고 연도도 한정되어있기 때문에 최적화된 방법이다;

```python
def solution(today, terms, privacies):
    answer = []
    
    def toDay(y, m, d):
        day = y*12*28 + m*28 + d;
        return day;
    
    t = dict();
    baseYear, baseMonth, baseDay = today.split('.');
    baseD = toDay(int(baseYear[2:4]),int(baseMonth),int(baseDay));
    
    for term in terms:
        typ, period = term.split();
        t[typ] = int(period)*28;
    
    for i, privacy in enumerate(privacies):
        date, typ = privacy.split();
        year, month, day = date.split('.');
        totalDay = toDay(int(year[2:4]),int(month),int(day)) + t[typ];
        if totalDay <= baseD:
            answer.append(i+1)
    
    return answer

```
**Time Complexity:  O(N)**

privacies를 확인하여 2000년 기준으로 지난 일수와 비교하는 for문이 있기에 N정도의 시간복잡도를 가진다.

**Space Complexity: O(N)**

약관을 정리하기 위한 dictionary를 사용하였기 때문에 N정도의 공간복잡도를 가진다.

<br/><br/><br/>
## Problem Link

 [Programmers - 150370. 개인정보 수집 유효기간](https://school.programmers.co.kr/learn/courses/30/lessons/150370)
