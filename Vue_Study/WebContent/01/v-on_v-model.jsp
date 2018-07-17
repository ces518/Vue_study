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
사용자입력핸들링

사용자가 앱과상호작용가능하게

v-on 디렉티브를 사용하여 이벤트리스너 설정이 가능하다.

 -->

<div id="app-5">
	<p>{{ message }}</p>
	<button v-on:click="reverseMessage"> 메세지 뒤집기</button>
</div>


<!-- 
양방향으로 바인딩하는 v-model


데이터 -> 뷰 형태로 바인딩되어 데이터값의 변하면 바로바로업데이트되는것 = 단방향 바인딩

데이터 <-> 뷰 형태로 바인딩하여 데이터가 양방향으로 흐르는게 해주는것.
 -->

<div id="app-6">
	<p>{{ message }}</p>
	<input v-model="message"/>
</div>

<script>
	var app5 = new Vue({
		el:'#app-5',
		data:{
			message:'Hello Vue.js'
		},
		methods:{
			reverseMessage:function(){
				this.message = this.message.split('').reverse().join('')
			}
		}
	});
	
	var app6 = new Vue({
		el:'#app-6',
		data:{
			message:'Hello Vue'
		}
	});
</script>
</body>
</html>