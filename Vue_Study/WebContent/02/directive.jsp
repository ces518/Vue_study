<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
</head>
<body>
<!-- 
디렉티브

디렉티브는 v- 접두사가 있는 특수 속성.
디렉티브 속성 값은 단일 JavaScript 표현식이 된다. ( v-for 는 예외 )
디렉티브의 역할은 표현식의 값이 변경될 때 사이드이펙트를 반응적으로 DOM에 적용하는것
 -->
 
 <p v-if="seen">이제 나를 볼수있어요</p>
 <!-- v-if는 seen 표현의 진실성에 기반하여 <p> 엘리먼트를 제거 또는 삽입한다. -->
 
 
 <!--
 # 전달인자
 
 일부 디렉티브는 콜론으로 표시되는 전달인자를 사용할수있다.
 v-bind 디렉티브는 반응적으로 HTML속성을 갱신하는데 사용된다.
   -->
  <a v-bind:href="url">...</a>
  
  <!-- 또 다른예는 DOM이벤트를 수신하는 v-on 디렉티브 --> 
  <a v-on:click="doSomething"></a>
  <!-- 전달 인자는 이벤트를 받을이름  -->
  
  <!--
  # 수식어
  수식어는 점으로 표시되는 특수 접미사로 , 디렉티브를 특별한 방법으로
  바인딩 해야함을 나타냄.
  .prevent 수식어는 트리거된 이벤트에서 event.preventDefault() 를 호출하도록
  v-on에게 알려준다
    -->
<form v-on:submit.prevent="onSubmit"></form>

<!-- 

약어

v- 접두사는 템플릿의 Vue특정 속성을 식별하기 위한 시각적인 신호역할
Vue.js 가 모든템플릿을 관리하는 SPA를 만들 때 v-접두어 필요성이 떨어진다.

가장 자주사용되는 v-bind 와 v-on에 대해 특별한 약어를 제공합니다.
 -->
 
 <!-- # v-bind 약어 -->
<a v-bind:href="url">...</a>
<a :href="url"></a> 


<!-- # v-on 약어 -->
<a v-on:click="doSomething">...</a>
<a @:click="doSomething">...</a>

</body>
</html>