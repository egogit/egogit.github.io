---
title: "[python3] 49. Group Anagrams"
author: egogit
date: '2024-02-06 13:13:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- hash
---

**풀이 일자: 24.02.06**

**난이도: \[Medium\]**

**분류: \[Array/Hash Table/Sorting\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>Given an array of strings strs, group the anagrams together. You can return the answer in any order.\
\
An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

<br/>

주어진 문자열 배열에서 anangram끼리 배열로 묶어서 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 일단 anagram group을 구별하는 기준과 어떻게 찾아서 묶을 것인지를 생각해봐야 한다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ anagram의 기준은 같은 갯수와 종류의 문자들을 가지고 있는 문자열끼리는 anagram이다. 즉 이를 확인할 수 있는 방법은 string 내의 문자를 sort해서 같은지만을 비교하면 될 것 같다. 같다면 hash를 통해 sort되었을 때를 key로 한 후에 여기에 문자열 형식으로 계속 넣는다면 자연스럽게 anagram끼리 group이 묶일 것이다.


```python
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        group = dict();
        for s in strs:
            sorteds = "".join(sorted(s)); 

            if sorteds not in group:
                group[sorteds] = list();
            group[sorteds].append(s);
    
        ans = group.values();

        return ans;
        
```
**Time Complexity:  O(N^2)**

시간복잡도는 밖의 for문과 내부에서 anagram임을 확인하기 위해 sort한 것을 합쳐 N^2정도의 시간복잡도를 가질 것이다.

**Space Complexity: O(N)**

strs에 존재하는 문자열들만 다시 들어갈 것이기에 N정도의 공간복잡도를 가질 것이다.


<br/><br/><br/>
## Other's Solution

**3\. 나의 풀이처럼 sorted된 문자열을 key로 활용하여 푼 유저들과 문자 count배열을 이용하여 비교한 유저들이 있었는데 idea는 다른 점이 거의 없다.**


<br/><br/><br/>
## Problem Link

 [LeetCode - 49. Group Anagrams](https://leetcode.com/problems/group-anagrams/description/)
