---
title: "[python3] 1207. Unique Number of Occurrences"
author: egogit
date: '2024-01-17 10:36:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- easy
- hash
---

**풀이 일자: 24.01.17**

**난이도: \[Easy\]**

**분류: \[Hash/Array\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>Given an array of integers arr, return true if the number of occurrences of each value in the array is unique or false otherwise.

<br/>

arr가 주어졌을 때 해당 arr의 원소 등장 횟수가 겹치지 않는지를 확인하는 여부를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 어떠한 특별한 알고리즘이 필요해보이지 않는다. 

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 간단한 방법은 dictionary를 이용해서 각 원소의 등장 횟수를 count해서 같은 수를 가지는 value가 있는지를 확인하는 방법이 있을 것이다.


```python
class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        count = dict();
        ans = True;

        for i in arr:
            if i not in count:
                count[i] = 0;
            count[i] += 1;
        
        occurrence = list(count.values())
        occurrence.sort();

        prev = -1001;
        for i in occurrence:
            if i == prev:
                ans = False;
                break;
            else:
                prev = i;
        
        return ans;
```
**Time Complexity:  O(NlogN)**

가장 시간복잡도가 높은 부분은 sort()로 합병정렬을 기반으로 하기에 NlogN의 시간복잡도를 가진다.

**Space Complexity: O(N)**

공간복잡도는 N의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 시간을 줄일 수 있는 방법을 찾아보던 중 먼저 원소를 sorting하고 처리하는 방식이 있었다.**

→ 먼저 sorting을 한 후 해당 원소로 이루어진 block이 끝나면 해당 횟수에 대해 set에 있는지 여부를 확인하면서 저장하면 굳이 끝까지 원소를 보지 않아도 될 것이다.

```python
class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        ans = True;
        occurrence = set();

        arr.sort();

        cnt, prev = 1, arr[0];
        for i in range(1, len(arr)):
            if arr[i] == prev:
                cnt += 1;
            else:
                if cnt in occurrence:
                    ans = False;
                    break;
                else:
                    occurrence.add(cnt);
                    prev = arr[i];
                    cnt = 1;
                    if i == len(arr) - 1 and 1 in occurrence:
                        ans = False;
                        break;

        
        return ans;ans;
```
**Time Complexity:  O(N)**

외부 for문만 시간복잡도에 기여하며 내부에서 사용되는 in 연산자의 경우에는 파이썬의 set은 내부적으로 hashtable을 기반으로 하기에 O(1)의 시간복잡도를 가지기에 총 O(N)의 시간복잡도를 가진다.

**Space Complexity: O(N)**

등장 횟수를 저장하기 위한 occurrence set의 공간인 O(N)의 공간복잡도를 가진다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 1207. Unique Number of Occurrences](https://leetcode.com/problems/unique-number-of-occurrences/description/)
