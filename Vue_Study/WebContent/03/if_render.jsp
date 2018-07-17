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
���Ǻ� ������

v-if

v-if��Ƽ�긦 ����Ͽ� ���Ǻ� �������� �Ҽ��ִ�.
v-else�� �Բ� else����� �߰��ϴ°͵� ����.
  -->

<h1 v-if="ok">yes</h1>
<h1 v-else>No</h1>

<!-- 
# <template> �� v-if�� ���� ���Ǻ� �׷����

v-if�� ��Ƽ��� ������ �ϳ��� ������Ʈ�� �߰��ؾ��Ѵ�.
<template> ������Ʈ�� v-if�� ����Ҽ��ִ�.
������ ������� <template>  ������Ʈ�� ���Ե����ʴ´�.
 -->
 <template v-if="ok">
 	<h1>Title</h1>
 	<p>Paragraph 1</p>
 	<p>Paragraph 2</p>
 </template>
 
 
 <!--
 
 # v-else
 
 v-else ��Ƽ�긦 ����Ͽ� v-if�� ���� else����� ��Ÿ�� �� �ִ�.
   -->
<div v-if="Math.random() > 0.5">
	���δ�.
</div> 
<div v-else>
	�Ⱥ��δ�.
</div>
<!-- v-else ������Ʈ�� v-if �Ǵ� v-else-if ������Ʈ �ٷεڿ� �����ؾ��Ѵ�. -->
 
 <!-- 
 
 # v-else-if
 
 v-else-if ����� v-if�� ���� else-if ��� ������ �ϸ� ��������밡���ϴ�.
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

<!-- v-else �� ���������� v-else-if ��  v-if �Ǵ� v-else-if �ٷεڿ� �����ؾ��Ѵ�. -->

<!-- 

# key �� �̿��� ���� ���� ������Ʈ ����
 -->

<template v-if="loginType === 'username'">
	<label>����ڸ�</label>
	<input placeholder="����ڸ� �Է�">
</template>
<template v-else>
	<label>�̸���</label>
	<input placeholder="�̸��� �Է�">
</template>

<!-- 
�� �ڵ忡�� loginType �� �ٲپ �Է��ѳ����� ������������.
�� ���ø���� ������Ҹ� ����ϹǷ� input�� ��ü�����ʰ� placeholder�� ����ȴ�.
���ϰ����� ����ϱ����� key �Ӽ��� �߰��Ѵ�.
 -->
 <template v-if="loginType === 'username'">
	<label>����ڸ�</label>
	<input placeholder="����ڸ� �Է�" key="username-input">
</template>
<template v-else>
	<label>�̸���</label>
	<input placeholder="�̸��� �Է�" key="email-input">
</template>

<!-- 

v-show

������Ʈ�� ���Ǻη� ǥ���ϱ����� �ٸ��ɼ���v-show ��Ƽ��.
������ ���ǵ����ϴ�.
 -->
 <h1 v-show="ok">�ȳ��ϼ���</h1>
 
 <!-- �������� v-show�� �ִ� ������Ʈ�� �׻� �������ǰ� DOM�� �����ִ�.
 		v-show�� �ܼ�������Ʈ�� display CSS�Ӽ��� ����մϴ�.
  -->
 
 <!-- 
 v-if vs v-show
 
 v-if �� ��ۺ���� ���� , v-show�� �ʱ� ����������� ����.
 ���� �ٲ�°�� v-show , ��Ÿ�ӽ� ������ �ٲ��������� v-if�� ����.
 
 v-if �� v-for
 
 v-if�� �Բ� ����ϴ°�� v-for�� ���� �켱������ ������.
  -->
 
 
</body>
</html>