---
title: "[FintechMan] 4. 회원가입 UI와 로그인/회원가입 서버 붙이기"
author: egogit
date: '2024-02-05 23:50:00'
categories:
- Project
- FintechMan
tags:
- project
- fintechman
---

![thumbnail](/assets/img/thumbnail/fintechman.png){:  width:"120px " height:"100px" style:"alignCenter" }


## 3일차 개발 내용

![thumbnail](/assets/img/post/fintechman/240205-fintechman-4_1.png){:  width:"120px " height:"100px" style:"alignCenter" }

1. 재태크 관리 웹프로그램이기는 하지만 처음에는 크게 받을 정보가 없다고 생각하여 id와 password만으로 회원가입을 가능하게 하기 위해 따로 페이지를 만들지 않고 모달창을 통해 회원가입을 받을 수 있도록 하였다. CSS를 통해 구현했는데 찾아보니 react-modal이라는 라이브러리를 통해서도 구현이 가능하다고 하며 useRef hook을 이용하여 구현한 것도 있었다.(관련 내용은 나중에 포스팅을 해봐야겠다.) 

2. 로그인 화면과 회원가입 화면을 구현했으므로 이들이 실제로 동작하도록 Server를 개발하였다. MariaDB와 연결하여 WEB_USER_INFO라고 하는 유저정보 테이블을 생성하였고 여기에 회원가입을 하게 되면 id와 password 그리고 salt가 넣어지게 된다. express를 이용한 auth api를 구현하였다. (테이블 명은 플랫폼_엔티티_대표속성 의 형식으로 지으려고 한다.) 이 경우에도 현재 생각해보니 salt의 경우 bcrypt를 이용하여 비밀번호의 해시화를 진행하였기 때문에 salt를 저장할 필요가 없다.(그 이유는 해시화된 비밀번호 앞에 salt가 붙어있기 때문이다.) 내일 해당 column을 제거하는 것으로!

<br/><br/>
## 알게 된 내용

1. 모달창이라는 존재에 대해서 알고 구현 방법을 생각해보고 구현할 수 있었다. 거의 참고를 많이 한 코드이긴 하기에 이에 대한 다양한 구현 방법에 대해서 찾아보면서 포스팅을 해봐야겠다. 

2. 그동안의 프로젝트에서는 비밀번호에 대한 암호화를 하지 않아 암호화를 해봐야겠다는 생각만 가지고 있었는데 드디어 이번에 Bcrypt를 이용한 회원가입 과정에서의 비밀번호의 암호화와 로그인 과정에서의 사용자의 validation확인 방법에 대한 절차를 구현을 해봄으로써 알 수 있게 되었다.

3. 기존에는 DB에 Query를 날리고 단순히 해당 row가 존재하는지만 확인해봤는데 이번 기회를 통해 만약 select를 통해서 데이터를 가져왔을 때 가져온 데이터에 대해 어떻게 다루어야 하는지 일 수 있었다.

<br/><br/>
## 발생한 Issue

1. input field에 password 속성을 추가하였지만 사용자가 password를 입력할 때 입력창에서는 비밀번호가 보이지 않지만 개발자 도구에서는 입력하고 있는 비밀번호가 보이는 문제 발생

2. VMWARE에서의 한글 깨짐 이슈.

첫번째는 해결방법이 password 속성 추가등 여러가지가 있었지만 안되었고 두번째 issue도 한글 사용 설정등 여러 가지 방법을 따라했지만 여전히 한글이 깨져보인다. 우분투를 다시 깔아봐야할 것 같다.


<br/><br/>
## 앞으로 해야하는 내용

1. Sidebar 기능 bug 해결하기

2. sidebar기능에 대한 코드와 그에 대한 설명 포스팅

3. salt를 DB에 저장하는 로직 제거하고 DB table에서도 제거하기

4. 회원가입시 해당 ID가 이미 존재하는지 여부에 대해 확인가능하게 만들기.

5. 로그인 상태에 대해 세션 유지를 어떻게 할지 찾아보고 생각해보기.

6. Bcrypt암호화 방식과 모달창에 관한 포스팅 작성해보기.

<br/><br/>
## 오늘의 후기

오늘 Daily Leetcode문제는 Easy난이도 문제로 굳이 올리지 않았고 어제의 Hard난이도 문제를 풀었는데 생각에 비해 코딩 실력이 잘 따라주지 않는다. 오늘은 알게 된 내용도 많았고 중간에 이슈들도 많이 나와서 많이 찾아보고 해결했는데 중간중간에 기록을 해놓지 않아서 지금 생각이 나지 않는다. 내일부터라도 틈틈이 issue랑 해결방법에 대해서 잘 기록해두는 습관을 들여야겠다. 내일부터는 저번학기 결국 해결하지 못했던 세션 유지에 대한 개발사항을 이번 프로젝트에서도 도전하게 되는데 이번에는 잘 되었으면 좋겠다.