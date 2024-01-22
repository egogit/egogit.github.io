---
title: "[python3] 645. Set Mismatch"
author: egogit
date: '2024-01-22 13:45:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- easy
- sorting
- bitmanipulation
---

**풀이 일자: 24.01.22**

**난이도: \[Easy\]**

**분류: \[Array/Hash Table/Bit Manipulation/Sorting\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>You have a set of integers s, which originally contains all the numbers from 1 to n. Unfortunately, due to some error, one of the numbers in s got duplicated to another number in the set, which results in repetition of one number and loss of another number.\
\
You are given an integer array nums representing the data status of this set after the error.\
\
Find the number that occurs twice and the number that is missing and return them in the form of an array.

<br/>

해당 배열에 1~n까지의 숫자가 들어있어야 하지만 오류로 인해 하나의 수가 지워지고 다른 하나의 수가 2번 나타나는 문제가 발생했을 때 지워진 수와 중복된 수를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 해당 문제를 풀때에는 단순 구현 문제라고 생각했다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 일단 배열을 sorting한 후에 1부터 차례대로 증가하는지 확인한 후에 중간에 차례대로 증가하지 않거나 중복된 수가 나타나는 경우 ans배열에 넣는 방식을 사용했다.


```python
class Solution:
    def findErrorNums(self, nums: List[int]) -> List[int]:
        nums.sort();
        ans = [0, 0];
        prev = 0;

        if nums[0] != 1:  # 만약 초반에 1로 시작하지 않는 경우 1이 빠진 것이므로 ans배열에 저장하고 prev를 1로 저장
            ans[1] = 1;
            prev = 1;

        for i in range(len(nums)):
            if prev == nums[i]:   # 만약 이전과 중복된 수인 경우
                ans[0] = prev;
            elif nums[i] != prev + 1:  # 만약 차례대로 증가하는 수가 아닌 경우
                ans[1] = prev + 1;
            else:
                pass;

            if 0 not in ans:   # ans배열에 목표로 하는 수들이 모두 찼을 경우
                break;
            prev = nums[i]

        if ans[1] == 0:        # 다 돌았음에도 중복된 수를 찾지 못한 경우 마지막이 중복된 수이면서 증가하는 수가 아니었던 것
            ans[1] = nums[i] + 1;

        return ans;

```
**Time Complexity:  O(NlogN)**

차례대로 sorting을 하기 위해 sort함수를 사용했기 때문에 NlogN의 시간복잡도를 가진다.


**Space Complexity: O(N)**

사실상 상수의 공간복잡도를 가지지만 nums가 2인 경우 공간복잡도가 N이다.


<br/><br/><br/>
## Other's Solution

**3\. 집합의 개념을 사용하는 수학적인 방식이 존재한다.**

→ 수학적으로 계산하는 방법은 내가 사용할 수 있는 3개의 합이 있다. 실제로 가져야 하는 합, 현재 주어진 배열의 합, 중복된 수를 제외한 합을 계산하고 이를 잘 조합하면 중복된 값과 안나왔던 값을 뽑아낼 수 있다.

```python
class Solution:
    def findErrorNums(self, nums: List[int]) -> List[int]:
        n = len(nums);
        act_sum = n*(n+1)//2;  # 실제로 가져야 하는 합
        arr_sum = 0;           # 현재 주어진 배열의 합
        unique_sum = 0;        # 중복된 수를 제외한 합
        ans = [0, 0];

        s = set();

        for num in nums:
            arr_sum += num;    # 현재 arr의 합
            s.add(num);        # set에 추가
        
        for num in s:
            unique_sum += num;  # set에 있는 것만 추가함

        ans[0] = arr_sum - unique_sum; # 겹친 것이 포함한 배열에서 겹친 것을 뺀 배열의 합을 제거하면 중복된 원소가 나옴
        ans[1] = act_sum - unique_sum; # 실제 가져야 할 합에서 겹친 것을 뺀 배열의 합을 빼면 원래 있어야 하는 원소가 나옴

        return ans;


```
**Time Complexity:  O(N)**

전체 num을 순회하는 for문의 시간복잡도인 N의 시간복잡도를 가진다.

**Space Complexity: O(N)**

사실상 상수의 공간복잡도를 가지지만 nums가 2인 경우 공간복잡도가 N이다.

<br/><br/>
**4\. XOR을 사용한 Bit manipulation 방법도 존재한다.**

→ Bit manipulation을 이용한 풀이도 있기는 하지만 정확하게 이해는 되지 않아 이해가 되면 추가할 예정이다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 645. Set Mismatch](https://leetcode.com/problems/set-mismatch/description/)
