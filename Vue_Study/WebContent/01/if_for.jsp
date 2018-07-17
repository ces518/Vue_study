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

���ǹ��� �ݺ���

v-if 

v-if��Ƽ�긦 ����Ͽ� ���ǹ��� Ȱ���Ͽ� �������� �������̰���.

 -->
 
 
 <div id="app-3">
 	<p v-if="cantSeen">���� �����־��</p>
 </div>
 
 <!-- 
 v-for
 
 v-for ��Ƽ�긦 ����Ͽ� �ݺ���ó�� ����̰����ϴ�.
 
 item in items �� �������� �����Ǿ��ִ�. [for-each]
 
 index�� �޾ƿ��� 
 
 �������� ���������� index���� ����������
 
 (todo,index) in todos ��� ����ϸ�ȴ�.
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
 				{text:'JavaScript����'},
 				{text:'Vue ����'},
 				{text:'���� �������� �����'}
 			]
 		}
 	});
 </script>


</body>
</html>