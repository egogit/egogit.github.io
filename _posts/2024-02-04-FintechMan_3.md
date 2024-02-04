---
title: "[FintechMan] 3. 재테크 관리프로젝트 로그인 페이지 구현"
author: egogit
date: '2024-02-04 21:28:00'
categories:
- Project
- FintechMan
tags:
- project
- fintechman
---

![thumbnail](/assets/img/thumbnail/fintechman.png){:  width:"120px " height:"100px" style:"alignCenter" }


## 2일차 개발 내용

![thumbnail](/assets/img/post/fintechman/240204-fintechman-3_1.png){:  width:"120px " height:"100px" style:"alignCenter" }

1. NotFound페이지는 기본 Home컴포넌트에서 벗어나지 않기 때문에 Home페이지를 이용하는 것으로 바꾸었다.

2. 로그인을 할 수 있는 페이지 UI를 구상하여 서버없이 간단한 if문을 활용한 간이 로그인페이지를 만들었다.

![thumbnail](/assets/img/post/fintechman/240204-fintechman-3_2.png){:  width:"120px " height:"100px" style:"alignCenter" }

## 알게 된 내용

1. 아래의 이슈에 따라 해결하고 알게 된 내용을 제외하고는 없다.

## 발생한 Issue

1. 로그인 로직을 구현할 때 submit event에 따른 이슈 발생

원래 의도는 id만 입력했을 때에는 password도 입력해야 한다는 alert창을 띄우고 입력된 id를 그대로 두는 것을 원했는데 submit이벤트가 발생하면서 사이트가 새로고침되어 state가 날라가 입력한 내용이 날라가는 이슈

=> 해결 완료. 관련 내용 포스팅 예정

## 앞으로 해야하는 내용

1. Sidebar 기능 bug 해결하기
2. sidebar기능에 대한 코드와 그에 대한 설명 포스팅

## 오늘의 후기

오늘은 Daily Leetcode의 Hard문제를 건드리고 계속해서 해결하려다 시간을 많이 보내기도 했고 로그인 UI도 Sidebar문제가 해결되지 않아 내가 원하는 대로 되지 않았기에 한 것이 별로 없었고 일단 간단한 로그인 화면과 간단한 로그인 로직만 구현해보았다. 그래도 계속해서 차근차근 하다보면 나아지겠지. 틈틈히 pure javascript에 대한 공부도 조금 해보기!