---
title: "[FintechMan] 2. 재테크 관리프로젝트 구조 구현"
author: egogit
date: '2024-02-03 17:51:00'
categories:
- Project
- FintechMan
tags:
- project
- fintechman
---

![thumbnail](/assets/img/thumbnail/fintechman.png){:  width:"120px " height:"100px" style:"alignCenter" }


## 1일차 개발 내용

![thumbnail](/assets/img/post/fintechman/240203-fintechman-2_1.png){:  width:"120px " height:"100px" style:"alignCenter" }

1. Header / Sidebar /  Content / Footer로 나누어 각각의 임의의 Content를 넣어보았다.

2. Sidebar는 Hamburger메뉴 버튼을 누르면 등장하도록 만들었다. 

## 알게 된 내용

1. Hamburger메뉴의 구현 방법

- css를 이용하여 서서히 등장하게 만들었다.

## 발생한 Issue

1. 내가 원래 원하는 것은 Content 컴포넌트가 Header아래의 모든 부분을 채우고 있다가 Hamburger버튼을 누르면 sidebar부분이 서서히 열리면서 Content의 width가 서서히 줄어드는 것을 원했다.

하지만 Sidebar가 들어간 상태에도 여전히 Sidebar 컴포넌트가 해당 부분을 차지하고 있는 문제가 발생하여 Sidebar가 숨겨졌을 때 Content 내용이 처음부터 시작하지 않고 Sidebar가 차지하는 그 다음부터 차게 된다.

![thumbnail](/assets/img/post/fintechman/240203-fintechman-2_2.png){:  width:"120px " height:"100px" style:"alignCenter" }
![thumbnail](/assets/img/post/fintechman/240203-fintechman-2_3.png){:  width:"120px " height:"100px" style:"alignCenter" }

## 앞으로 포스팅할 내용

1. issue가 해결된다면 sidebar기능에 대한 코드와 그에 대한 설명 포스팅 예정