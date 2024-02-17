---
title: "[python3] 1642. Furthest Building You Can Reach"
author: egogit
date: '2024-02-17 17:26:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- greedy
- heap
---

**풀이 일자: 24.02.17**

**난이도: \[Medium\]**

**분류: \[Greedy/Heap\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>You are given an integer array heights representing the heights of buildings, some bricks, and some ladders.\
\
You start your journey from building 0 and move to the next building by possibly using bricks or ladders.\
\
While moving from building i to building i+1 (0-indexed),\
\
If the current building's height is greater than or equal to the next building's height, you do not need a ladder or bricks.\
If the current building's height is less than the next building's height, you can either use one ladder or (h[i+1] - h[i]) bricks.\
Return the furthest building index (0-indexed) you can reach if you use the given ladders and bricks optimally.\

<br/>

빌딩을 오르고 내리면서 갈 수 있는 최대 건물 갯수를 구하는 문제이다.

<br/><br/><br/>
## Solution

(풀이 실패 후 다른 사람 풀이 봤음)

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 제일 처음에 떠올렸던 방식은 모든 경우를 시도해보는 Brute-Force방식이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 사다리를 타고 가는 경우와 벽돌을 쌓아서 올라가는 경우 각각에 대해 재귀함수를 적용했다.


```python
# TLE Solution
class Solution:
    def bruteForce(self, heights, bricks, ladders, i):
        if i == len(heights):
            return len(heights) - 1;
        
        heightDiff = heights[i] - heights[i-1];
        far = 0;
        if heightDiff <= 0:
            far = self.bruteForce(heights, bricks, ladders, i + 1);
        else:
            if bricks < heightDiff and ladders == 0:
                return i - 1;
            else:
                if bricks >= heightDiff:
                    far1 = self.bruteForce(heights, bricks - heightDiff, ladders, i + 1);
                    far2 = -1;
                    if ladders > 0:
                        far2 = self.bruteForce(heights, bricks, ladders - 1, i + 1);
                    far = max(far1, far2);
                else:
                    if ladders > 0:
                        far = self.bruteForce(heights, bricks, ladders - 1, i + 1);
                    else:
                        return i - 1;
        return far;

    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        ans = self.bruteForce(heights, bricks, ladders, 1);

        return ans;

```
**Time Complexity:  O(2^N)**

재귀함수를 사용하였고 만약 벽돌과 사다리 모두를 사용할 수 있는 경우 2가지에 대해 동시에 재귀가 들어가기 때문엥 2^N정도의 시간복잡도가 걸린다.

**Space Complexity: O(N)**

실질적으로 따로 사용한 자료구조는 없지만 재귀함수에 의한 공간으로 인해 N정도의 공간복잡도를 가진다고 볼 수 있다.

<br/><br/>

**3\. 위에서 TLE가 발생하여 다른 방식이 없나 확인을 위해 Tag를 확인했고 Heap을 사용해야 한다는 사실을 알았다.**

→ Heap을 이용하여 뒤에서부터 진행하면서 해당 위치에 도달할 수 있는지를 확인했다.

```python
# TLE Solution
class Solution:
    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        diff = [0];
        ans = 0;

        for i in range(1, len(heights)):
            if heights[i]- heights[i-1] > 0:
                diff.append(heights[i]- heights[i-1]);
            else:
                diff.append(0);
        
        for i in range(len(heights)-1, -1, -1):
            tmp = diff[:i+1];
            maxHeap = list();
            for j in tmp:
                heapq.heappush(maxHeap, -j);
            lad = list();

            m = min(ladders, len(maxHeap))
            for j in range(m):
                ele = -heapq.heappop(maxHeap);
                lad.append(ele);
            
            brick = bricks;
            isPossible = True;
            for j in range(i + 1):
                if diff[j] in lad:
                    lad.remove(diff[j]);
                    continue;
                elif diff[j] <= brick:
                    brick -= diff[j];
                else:
                    isPossible = False;
                    break;
            if isPossible:
                ans = i;
                break;

        return ans;

```
**Time Complexity:  O(N^2)**

위의 풀이와 다르게 heap을 사용했기 때문에 N^2정도의 시간복잡도를 가지지만 이 풀이 또한 TLE가 발생하였다.

**Space Complexity: O(N)**

여러개의 배열을 사용하기 때문에 N정도의 공간복잡도를 가진다.

<br/><br/><br/>
## Other's Solution

**4\. Greedy하게 푼 다른 사람의 풀이가 있었다.**

→ 사다리는 가는 경로에서 가장 건물 차이가 높을 때 사용하는 것이 최대한 잘 사용하는 것이다. 따라서 일단 사다리를 모두 사용한다고 가정을 하고 거기서 루트가 추가되면 작은 차이가 나는 것부터 빼서 벽돌로 채우는 방식이었다.

```python
class Solution:
    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        hq = list();                             # 사다리를 사용할 건물 차이를 담을 heap
        
        for i in range(len(heights) - 1):
            diff = heights[i+1]-heights[i];
            if diff > 0:                         # 다음 건물이 더 높은 경우
                heapq.heappush(hq, diff);        # 일단 사다리를 사용한다고 가정한다.
                if len(hq) > ladders:            # 만약 사다리 갯수보다 힙에 담긴게 많다면 
                    bricks -= heapq.heappop(hq); # 작은 차이를 가진 구간을 벽돌로 대신 채운다.
                if bricks < 0:                   # 벽돌로 채웠을 때 벽돌이 부족하면
                    return i;                    # 다음으로 못넘어간다.
        return len(heights) - 1;

```
**Time Complexity:  O(N)**

가는 길을 tracking하기 위한 for문을 사용하여 N정도의 시간 복잡도를 가진다.

**Space Complexity: O(N)**

Ladder를 사용하는 구간의 높이 차이를 담기위한 큐를 사용하였기에 N정도의 공간 복잡도를 가진다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 1642. Furthest Building You Can Reach](https://leetcode.com/problems/furthest-building-you-can-reach/)
