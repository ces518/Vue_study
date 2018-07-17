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
��Ƽ��

��Ƽ��� v- ���λ簡 �ִ� Ư�� �Ӽ�.
��Ƽ�� �Ӽ� ���� ���� JavaScript ǥ������ �ȴ�. ( v-for �� ���� )
��Ƽ���� ������ ǥ������ ���� ����� �� ���̵�����Ʈ�� ���������� DOM�� �����ϴ°�
 -->
 
 <p v-if="seen">���� ���� �����־��</p>
 <!-- v-if�� seen ǥ���� ���Ǽ��� ����Ͽ� <p> ������Ʈ�� ���� �Ǵ� �����Ѵ�. -->
 
 
 <!--
 # ��������
 
 �Ϻ� ��Ƽ��� �ݷ����� ǥ�õǴ� �������ڸ� ����Ҽ��ִ�.
 v-bind ��Ƽ��� ���������� HTML�Ӽ��� �����ϴµ� ���ȴ�.
   -->
  <a v-bind:href="url">...</a>
  
  <!-- �� �ٸ����� DOM�̺�Ʈ�� �����ϴ� v-on ��Ƽ�� --> 
  <a v-on:click="doSomething"></a>
  <!-- ���� ���ڴ� �̺�Ʈ�� �����̸�  -->
  
  <!--
  # ���ľ�
  ���ľ�� ������ ǥ�õǴ� Ư�� ���̻�� , ��Ƽ�긦 Ư���� �������
  ���ε� �ؾ����� ��Ÿ��.
  .prevent ���ľ�� Ʈ���ŵ� �̺�Ʈ���� event.preventDefault() �� ȣ���ϵ���
  v-on���� �˷��ش�
    -->
<form v-on:submit.prevent="onSubmit"></form>

<!-- 

���

v- ���λ�� ���ø��� VueƯ�� �Ӽ��� �ĺ��ϱ� ���� �ð����� ��ȣ����
Vue.js �� ������ø��� �����ϴ� SPA�� ���� �� v-���ξ� �ʿ伺�� ��������.

���� ���ֻ��Ǵ� v-bind �� v-on�� ���� Ư���� �� �����մϴ�.
 -->
 
 <!-- # v-bind ��� -->
<a v-bind:href="url">...</a>
<a :href="url"></a> 


<!-- # v-on ��� -->
<a v-on:click="doSomething">...</a>
<a @:click="doSomething">...</a>

</body>
</html>