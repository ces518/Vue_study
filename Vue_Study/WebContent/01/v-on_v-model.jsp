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
������Է��ڵ鸵

����ڰ� �۰���ȣ�ۿ밡���ϰ�

v-on ��Ƽ�긦 ����Ͽ� �̺�Ʈ������ ������ �����ϴ�.

 -->

<div id="app-5">
	<p>{{ message }}</p>
	<button v-on:click="reverseMessage"> �޼��� ������</button>
</div>


<!-- 
��������� ���ε��ϴ� v-model


������ -> �� ���·� ���ε��Ǿ� �����Ͱ��� ���ϸ� �ٷιٷξ�����Ʈ�Ǵ°� = �ܹ��� ���ε�

������ <-> �� ���·� ���ε��Ͽ� �����Ͱ� ��������� �帣�°� ���ִ°�.
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