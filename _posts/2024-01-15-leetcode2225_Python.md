---
title: "[python3] 2225. Find Players With Zero or One Losses"
author: egogit
date: '2024-01-15 11:03:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- hash
- sorting
---

**풀이 일자: 24.01.15**

**난이도: \[Medium\]**

**분류: \[Hash/Array/Sorting/Counting\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

You are given an integer array matches where matches[i] = [winner, loseri] indicates that the player winneri defeated player loseri in a match.

Return a list answer of size 2 where:

answer[0] is a list of all players that have not lost any matches.
answer[1] is a list of all players that have lost exactly one match.
The values in the two lists should be returned in increasing order.

Note:

You should only consider the players that have played at least one match.
The testcases will be generated such that no two matches will have the same outcome.
<br/>

대결 결과에 대한 array가 주어졌을 때 한번도 지지 않은 player와 한번만 진 player를 오름차순으로 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 어떠한 특별한 알고리즘이 필요해보이지 않는다. 

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 가장 간단하게 생각해본다면 주어진 배열대로 winne에 나온 player은 첫번째에 넣고 loser에 나온 player는 두번째에 넣으면 된다. 만약 두번째 요소에 존재한다면 해당 player는 2번이상 진 것이기에 빼면 되며 두번째 부터는 loser를 추가할 때 0번 진 곳에 있는지 확인 후에 있다면 이를 빼서 두번째 요소에 넣어주어야 한다.
<br/>

즉 [[1,3],[2,3],[4,2]]가 있다고 가정하자.
이경우 [1,3]을 읽었을 때 ans에는 [[1],[3]]에 담겨야한다.
[2,3]을 읽었을 때 2가 현재 한번도 안진 배열에 존재하지 않으므로 2를 첫번째 요소에 넣어야 하고 3은 이미 1번 진 배열에 포함되어 있기에 3을 제외해야한다. ans에는 [[1,2],[]]이 담겨야 한다.
[4,2]를 읽었을 때 4가 현재 한번도 지지 않은 배열에 존재하지 않으므로 4를 첫번째 요소에 넣고 2는 이긴 배열에 존재하므로 여기서 빼서 1번 진 배열에 넣어주어야 한다. ans에는 [[1,4],[2]]가 되어야 한다.

**3\.더 나은 방법이 있지 않을까? .**

→ 이 경우 밖에 for문이 돌아가야 하고 내부 for문을 통해 내부 배열에 이미 존재하는지에 대한 확인을 해야하므로 시간적으로 많이 걸릴 것이라고 예상가능하다. 그렇다면 최악의 경우를 생각해서 메모리 부분을 손해보더라도 메모리를 크게 잡고 임의접근 방식을 이용하여 단순히 진 횟수를 count하면 되지 않을까라고 생각해보았다.


```python
class Solution:
    def findWinners(self, matches: List[List[int]]) -> List[List[int]]:
        player = [-1]*(10**5+1);
        cnt = 0;
        ans = [[],[]];
        
        for match in matches:
            winner, loser = match[0], match[1];
            
            if player[winner] == -1:
                cnt += 1;
                player[winner] = 0;
            
            if player[loser] == -1:
                cnt += 1;
                player[loser] = 1;
            else:
                player[loser] += 1;

        incnt = 0;  
        for i in range(10**5+1):
            if player[i] == 0:
                ans[0].append(i);
                incnt += 1;
            elif player[i] == 1:
                ans[1].append(i);
                incnt += 1;

            if incnt == cnt:
                break;

        return ans;
```
**Time Complexity:  O(N)**

임의 접근 방식으로 처리했기 때문에  player가 나올 수 있는 최대 크기인 10\*\*5+1 즉 N의 시간복잡도를 가질 것이다.

**Space Complexity: O(N)**

공간복잡도 또한 N을 가진다.

<br/>
**4\.중간에 빨리 끊기 위해서 위에서도 player의 수를 세고 이후에도 ans에 들어간 player 수를 count했는데 count하지 않고 해결할 수 있는 방법이 있지 않을까? .**

→ 그냥 count를 하지 말고 현재까지 나온 player를 따로 set으로 관리하고 나온 player에 대해서만 진 횟수를 check하는 방식을 사용해보자.

```python
class Solution:
    def findWinners(self, matches: List[List[int]]) -> List[List[int]]:
        player = [-1]*(10**5+1);
        ans = [[],[]];
        s = set();
        
        for match in matches:
            winner, loser = match[0], match[1];
            s.add(winner);
            s.add(loser);
            
            if player[winner] == -1:
                player[winner] = 0;
            
            if player[loser] == -1:
                player[loser] = 1;
            else:
                player[loser] += 1;

        s = list(s);
        s.sort();

        for i in s:
            if player[i] == 0:
                ans[0].append(i);
            elif player[i] == 1:
                ans[1].append(i);

        return ans;
```

**Time Complexity:  O(NlogN)**

이론적으로는 최약의 경우 sort 내장함수로 인해 NLogN정도의 시간복잡도를 가져 위의 풀이보다 시간이 오래 걸려야 하지만 대부분의 경우 더 효율적인 풀이가 될 것이다.

**Space Complexity: O(N)**

공간복잡도 또한 N을 가진다.

<br/><br/><br/>
## Other's Solution

다른 유저들과의 풀이를 보았을 때 모두 비슷한 생각을 가지고 해결했다. 내가 제시했던 2번의 idea를 가지고 푼 사람이 가장 많은 vote를 얻었고 3,4번 방식을 사용한 사람들도 많았다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 2225. Find Players With Zero or One Losses](https://leetcode.com/problems/find-players-with-zero-or-one-losses/description/)
