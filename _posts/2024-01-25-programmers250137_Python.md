---
title: "[python3] 250137. [PCCP 기출문제] 1번 / 붕대 감기"
author: egogit
date: '2024-01-25 17:34:00'
categories:
- Algorithm
- Programmers
tags:
- python
- programmers
- level1
- math
---

**풀이 일자: 24.01.25**

**난이도: \[Level 1\]**

**분류: \[Math\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

붕대를 계속 감고 있는 상태이고 중간에 데미지가 들어왔을 때 죽지 않는지에 대한 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 단순 구현문제라고 생각했고 굳이 사용할만한 자료구조를 생각해보면 Queue가 적합할 것이라 생각했다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 각 초마다 계산할 필요 없이 데미지가 들어오는 시기마다 힐량과 데미지를 동시에 계산하는 것이다.


```python
def solution(bandage, health, attacks):
    answer = 0;
    
    coolTime, tickRecovery, bonusRecovery = bandage;
    
    curTime = attacks[0][0];
    curHealth = health - attacks[0][1];

    if curHealth <= 0:
        return -1;

    for i in range(1, len(attacks)):
        time, damage = attacks[i];
        
        timeDiff = time - curTime;
        if timeDiff % coolTime == 0:
            heal = (timeDiff - 1) * tickRecovery + (timeDiff // coolTime - 1) * bonusRecovery;
            # 시간 차이만큼 tick힐이 들어오는데 공격당한 순간에는 힐이 안들어오므로 1초를 뺌
            # 보너스힐은 지속시간이 유지되면 들어오는 것으로 지속시간 종료에 공격이 들어오면 보너스힐은 들어오면 안됨.
        else:
            heal = (timeDiff - 1) * tickRecovery + timeDiff // coolTime * bonusRecovery;
        curHealth = min(curHealth + heal, health);
        curTime = time;
        
        if curHealth - damage <= 0:
            return -1;
        
        curHealth -= damage
    
    return curHealth;

```
**Time Complexity:  O(N)**

외부 for문을 사용하기에 N정도의 시간복잡도를 가질 것이다.

**Space Complexity: O(1)**

일반적인 변수만을 사용하기 때문에 상수시간 정도의 공간복잡도를 가질 것이다.


<br/><br/><br/>
## Other's Solution

**3\. 초마다 hp를 계산하는 방법이 있었고 그 외 풀이는 크게 다르지 않았다.**

→ 모두 일반적인 구현이다.




<br/><br/><br/>
## Problem Link

 [Programmers - 250137. [PCCP 기출문제] 1번 / 붕대 감기](https://school.programmers.co.kr/learn/courses/30/lessons/250137)
