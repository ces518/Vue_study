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

조건문과 반복문

v-if 

v-if디렉티브를 사용하여 조건문을 활용하여 동적으로 랜더링이가능.

 -->
 
 
 <div id="app-3">
 	<p v-if="cantSeen">나를 볼수있어요</p>
 </div>
 
 <!-- 
 v-for
 
 v-for 디렉티브를 사용하여 반복문처럼 사용이가능하다.
 
 item in items 의 형식으로 구성되어있다. [for-each]
 
 index값 받아오기 
 
 랜더링시 각원스들의 index값을 가져오려면
 
 (todo,index) in todos 라고 사용하면된다.
  -->
 
 <div id="app-4">
 	<ol>
 		<li v-for="todo in todos">
			{{todo.text}}
 		</li>
 	</ol>
 </div>
 
 <script>
	var app3 = new Vue({
 		el:'#app-3',
 		data:{
 			seen:true,
 			cantSeen:false
 		}
 		
 	});
 	var app4 = new Vue({
 		el:'#app-4',
 		data:{
 			todos:[
 				{text:'JavaScript배우기'},
 				{text:'Vue 배우기'},
 				{text:'무언가 멋진것을 만들기'}
 			]
 		}
 	});
 </script>


</body>
</html>