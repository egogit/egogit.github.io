---
title: "[python3] 1657. Determine if Two Strings Are Close"
author: egogit
date: '2024-01-13 14:10:00 +0900'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- hash
---

**풀이 일자: 24.01.14**

**난이도: \[Medium\]**

**분류: \[Hash/String/Sorting/Counting\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

Two strings are considered close if you can attain one from the other using the following operations:
Operation 1: Swap any two existing characters.
For example, abcde -> aecdb
Operation 2: Transform every occurrence of one existing character into another existing character, and do the same with the other character.
For example, aacabb -> bbcbaa (all a's turn into b's, and all b's turn into a's)
You can use the operations on either string as many times as necessary.
Given two strings, word1 and word2, return true if word1 and word2 are close, and false otherwise.
<br/>

해당 문제는 이전의 anagram에서 더 나아가 존재하는 문자 2개를 서로를 원하는 만큼 바꾸어 string2를 만들 수 있는지 물어보는 문제이다. 즉 문자의 순서 뿐만 아니라 갯수까지도 고려하여 string1에서 string2로 만들 수 있는지에 대한 문제라고 해석이 가능하다.

<br/><br/><br/>
## Solution

**1\. 먼저 Operation은 문자의 순서를 바꾸는 연산이기에 고려해야 하는 점은 우선 string1과 string2에 존재하는 문자의 종류가 같아야 한다.**

→ 이를 위해 일단 string1과 string2에 들어있는 문자의 종류와 갯수를 for문을 이용해 count해야 하며 만약 string1과 string2에서 나오는 문자의 종류가 다르다면 False를 리턴해아한다. 

**2\. 두번째 Operation은 존재하는 2개의 알파벳의 등장횟수를 서로 바꾸는 연산이다.**

→ 즉 각 문자의 등장횟수의 순서 자체는 중요하지 않고 등장 횟수의 카운트가 string1과 string2가 같은지가 중요하다.
<br/>
예를 들어 aacabb와 bbcbaa가 있다고 하면 각각을 dictionary 형태로 작성한다면 {'a':3, 'b':2, 'c':1} 와 {'a':2, 'b':3, 'c':1}이며 각 단어의 문자의 종류도 같으며 각단어의 등장 횟수도 1,2,3번으로 모두 같기 때문에 이 예시에서는 True를 리턴하는 것이 적합하다.


```python
class Solution:
    def closeStrings(self, word1: str, word2: str) -> bool:
        ch1 = [0]*26;
        ch2 = [0]*26;

        if len(word1) != len(word2):
            return False;

        for i in range(len(word1)):
            w1 = ord(word1[i]) - ord('a');
            w2 = ord(word2[i]) - ord('a');

            ch1[w1] += 1;
            ch2[w2] += 1;
        
        k = 0;
        for i in range(26):
            if ch1[i] + ch2[i] == 0:
                continue;
            elif ch1[i] == ch2[i]:
                continue;
            else:
                if ch1[i] == 0 or ch2[i] == 0:
                    return False;
                else:
                    ch1[k] = ch1[i];
                    ch2[k] = ch2[i];
                    k += 1;
        ch1 = sorted(ch1[:k]);
        ch2 = sorted(ch2[:k]);

        for i in range(k):
            if ch1[i] != ch2[i]:
                return False;

        return True;
```
**Time Complexity:  O(NlogN)**

1중 for문을 사용했지만 sorted함수 자체는 병합정렬과 비슷한 방식으로 동작하는 내장함수로 NLogN의 시간복잡도를 보장한다.

**Space Complexity: O(N)**

문자를 count하기 위한 배열 사용으로 N정도의 공간복잡도이다.

<br/><br/><br/>
## Other's Solution

**1\. 내 Solution은 다른 사람의 풀이와는 같았지만 중간에 불필요한 부분이 존재한다.**

→ 내 풀이에는 등장 횟수가 같지않은 단어의 등장횟수만을 앞에서부터 저장하여 sort하고 비교하는 방식을 사용했지만 사실상 배열의 크기가 최대 26인 만큼 이렇게 general하게 작성하는 것은 낭비이다. 그래서 그냥 문자의 종류가 같은지만 확인하고 등장 횟수에 대해서 배열의 모든 원소를 순회하는 방식으로 바꾸었다.


```python
class Solution:
    def closeStrings(self, word1: str, word2: str) -> bool:
        ch1 = [0]*26;
        ch2 = [0]*26;

        if len(word1) != len(word2):
            return False;

        for i in range(len(word1)):
            w1 = ord(word1[i]) - ord('a');
            w2 = ord(word2[i]) - ord('a');

            ch1[w1] += 1;
            ch2[w2] += 1;
        
        k = 0;
        for i in range(26):
            if (ch1[i] == 0 and ch2[i] > 0) or (ch1[i] > 0 and ch2[i] == 0):
                return False;

        ch1.sort();
        ch2.sort();

        for i in range(26):
            if ch1[i] != ch2[i]:
                return False;

        return True;
```
**Time Complexity:  O(NlogN)**

1중 for문을 사용했지만 sorted함수 자체는 병합정렬과 비슷한 방식으로 동작하는 내장함수로 NLogN의 시간복잡도를 보장한다. 결국에는 여기에서도 sort를 사용했기 때문에 NLogN의 시간복잡도를 가진다.

**Space Complexity: O(N)**

문자를 count하기 위한 배열 사용으로 N정도의 공간복잡도이다. 결국에는 중간 일반화과정을 모두 없앴기 때문에 결과적으로 같다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 1657. Determine if Two Strings Are Close](https://leetcode.com/problems/determine-if-two-strings-are-close/description/)
