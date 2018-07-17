<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Vue.js CDN 활용하여 불러오기 -->
	<script type="text/javascript" src="https://unpkg.com/vue/dist/vue.js"></script>
</head>
<body>

<!-- 
 v-bind 를 이용하여 엘리먼트의 속성과 vue에 정의해놓은 데이터를 바인딩시킬수있다.

 v-bind 는 생략이가능하다 
 
  = v-bind:src 
  = :src 
  로 생략이가능하다.
  
  v-bind 속성은 디렉티브라고한다.
  디렉티브는 Vue에서 제공하는 특수속성임을나타내는 v-접두어가있음.
  
 -->


<div id="app">
	<h1>Hello, {{ name }}</h1>
	<img  v-bind:src="feelsgood"/>
	<h2>날짜 : {{ Date() }}</h2>
</div>

<!-- 삼항연산자도 사용이가능하다. -->
<div id="app">
	<h1>Hello, {{ name }}</h1>
	<img  v-bind:src="smile ? feelsgood : feelsbad"/>
	<h2>날짜 : {{ Date() }}</h2>
</div>

	<script>
	var app = new Vue({
		el: '#app', //어떤 엘리먼트에 적용할지 결정
		data: { // data는 해당뷰에서 사용할정보를 지닌다.
			name : 'Vue',
			feelsgood: 'https://imgh.us/feelsgood_1.jpg',
			feelsbad: 'http://imgh.us/feelsbad.jpg',
			smile:true
		}
	});
	</script>

</body>


</html>