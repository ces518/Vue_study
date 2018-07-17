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
컴포넌트를 활용한 작성방법

Vue에서 컴포넌트는 미리정의된 옵션을가진 인스턴스

 -->


<ol>
	<!--  todo-item 컴포넌트의 인스턴스 만들기 -->
	<todo-item></todo-item>
</ol>


<!-- 
todo-item 컴포넌트가
1.v-for 를 이용하여 itemList에서 item을 하나씩 꺼내옴.
2.item을 미리 정의해둔 todo 라는 이름이 props로 넣어준다
3.todo.text를 통해 text값과 li태그를 생성
4.itemList만큼 랜더링된다.
 -->
<div id="app-7">
	<ol>
		<todo-item
			v-for="item in itemList"
			v-bind:todo="item"
			v-bind:key="item.id">
		</todo-item>
	</ol>
</div>

<script>
// todo-item 이름을가진 컴포넌트를 정의합니다.
// todo-item 컴포넌트는 prop라는 
// 사용자 정의속성을 입력받을수있다.
// 이 prop는 todo라는 이름으로 정의.
	Vue.component('todo-item',{
		props:['todo'],
		template:'<li>{{ todo.text }} </li>'
	});
	
	var app7 = new Vue({
		el:'#app-7',
		data:{
			itemList : [
				{ id: 0 , text: 'value0'},
				{ id: 1 , text: 'value1'},
				{ id: 2 , text: 'value2'},
				{ id: 3 , text: 'value3'},
			]
		}
	});
</script>
</body>
</html>