---
title: "[python3] 451. Sort Characters By Frequency"
author: egogit
date: '2024-02-07 11:08:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- hash
---

**풀이 일자: 24.02.07**

**난이도: \[Medium\]**

**분류: \[Hash/Sorting\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>Given a string s, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string.\
\
Return the sorted string. If there are multiple answers, return any of them.

<br/>

주어진 문제는 문자열 s가 주어졌을 때 각각의 문자의 빈도에 따라 내림차순으로 정렬한 문제를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 가장 먼저 떠올렸던 것은 Hash를 통해 count한 후에 횟수에 따라 sortin하는 방법이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ s를 순회하면서 문자의 반도를 세서 [횟수, 문자]의 형태로 hash의 value에 저장해놓고 value만 가져와서 key를 횟수로 지정하여 sort를 하고 sort된 arr를 기준으로 차례대로 문자*횟수를 하여 ans에 더해가는 아이디어로 구성했다.


```python
class Solution:
    def frequencySort(self, s: str) -> str:
        cnt = dict();
        ans = "";

        for ch in s:
            if ch not in cnt:
                cnt[ch] = [0,ch];
            cnt[ch][0] += 1;

        arr = list(cnt.values())
        arr.sort(key=lambda x: -x[0]);

        for n, ch in arr:
            ans += ch*n;

        return ans;

```
**Time Complexity:  O(NLogN)**

시간복잡도는 횟수와 문자가 담긴 배열을 정렬하는데 드는 sort()함수의 시간복잡도인 NLogN이 든디.

**Space Complexity: O(N)**

공간복잡도 또한 s에 있는 문자의 빈도수를 세는 dict가 존재하여 N정도의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 다음으로 떠올라야 하는 방식은 우선순위 큐 혹은 Heap을 사용하는 방식이다.**

→ 간단한 문제이기 때문에 sort로도 충분하지만 횟수와 문자를 힙에 넣으면 알아서 횟수에 따라 순서에 맞게 들어갈 것이다.

<br><br>
여기서 우선순위 큐와 Heap에 대해서 간단히 정리해보자.
<br><br>

**큐(Queue)**: 먼저 들어오는 데이터가 먼저 나가는 FIFO(First In, First Out) 구조

**우선순위큐(Priority Queue)**: 들어간 순서와 상관없이 우선순위가 높은 데이터가 먼저 나가는 구조
- 우선순위 큐는 배열이나 LinkedList로 구현할 수 있지만 일반적으로 힙을 통해 구현한다.
- 배열: 데이터의 우선순위가 높을 수록 앞쪽에 데이터를 위치시키면 되지만 배열의 경우 삽입, 삭제시 뒤의 데이터를 밀거나 당겨야 한다는 점에서 비효율적이다.
- LinkedList: 데이터의 삽입과 삭제시 데이터를 밀거나 당겨야 한다는 점은 없어지지만 데이터의 삽입 위치를 찾기 위해서는 모든 데이터를 확인해야 한다는 점에서 비효율적이다.

**힙(Heap)**: 주로 이진트리 기반으로 구현하며 루트 노드에 어떤 값이 들어가는지에 따라 Max Heap이나 Min Heap으로 나뉜다.
- 힙은 완전 이진 트리 구조로 모든 노드에 존재하는 값들은 자식노드들의 것보다 크거나 같아야 한다.

<br><br>
그렇다면 우선순위큐와 힙의 차이가 뭘까? 다른 곳에서 인용을 해보자면

> A priority queue is an abstract datatype. It is a shorthand way of describing a particular interface and behavior, and says nothing about the underlying implementation.\
\
A heap is a data structure. It is a name for a particular way of storing data that makes certain operations very efficient.\
\
It just so happens that a heap is a very good data structure to implement a priority queue, because the operations which are made efficient by the heap data strucure are the operations that the priority queue interface needs.

<br><br>
즉 우선순위큐는 추상적인 자료형이다. 이것은 특정 interface와 행동을 설명하는 축약된 방식을 의미하지 기본 구현에 대해서는 어떠한 방식을 채택할 수 있다. 힙은 자료구조이다. 이것은 특정한 작업에서 매우 효율적으로 만드는 데이터 저장 방법의 이름이다. 이때 힙의 구성방식이 우선순위큐를 구성하는데 필요한 구조이기 때문에 적합한 것이다.

간단하게 보면 우선순위큐는 우선순위가 높은 자료들을 추출하는 기능을 위한 인터페이스이며 힙은 데이터를 저장하는 방식 중 하나로 우선순위큐를 구현하는데 가장 적합한 자료구조라는 의미이다.

구현과 자세한 설명은 다른 포스팅에서 다시 언급할 예정!
<br>
```python
class Solution:
    def frequencySort(self, s: str) -> str:
        cnt = dict();
        ans = "";

        for ch in s:
            if ch not in cnt:
                cnt[ch] = [0,ch];
            cnt[ch][0] += 1;

        hq = list();

        for v, ch in cnt.values():
            heapq.heappush(hq, [-v, ch]);

        while hq:
            n, ch = heapq.heappop(hq);
            ans += ch*(-n);

        return ans;

```
**Time Complexity:  O(N^2)**

시간복잡도는 주어진 s를 순회하고 heap에 데이터를 넣는 것을 고려하면 N^2정도이긴 하지만 실질적으로 빠르다.

**Space Complexity: O(N)**

공간복잡도는 문자의 횟수를 count하는 dictionary등 1차원정도의 자료구조를 사용하였으므로 N정도 될 것이다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 451. Sort Characters By Frequency](https://leetcode.com/problems/sort-characters-by-frequency/)

<br/><br/><br/>
## 참고 내용

[(medium)우선순위 큐와 힙 사이의 관계성 정리](https://equus3144.medium.com/%EC%9A%B0%EC%84%A0%EC%88%9C%EC%9C%84-%ED%81%90%EC%99%80-%ED%9E%99-%EC%82%AC%EC%9D%B4%EC%9D%98-%EA%B4%80%EA%B3%84%EC%84%B1-%EC%A0%95%EB%A6%AC-1ce373aa0789)

[(stackoverflow)Difference between priority queue and a heap](https://stackoverflow.com/questions/18993269/difference-between-priority-queue-and-a-heap)
