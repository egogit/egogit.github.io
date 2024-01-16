---
title: "[python3] 380. Insert Delete GetRandom O(1)"
author: egogit
date: '2024-01-16 13:22:00'
categories:
- Algorithm
- LeetCode
tags:
- python
- leetcode
- medium
- hash
---

**풀이 일자: 24.01.16**

**난이도: \[Medium\]**

**분류: \[Hash/Array/Sorting/Math\]**

![thumbnail](/assets/img/thumbnail/dailycode.jpg){:  width:"100px " height:"100px" style:"alignCenter" }

<br/><br/><br/>
## Problem

>Implement the RandomizedSet class:\
RandomizedSet() Initializes the RandomizedSet object.\
bool insert(int val) Inserts an item val into the set if not present. Returns true if the item was not present, false otherwise.\
bool remove(int val) Removes an item val from the set if present. Returns true if the item was present, false otherwise.\
int getRandom() Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.\
You must implement the functions of the class such that each function works in average O(1) time complexity.
<br/>

Class를 구현하는 문제로 각 메서드는 단순히 어떤 자료형에 특정 원소를 넣거나 뺄 때 이러한 메서드가 가능한지에 대해 리턴하고 getRandom()의 경우에는 모든 원소가 같은 확률로 뽑힐 수 있도록 해서 임의의 원소를 리턴하는 문제이다. 가장 중요한 조건은 모든 메서드는 O(1)의 시간복잡도를 가져야 한다는 것이다.

<br/><br/><br/>
## Solution

**1\. 우선 가장 먼저 고려해야하는 것은 해당 문제에 적용할만한 알고리즘이 있는가이다.**

→ 단순한 구현 문제로 일반적인 알고리즘이 필요하지는 않겠지만 이 문제에서의 관건은 어떤 자료구조를 사용할 것인지 그리고 getRandom을 어떤 식으로 구현할지가 중요한 듯.

**2\. 어떤 자료형을 사용해서 문제를 해결할 것인지.**

→ 모든 메서드에서 O(1)의 시간복잡도를 가져야 한다는 조건을 만족해야 하므로 특정 원소로 임의 접근시 O(1)의 시간복잡도를 가지는 Dictionary를 사용해야겠다는 생각을 할 수 있다.


```python
class RandomizedSet:

    def __init__(self):
        self.store = dict();

    def insert(self, val: int) -> bool:
        if val in self.store:
            return False;
        else:
            self.store[val] = 1;
            return True

    def remove(self, val: int) -> bool:
        if val in self.store:
            del self.store[val];
            return True;
        else:
            return False;

    def getRandom(self) -> int:
        key = list(self.store.keys())
        rnd = random.choice(key);
        return rnd
```
**Time Complexity:  O(1)**

특정 원소를 key로 가지는 곳 값을 집어넣는 건 O(1)의 시간복잡도를 가지고 해당 원소가 dictionary 내부에 존재하는지 확인을 위해서 in 연산자를 사용해야하는데 이때에도 O(1)의 시간복잡도를 가진다. 의문을 가질 수 있는 점은 key를 하나하나씩 확인해야하니까 O(N)의 시간복잡도를 가져야 하는 것이 아닌가라는 의문을 가질 수 있는데 Python의 dictionary는 내부애는 Hash table로 구성되어 있어 키를 해시 함수를 통해 해시화한 후에 이에 대응되는 곳의 value값을 바로 찾게 된다 이때 값이 없다면 false를 리턴하는 것. 즉 O(1)의 시간복잡도를 가지게 된다.

**Space Complexity: O(N)**

공간복잡도는 dictionary의 크기인 N정도의 공간복잡도를 가진다.

<br/>
**3\.사용할 수 있는 다른 자료형은? .**

→ 파이썬에서 Hash table을 사용한 자료구조는 Set도 존재한다. 위에 기술한 이유와 같이 set또한 set내부에 key가 존재하는지에 대한 여부, add, remove의 모든 부분에서 dictionary와 같은 시간복잡도를 가진다.

```python
class RandomizedSet:

    def __init__(self):
        self.store = set();

    def insert(self, val: int) -> bool:
        if val in self.store:
            return False;
        else:
            self.store.add(val);
            return True

    def remove(self, val: int) -> bool:
        if val in self.store:
            self.store.remove(val);
            return True;
        else:
            return False;

    def getRandom(self) -> int:
        rnd = random.choice(list(self.store));
        return rnd
```

**Time Complexity:  O(1)**

위와 같이 HashTable을 기반으로 했기 때문에 시간복잡도 또한 O(1)로 같다.

**Space Complexity: O(N)**

공간복잡도 또한 위의 Solution과 자료구조만 바뀐 것이므로 O(N)으로 같다.

<br/><br/><br/>
## Other's Solution

이번에도 단순한 구현 문제였기에 내가 생각한 풀이와 대부분 같았다.

<br/><br/><br/>
## Problem Link

 [LeetCode - 380. Insert Delete GetRandom O(1)](https://leetcode.com/problems/insert-delete-getrandom-o1/description/)
