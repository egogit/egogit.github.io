---
title: "[python3] 2966. Divide Array Into Arrays With Max Difference"
author: egogit
date: '2024-02-01 11:32:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- easy
- greedy
---

**풀이 일자: 24.02.01**

**난이도: \[Medium\]**

**분류: \[Greedy/Sorting\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>You are given an integer array nums of size n and a positive integer k.\
\
Divide the array into one or more arrays of size 3 satisfying the following conditions:\
\
Each element of nums should be in exactly one array.\
The difference between any two elements in one array is less than or equal to k.\
Return a 2D array containing all the arrays. If it is impossible to satisfy the conditions, return an empty array. And if there are multiple answers, return any of them.

<br/>

문제의 내용은 주어진 배열이 있을 때 3개씩 원소를 묶어서 묶은 그룹 내의 큰 수와 작은 수의 차이를 k 이하로 만들게 하는 배열을 리턴하는 것이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 가장 먼저 떠오를 수 있는 것은 일단 Sort를 하는 방법이다. 결국에는 가장 큰 조건은 큰수와 작은 수의 차이를 k이하로 만드는 것이기 때문이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 결국에는 Greedy하게 처리하는 것이 적합하다고 생각했다. 결과적으로 k이하로 만들기 위해서는 최대한 인접한 수끼리 묶는 것이 무조건 필요하며 이를 위해서는 앞에서부터 차례로 3개씩 묶는게 좋다.


```python
class Solution:
    def divideArray(self, nums: List[int], k: int) -> List[List[int]]:

        nums.sort();
        ans = list();

        for i in range(0, len(nums), 3):
            if nums[i+2] - nums[i] > k:
                ans = list();
                break;
            else:
                ans.append(nums[i:i+3]);

        return ans;


```
**Time Complexity:  O(N)**

nums 내부의 숫자를 확인하기 위해 N의 시간복잡도를 가진다.

**Space Complexity: O(N)**

ans에는 nums의 전체 원소가 담기므로 N의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 문제 자체는 Easy에 들어가야할 만한 문제였고 idea만 떠올릴 수 있다면 쉬운 문제였다. Official Solution에도 같은 방식으로 해결했다.**



<br/><br/><br/>
## Problem Link

 [LeetCode - 2966. Divide Array Into Arrays With Max Difference](https://leetcode.com/problems/divide-array-into-arrays-with-max-difference/description/)
