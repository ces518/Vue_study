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
������Ʈ�� Ȱ���� �ۼ����

Vue���� ������Ʈ�� �̸����ǵ� �ɼ������� �ν��Ͻ�

 -->


<ol>
	<!--  todo-item ������Ʈ�� �ν��Ͻ� ����� -->
	<todo-item></todo-item>
</ol>


<!-- 
todo-item ������Ʈ��
1.v-for �� �̿��Ͽ� itemList���� item�� �ϳ��� ������.
2.item�� �̸� �����ص� todo ��� �̸��� props�� �־��ش�
3.todo.text�� ���� text���� li�±׸� ����
4.itemList��ŭ �������ȴ�.
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
// todo-item �̸������� ������Ʈ�� �����մϴ�.
// todo-item ������Ʈ�� prop��� 
// ����� ���ǼӼ��� �Է¹������ִ�.
// �� prop�� todo��� �̸����� ����.
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