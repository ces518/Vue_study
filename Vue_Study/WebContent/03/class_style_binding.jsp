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
Ŭ������ ��Ÿ�� ���ε�

������ ���ε��� ������Ʈ�� Ŭ���� ��ϰ� �ζ��� ��Ÿ���� �����ϱ� ����
�Ϲ������� ���ȴ�.

��  �� �Ӽ��� v-bind �� ����Ͽ� ó���� �����ϴ�.
ǥ�������� ���� ���ڿ��� ����ϸ� �ȴ�.

Vue�� class�� style�� v-bind�� ����Ҷ� ���� ����� ����.
 -->
 
 <!-- 
 # ��ü����
 Ŭ������ �������� ����ϱ����� v-bind:class �� ��ü�� �����Ҽ� �ִ�.
  -->
  <div v-bind:class="{ active : isActive}"></div>
  <!-- 
  active Ŭ������ ���翩�ΰ� isActive�� ���� ������.
  
  ��ü�� �ʵ尡 �������� ���� Ŭ������ ����Ҽ��ִ�.
  v-bind:class ��Ƽ��� �Ϲ� class �Ӽ��� �����Ҽ� �ִ�.

	������ ���
	= <div class="static active"></div>
   -->
   <div class="static"
   		v-bind:class="{ active: isActive, 'text-danger' : hasError}"
   ></div>
   <script>
   	new Vue({
   		data:{
			isActive:true,
			hasError:false
   		}
   	});
   </script>
   
   
   <!-- �ζ������� ���ʿ���� ������ ���� ����� �����ϴ�. -->
	<div v-bind:class="classObject"></div>
	
	<script>
		new Vue({
			data:{
				classObject:{
					active:true,
					'text-danger':false
				}
			}
		});
	</script>
	
	<!--
	���� �Ӽ����� ���ε��Ҽ��ִ�.
	  -->
	<div v-bind:class="classObj"></div>
	
	<script>
		new Vue({
			data:{
				isActive: true,
				error: null
			},
			computed: {
				classObj: function(){
					return {
						active : this.isActive && !this.error,
						'text-danger': this.error&& this.error.type === 'fatal'
					}
				}
			}
		});
	</script>
	
	<!-- 
	# �迭����
	
	v-bind:class �� �迭�� �����Ͽ� Ŭ���� ����� �����Ҽ� �ִ�.
	
	������ ���
	= <div class="active text-danger"></div>
	 -->
	<div v-bind:class="[activeClass, errorClass]"></div>
	
	<script>
		new Vue({
			data:{
				activeClass: 'active',
				errorclass : 'text-danger'
			}
		});
	</script>	
	
	<!-- ���׿����ڵ� �̿밡���ϴ�. -->
	
	<div v-bind:class="[isActive ? activeClass : '' , errorClass]"></div>
		
		
	<!--  
	������Ʈ�� �Բ� ����ϴ¹��
	
	����� ���� ������Ʈ�� class �Ӽ��� ����ϸ�
	Ŭ������ ������Ʈ�� ��Ʈ ������Ʈ�� �߰��ȴ�.
	�� ������Ʈ�� ���� Ŭ������ ���������.
	-->	
	<my-component class="baz boo"></my-component>
	<script>
		Vue.component('my-component',{
			template: '<p class="foo bar"> Hi </p>'
		});
	</script>
	
	
	<!-- 
	�ζ��� ��Ÿ�� ���ε�
	
	# ��ü����
	
	v-bind:style  ��ü������ �ſ� ������ �̴�.
	cssó�� �������� JavaScript ��ü�̴�.
	�Ӽ��� camelCase �� kebab-case(����ǥ�� �Բ����) �� ����Ҽ��ֽ��ϴ�. 
	 -->
	 <div v-bind:style="{color:activeColor,fontSize:fontSize + 'px'}"></div>
	 
	 <script>
	 	new Vue({
	 		data:{
	 			activeColor:'red',
	 			fontSize:30
	 		}
	 	});
	 </script>
	 <!-- ��Ÿ�� ��ü�� �������ε��Ͽ� ���ø��� �������ϰ� �ǵ����ϴ°��� ����. -->
	 <div v-bind:style="styleObj"></div>
	 
	 <script>
	 	new Vue({
	 		data:{
	 			styleObj:{
	 				color:'red',
	 				fontSize:'13px'
	 			}
	 		}
	 	});
	 </script>
	 
	 
	 <!-- 
	 # �迭����
	 
	 v-bind:style �� ���� �迭������ �������� ��Ÿ�� ��ü�� ����Ҽ��ְ��մϴ�.
	  -->
	  <div v-bind:style="[baseStyles, overridingStyles]"></div>
	  
	  <!--
	  # �ڵ����λ�
	  
	  v-bind:style �� �������ξ �ʿ��� css�Ӽ� �� ����ϸ�
	  Vue �� �ڵ����� �ش� ���ξ �����Ͽ� ��Ÿ���� �����Ѵ�.
	  
	  # ���߰� ����
	    -->
	   <div v-bind:style="{ display: ['-webit-box','-ms-flexbox','flex']}"></div> 
	   
	   <!-- �������� �����ϴ� �迭�� ������ ���� �������Ѵ�. -->
</body>
</html>