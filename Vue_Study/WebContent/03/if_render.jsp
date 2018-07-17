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
조건부 렌더링

v-if

v-if디렉티브를 사용하여 조건부 랜더링을 할수있다.
v-else와 함께 else블록을 추가하는것도 가능.
  -->

<h1 v-if="ok">yes</h1>
<h1 v-else>No</h1>

<!-- 
# <template> 에 v-if를 갖는 조건부 그룹생성

v-if는 디렉티브기 때문에 하나의 엘리먼트에 추가해야한다.
<template> 엘리먼트에 v-if를 사용할수있다.
렌더링 결과에는 <template>  엘리먼트가 포함되지않는다.
 -->
 <template v-if="ok">
 	<h1>Title</h1>
 	<p>Paragraph 1</p>
 	<p>Paragraph 2</p>
 </template>
 
 
 <!--
 
 # v-else
 
 v-else 디렉티브를 사용하여 v-if에 대한 else블록을 나타낼 수 있다.
   -->
<div v-if="Math.random() > 0.5">
	보인다.
</div> 
<div v-else>
	안보인다.
</div>
<!-- v-else 엘리먼트는 v-if 또는 v-else-if 엘리먼트 바로뒤에 존재해야한다. -->
 
 <!-- 
 
 # v-else-if
 
 v-else-if 블록은 v-if에 대한 else-if 블록 역할을 하며 여러개사용가능하다.
  -->
 
<div v-if="type === 'A'">
	A
</div>
<div v-else-if="type === 'B'">
	B
</div> 
<div v-else-if="type === 'C'">
	C
</div>
<div v-else>
	Not A/B/C
</div> 

<!-- v-else 와 마찬가지로 v-else-if 는  v-if 또는 v-else-if 바로뒤에 존재해야한다. -->

<!-- 

# key 를 이용한 재사용 가능 엘리먼트 제어
 -->

<template v-if="loginType === 'username'">
	<label>사용자명</label>
	<input placeholder="사용자명 입력">
</template>
<template v-else>
	<label>이메일</label>
	<input placeholder="이메일 입력">
</template>

<!-- 
위 코드에서 loginType 을 바꾸어도 입력한내용은 지워지지않음.
두 템플릿모두 같은요소를 사용하므로 input은 대체되지않고 placeholder만 변경된다.
유일값으로 사용하기위해 key 속성을 추가한다.
 -->
 <template v-if="loginType === 'username'">
	<label>사용자명</label>
	<input placeholder="사용자명 입력" key="username-input">
</template>
<template v-else>
	<label>이메일</label>
	<input placeholder="이메일 입력" key="email-input">
</template>

<!-- 

v-show

엘리먼트를 조건부로 표시하기위한 다른옵션은v-show 디렉티브.
사용법은 거의동일하다.
 -->
 <h1 v-show="ok">안녕하세요</h1>
 
 <!-- 차이점은 v-show가 있는 엘리먼트는 항상 렌더링되고 DOM에 남아있다.
 		v-show는 단순엘리먼트에 display CSS속성을 토글합니다.
  -->
 
 <!-- 
 v-if vs v-show
 
 v-if 는 토글비용이 높고 , v-show는 초기 렌더링비용이 높다.
 자주 바뀌는경우 v-show , 런타임시 조건이 바뀌지않으면 v-if를 권장.
 
 v-if 와 v-for
 
 v-if와 함께 사용하는경우 v-for는 높은 우선순위를 가진다.
  -->
 
 
</body>
</html>