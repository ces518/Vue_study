<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Vue.js CDN Ȱ���Ͽ� �ҷ����� -->
	<script type="text/javascript" src="https://unpkg.com/vue/dist/vue.js"></script>
</head>
<body>

<!-- 
 v-bind �� �̿��Ͽ� ������Ʈ�� �Ӽ��� vue�� �����س��� �����͸� ���ε���ų���ִ�.

 v-bind �� �����̰����ϴ� 
 
  = v-bind:src 
  = :src 
  �� �����̰����ϴ�.
  
  v-bind �Ӽ��� ��Ƽ�����Ѵ�.
  ��Ƽ��� Vue���� �����ϴ� Ư���Ӽ�������Ÿ���� v-���ξ����.
  
 -->


<div id="app">
	<h1>Hello, {{ name }}</h1>
	<img  v-bind:src="feelsgood"/>
	<h2>��¥ : {{ Date() }}</h2>
</div>

<!-- ���׿����ڵ� ����̰����ϴ�. -->
<div id="app">
	<h1>Hello, {{ name }}</h1>
	<img  v-bind:src="smile ? feelsgood : feelsbad"/>
	<h2>��¥ : {{ Date() }}</h2>
</div>

	<script>
	var app = new Vue({
		el: '#app', //� ������Ʈ�� �������� ����
		data: { // data�� �ش�信�� ����������� ���Ѵ�.
			name : 'Vue',
			feelsgood: 'https://imgh.us/feelsgood_1.jpg',
			feelsbad: 'http://imgh.us/feelsbad.jpg',
			smile:true
		}
	});
	</script>

</body>


</html>