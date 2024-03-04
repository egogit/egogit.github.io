---
title: "[python3] 948. Bag of Tokens"
author: egogit
date: '2024-03-04 18:28:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- greedy
---

**풀이 일자: 24.03.04**

**난이도: \[Medium\]**

**분류: \[Array/Two Pointers/Greedy/Sorting\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>You start with an initial power of power, an initial score of 0, and a bag of tokens given as an integer array tokens, where each tokens[i] donates the value of tokeni.\
\
Your goal is to maximize the total score by strategically playing these tokens. In one move, you can play an unplayed token in one of the two ways (but not both for the same token):\
\
Face-up: If your current power is at least tokens[i], you may play tokeni, losing tokens[i] power and gaining 1 score.\
Face-down: If your current score is at least 1, you may play tokeni, gaining tokens[i] power and losing 1 score.\
Return the maximum possible score you can achieve after playing any number of tokens.\

<br/>

문제의 내용은 주어진 tokens에 대해 최대의 점수를 얻을 수 있는 방법을 구해서 최대 점수를 리턴하는 문제이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 처음에는 조금씩 갯수를 늘려가면서 최적화된 결과를 뽑아내는 DP인가 했지만 문제의 예시를 보았을 때 패턴이 보여서 Greedy를 사용하면 된다는 것을 알 수 있었다.

**2\. 어떤 방식을 사용해서 문제를 해결할 것인지.**

→ Greedy의 전략은 최대한 싸게 power를 지불하고 점수를 얻어야 하며 적은 power를 가지고 최대한의 점수를 가져오는 것이다.


```python
class Solution:
    def bagOfTokensScore(self, tokens: List[int], power: int) -> int:
        ans = 0;
        tokens.sort();  # 오름차순으로 sort한다.
        p1 = 0;         
        p2 = len(tokens) - 1;
        tmpAns = ans;

        while True:
            while p1 <= p2 and  tokens[p1] <= power: # 앞에서부터 최대한 싼 가격에 점수를 얻는다. 
                power -= tokens[p1];
                ans += 1;
                p1 += 1
            tmpAns = ans;                            # 이후에 파워를 가져오는 부분으로 파워를 가져와서 할 것이 없다면 어기까지의 점수가 최대 점수이다.

            while p1 <= p2 and tokens[p2] > power and ans > 0: # 점수를 지불하고 최대한의 파워를 가져온다.
                ans -= 1;
                power += tokens[p2];
                p2 -= 1;
            
            if p1 > p2 or tokens[p1] > power: # 더이상 존재하지 않거나 파워를 가져올 수 없으면서 추가로 점수를 사지 못하면
                break;

        if tmpAns > ans:
            ans = tmpAns;
        
        return ans;

```
**Time Complexity:  O(N)**

결과적으로 전체 array에 대해서 양쪽에서 탐색을 시작하므로 N정도의 시간복잡도를 가진다.

**Space Complexity: O(1)**

공간복잡도는 추가적인 자료구조를 사용하지 않았기 때문에 상수 공간의 공간복잡도를 가진다.


<br/><br/><br/>
## Other's Solution

**3\. 좀 더 간단한 방식을 사용하였다.**

→ 전체적인 아이디어는 나와 비슷하지만 내부는 if문을 사용하여 단순하게 처리하였다.

```python
class Solution:
    def bagOfTokensScore(self, tokens: List[int], power: int) -> int:
        tokens.sort()
        n = len(tokens)
        score = 0
        max_score = 0
        left = 0
        right = n - 1
        
        while left <= right:
            if power >= tokens[left]:
                power -= tokens[left]
                score += 1
                left += 1
                max_score = max(max_score, score)
            elif score > 0:
                power += tokens[right]
                score -= 1
                right -= 1
            else:
                break
                
        return max_score


```
**Time Complexity:  O(N)**

내 풀이와 같이 전체 array에 대해서 양쪽에서 탐색을 시작하므로 N정도의 시간복잡도를 가진다.

**Space Complexity: O(1)**

공간복잡도는 추가적인 자료구조를 사용하지 않았기 때문에 상수 공간의 공간복잡도를 가진다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 948. Bag of Tokens](https://leetcode.com/problems/bag-of-tokens/)
