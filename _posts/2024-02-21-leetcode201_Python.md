---
title: "[python3] 201. Bitwise AND of Numbers Range"
author: egogit
date: '2024-02-21 16:36:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- bit manipulation
---

**풀이 일자: 24.02.21**

**난이도: \[Medium\]**

**분류: \[Bit Manipulation\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

> Given two integers left and right that represent the range [left, right], return the bitwise AND of all numbers in this range, inclusive.

<br/>

left와 right 사이의 모든 수를 and했을 때 결과를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ bit와 관련된 문제로 Bit manupulation 문제이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 모든 수에 대해서 and를 실행하게 되면 무조건 TLE가 걸리게 된다. 이를 수학적으로 해결해보고자 했다. 우선 TLE가 발생한 풀이부터 보이겠다.


```python
# TLE Solution
class Solution:

    def rangeBitwiseAnd(self, left: int, right: int) -> int:
        ans = 0
        leftBin = bin(left);
        rightBin = bin(right);

        if len(leftBin) != len(rightBin):
            ans = 0;
        else:
            ans = left
            for i in range(left + 1, right + 1):
                ans = ans & i;
        
        return ans;

```
**Time Complexity:  O(N)**

표면적으로는 N정도의 시간복잡도를 가지나 and연산은 이진수의 연산을 각각 해야하기 때문에 시간복잡도는 N보다는 높다.

**Space Complexity: O(1)**

별다른 자료구조를 사용하지 않았기 때문에 공간복잡도는 1이다.

<br/><br/>
**2\. Bit Manipulation을 사용해보자.**

→ 사실상 모두 계산할 필요가 없는 풀이를 제시해보겠다.

<br/>
1) left와 right의 이진수 길이가 같은 경우

left가 0이 나오고 right가 1이 나오는 부분만 확인하면 된다. 그 이유는 우선 right가 항상 크기 때문에 1이 먼저 나올 수밖에 없으며 이때 여기서부터 뒷부분은 모두 0이 될 수밖에 없다.
예를 들어 11011, 10111이 있다고 한다면 결과적으로 답은 10000이 되게 되는데 이 이유는 11000이 항상 포함되어서 뒷부분은 0이 나올 수 밖에 없기 때문이다.

즉 메인 idea는 left가 0인 동시에 right가 1이 되는 부분만 확인한다면 나머지는 0이 될 수밖에 없고 따라서 끝나게 된다.

> 11011 \
  10111 \
        \
  사이에 있는 11000에 의해서 뒷자리는 모두 지워지며 현재 위치에 있는 1도 left의 0에 의해 0으로 변화하게 된다.



2) left와 right의 이진수 길이가 다른 경우 left = 3, right= 5이라고 하면, 011 & 110 & 111의 결과가 되게 된다. 위와 같은 이유로 뒷부분은 같은 방식으로 없어지며 앞부분 또한 자리수가 적은 left에 의해 0으로 없어지게 된다. 즉 0이 나오게 된다.

```python
class Solution:
    def rangeBitwiseAnd(self, left: int, right: int) -> int:
        ans = 0
        leftBin, rightBin = bin(left), bin(right);  # 각 이진수로 변환

        if left == right: # 수가 하나밖에 없다면 그대로 리턴
            return left;

        if len(leftBin) == len(rightBin): # 길이가 같으면 계산 같지 않으면 and가 0이 될 수밖에 없다.
            i = 2;
            while i < len(leftBin):
                if leftBin[i] == "0" and rightBin[i] == "1": # right가 1이고 left가 0인 부분이 존재한다면
                    ans = rightBin[:i] + "0"*(len(rightBin) - i); # 여기까지의 right를 유지하고 나머지는 0으로 변경된다.
                    ans = int(ans, 2);
                    break;
                i += 1;

        return ans;

```
**Time Complexity:  O(N)**

binary를 확인하기 위한 N정도의 시간복잡도를 가진다.

**Space Complexity: O(1)**

별다른 자료구조를 사용하지 않았기 때문에 공간복잡도는 1이다.

<br/><br/><br/>
## Other's Solution

**3\. Shift를 사용한 풀이가 있었다.**

→ 나와 전체적인 idea는 같지만 shift를 사용한 풀이라는 차이가 있다.

```python
class Solution:
    def rangeBitwiseAnd(self, left: int, right: int) -> int:
        cnt = 0
        while left != right:
            left >>= 1
            right >>= 1
            cnt += 1
        return left << cnt


```
**Time Complexity:  O(logN)**

shift를 활용한 풀이로 logN정도의 시간복잡도를 가질것이다.

**Space Complexity: O(1)**

별다른 자료구조를 사용하지 않았기 때문에 공간복잡도는 1이다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 201. Bitwise AND of Numbers Range](https://leetcode.com/problems/bitwise-and-of-numbers-range/)
