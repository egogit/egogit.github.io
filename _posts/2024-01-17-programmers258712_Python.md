---
title: "[python3] 258712. 가장 많이 받은 선물(2024 KAKAO WINTER Internship)"
author: egogit
date: '2024-01-17 23:16:00'
categories:
- Algorithm
- Programmers
tags:
- python
- programmers
- level1
- kakao
- hash
---

**풀이 일자: 24.01.17**

**난이도: \[Level 1\]**

**분류: \[Hash/Array\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

(크롤링이나 복사가 금지되어 있어 자세한 문제 내용은 밝히지 않으며 정확한 문제를 알고 싶으신 분은 맨 아래의 링크로 접속해서 확인해주세요!)

문제 내용은 친구들 사이의 선물하기를 통해 선물을 서로 주고 받고 그 다음 달에는 특정한 규칙에 따라 선물을 주어야 하는 상황에서 다음 달에 선물을 가장 많이 받는 친구의 선물 겟수를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 이 문제를 처음 봤을 때 단순 구현문제라는 생각이 들었다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 결국에 문제를 해결하기 위해 필요한 건 주고 받은 결과와 선물 지수를 어떤 자료구조를 이용하여 관리해야할지에 대한 생각을 해보아야 한다.

**3\. 코딩 계획.**

→ 각각의 친구들을 key, 우선 선물 지수와 받을 선물을 포함하는 배열을 value로 가지는 딕셔너리를 이용해 관리해보고자 한다. 친구들간의 선물을 주고 받는 행위는 2중 for문을 사용하여 친구들간의 주고 받은 기록을 다시 한번 확인하면서 주고 받은 수지를 계산하여 이를 기반으로 하는 선물을 받는 사람을 정한다.  만약 똑같은 수의 선물을 주고 받았다면 2번째 방법인 선물 지수를 통한 선물을 받는 사람을 결정한다.



```python
def solution(friends, gifts):
    ans = 0;
    headCnt = len(friends);
    balanceSheet = dict();
    
    for friend in friends:       # 각 friend에 대한 dictionary 초기화
        balanceSheet[friend] = [0, 0]; # [상품지수, 다음 달에 받을 선물 수]
    
    for s in gifts:              # 선물 기록을 확인하면서 상품지수를 계산
        giver, taker = s.split();
        balanceSheet[giver][0] += 1;
        balanceSheet[taker][0] -= 1;
    
    for i in range(headCnt - 1):
        for j in range(i + 1, headCnt):  # 친구들 간의 주고 받아야 할 선물 확인
            cnt = 0;
            for history in gifts:        # 선물 기록을 확인하여 서로 주고 받은 선물을 계산
                if f'{friends[i]} {friends[j]}' == history:
                    cnt += 1;
                elif f'{friends[j]} {friends[i]}' == history:
                    cnt -= 1;
                
            if cnt > 0:                  # i 친구가 j친구보다 더 많이 준거면 1개의 선물을 받아야함
                balanceSheet[friends[i]][1] += 1;
            elif cnt < 0:                # j 친구가 i친구보다 더 많이 준거면 1개의 선물을 받아야함
                balanceSheet[friends[j]][1] += 1;
            else:                        # 같은 경우 상품 지수에 따라 결정됨.
                if balanceSheet[friends[i]][0] > balanceSheet[friends[j]][0]: 
                    balanceSheet[friends[i]][1] += 1;
                elif balanceSheet[friends[i]][0] < balanceSheet[friends[j]][0]:
                    balanceSheet[friends[j]][1] += 1;
                else:
                    pass;
            
    result = list(balanceSheet.values());  # value의 마지막 부분이 받을 상품 수이므로 이 부분만 확인해서 큰거 리턴
    for _, gift in result:
        if gift > ans:
            ans = gift;
    
    return ans;
```
**Time Complexity:  O(N^3)**

가장 보수적으로 보면 N^3의 시간복잡도를 가진다고 보면 될 듯.

**Space Complexity: O(N)**

공간복잡도는 list만을 사용하기에 N정도의 공간복잡도를 가짐.


<br/><br/><br/>
## Other's Solution

**1\. 3중 for문을 사용하는 것 대신에 다른 방법이 있지 않을까?.**

→ 3중 for문을 만드는 것보다 메모리 공간을 더 써서 이름을 hash table에 넣고 바로바로 접근이 가능하도록 하며 gift를 주고 받은 내역을 다시 확인하는 것이 아니라 아예 2차원 배열에 넣으면서 해당 기록을 만들어놓고 바로바로 접근해서 확인할 수 있도록 만들 수 있다. 나는 이전 단계를 생략하면 더 빠를 것이라 예상했는데 중간 단계를 포함한 풀이의 아이디어를 빌려 새로운 코드를 작성해보았다.

```python
def solution(friends, gifts):
    ans = 0;
    fHash = dict();                                               # 이름을 index화
    flen = len(friends);
    giveNtake = [[0 for i in range(flen)] for j in range(flen)];  # 누가 누구에게 주었는지 기록
    giftInd = [0 for i in range(flen)];                           # 선물 지수
    greceive = [0 for i in range(flen)]                           # 다음 달에 받을 선물 갯수
    
    i = 0;
    for friend in friends:                                        # 이름을 index로 변환하는 hash table 생성
        fHash[friend] = i;
        i += 1;
    
    for gift in gifts:                                            # 누가 누구에게 주었는지 저장
        giver, taker = gift.split();
        gi, ti = fHash[giver], fHash[taker];
        giveNtake[gi][ti] += 1;
    
    for i in range(flen):                                         # 선물 수지를 계산
        for j in range(flen):
            giftInd[i] += giveNtake[i][j];
            giftInd[j] -= giveNtake[i][j];
    
    for i in range(flen - 1):
        for j in range(i+1, flen):
            cnt = giveNtake[i][j] - giveNtake[j][i];              # 서로 주고 받은 선물의 수지를 계산
            
            if cnt > 0:
                greceive[i]+= 1;                                  # i가 더많이 준거면 i가 j로부터 선물을 받아야함
            elif cnt < 0:
                greceive[j]+= 1;                                  # i가 더 많이 받은거면 i가 j에게 선물을 줘야함.
            else:                                                 # 만약 서로 주고 받은 선물 수가 같으면 선물 지수에 의한 선물 받는 사람 결정
                if giftInd[i] > giftInd[j]:
                    greceive[i] += 1;
                elif giftInd[i] < giftInd[j]:
                    greceive[j] += 1;
                else:
                    pass;
    
    ans = max(greceive);                                          # 가장 많은 선물 수
    
    return ans;
```
**Time Complexity:  O(N^2)**

시간 복잡도는 N^2이며 이는 gifts를 읽을 때 누가 주고 누가 받았는지에 대한 정보를 저장해 두었기 때문이다. 위와 다른 점은 중간 표를 만들고 이를 가지고 선물 지수를 다시 구해야 한다는 점? 제출결과 훨씬 빠른 성능을 기록했다.

**Space Complexity: O(N^2)**

시간을 줄이기 위해 메모리 공간을 더 많이 사용했다. 2차원 배열을 사용하기에 N^2의 시간복잡도라고 볼 수 있다.

<br/><br/><br/>
## Problem Link

 [Programmers - 258712. 가장 많이 받은 선물(2024 KAKAO WINTER Internship)](https://school.programmers.co.kr/learn/courses/30/lessons/258712)
