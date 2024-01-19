---
title: "[python3] 931. Minimum Falling Path Sum"
author: egogit
date: '2024-01-19 16:20:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- dp
---

**풀이 일자: 24.01.19**

**난이도: \[Medium\]**

**분류: \[Array/Dynamic Programming\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>Given an n x n array of integers matrix, return the minimum sum of any falling path through matrix.\
\
A falling path starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right. Specifically, the next element from position (row, col) will be (row + 1, col - 1), (row + 1, col), or (row + 1, col + 1).

<br/>

주어진 행렬의 맨 위의 row부터 인접한 아래 row로 내려가면서 다 더하고 맨 밑으로 내려왔을 때 가장 작은 값을 가지도록 만드는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 이것도 전형적인 Dynamic programming 문제이다. 각 row마다 해당 column별 가질 수 있는 가장 작은 수를 저장해가면서 점점 row를 늘려가며 구할 수 있기 때문이다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ 주어진 배열을 사용하여 이를 변경하는 형식으로 진행하면 될 것이다. 무조건 아래 row로 내려가야 하고 꼭지점 혹은 변으로 인접한 곳으로 내려갈 수 있으므로 나올 수 있는 결과 중에서 가장 작은 값을 가지는 것만 해당 sell에 저장하는 방식을 사용한다면 손쉽게 가능하다.


```python
class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        ans = 0;
        n = len(matrix);

        for i in range(1, n): # row 순회
            for j in range(n): # column 순회
                if j == 0:     # 첫번째 column인 경우에는 북쪽과 북동쪽의 셀에서만 내려올 수 있으므로 이를 기준으로 계산
                    matrix[i][j] = min(matrix[i-1][j]+matrix[i][j], matrix[i-1][j+1]+matrix[i][j]);
                elif j == n-1: # 마지막 column인 경우에는 북쪽과 북서쪽의 셀에서만 내려올 수 있으므로 이를 기준으로 계산
                    matrix[i][j] = min(matrix[i-1][j-1]+matrix[i][j], matrix[i-1][j]+matrix[i][j]);
                elif 0 < j and j < n-1: # 나머지는 북서, 북, 북동쪽의 모든 원소를 사용가능하므로 셋의 결과중 가장 작은 것을 확인
                    matrix[i][j] = min(min(matrix[i-1][j-1]+matrix[i][j], matrix[i-1][j]+matrix[i][j]), matrix[i-1][j+1]+matrix[i][j]);
                else:
                    pass;
        
        ans = min(matrix[n-1]); # 맨 마지막 row중 가장 작은 결과를 가진 것이 답이다.

        return ans;


```
**Time Complexity:  O(N^2)**
    row와 col을 모두 순회할 수 밖에 없기 때문에 이에 대한 for문으로 N^2을 가진다.


**Space Complexity: O(1)**
    기존의 배열을 계산하는데 그대로 이용했기에 새로 생성한 건 변수뿐이기에 1의 공간복잡도를 가진다.



<br/><br/><br/>
## Other's Solution

**3\. 다른 유저들의 풀이를 확인해본 결과 재귀적인 방법으로 푼 방식이 존재했고 그 이외에는 큰 차이가 없었다.**

→ 다만 보통 기존의 배열에 업데이트 하는 것이 아니라 원본을 놔두고 새로운 2차원 배열을 선언해서 푼 풀이가 많았다. 어차피 파라미터로 바꾼 것이라 해당 메서드를 call한 함수에서 원본을 가지고 있을 것이라 난 상관이 없다고 생각했는데 혹시 모르니 따로 2차원 배열을 선언해서 푸는 것이 더 적합할 것 같다고 느껴졌다.  재귀적인 방법은 사실 비용적으로도 큰 부분이 존재하기에 시공간적으로 오래걸릴 것이라고 예상했고 실제로 돌려보니 오래걸렸다.





<br/><br/><br/>
## Problem Link

 [LeetCode - 931. Minimum Falling Path Sum](https://leetcode.com/problems/minimum-falling-path-sum/description/)
