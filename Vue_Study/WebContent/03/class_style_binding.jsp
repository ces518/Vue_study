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
클래스와 스타일 바인딩

데이터 바인딩은 엘리먼트의 클래스 목록과 인라인 스타일을 조작하기 위해
일반적으로 사용된다.

이  두 속성은 v-bind 를 사용하여 처리가 가능하다.
표현식으로 최종 문자열을 계산하면 된다.

Vue는 class와 style에 v-bind를 사용할때 향상된 기능을 제공.
 -->
 
 <!-- 
 # 객체구문
 클래스를 동적으로 토글하기위해 v-bind:class 에 객체를 전달할수 있다.
  -->
  <div v-bind:class="{ active : isActive}"></div>
  <!-- 
  active 클래스의 존재여부가 isActive에 의해 결정됨.
  
  객체에 필드가 더있으면 여러 클래스를 토글할수있다.
  v-bind:class 디렉티브는 일반 class 속성과 공존할수 있다.

	랜더링 결과
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
   
   
   <!-- 인라인으로 할필요없이 다음과 같은 방법도 가능하다. -->
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
	계산된 속성에도 바인딩할수있다.
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
	# 배열구문
	
	v-bind:class 에 배열을 전달하여 클래스 목록을 지정할수 있다.
	
	랜더링 결과
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
	
	<!-- 삼항연산자도 이용가능하다. -->
	
	<div v-bind:class="[isActive ? activeClass : '' , errorClass]"></div>
		
		
	<!--  
	컴포넌트와 함께 사용하는방법
	
	사용자 정의 컴포넌트로 class 속성을 사용하면
	클래스가 컴포넌트의 루트 엘리먼트에 추가된다.
	이 엘리먼트는 기존 클래스는 덮어쓰지않음.
	-->	
	<my-component class="baz boo"></my-component>
	<script>
		Vue.component('my-component',{
			template: '<p class="foo bar"> Hi </p>'
		});
	</script>
	
	
	<!-- 
	인라인 스타일 바인딩
	
	# 객체구문
	
	v-bind:style  객체구문은 매우 직설적 이다.
	css처럼 보이지만 JavaScript 객체이다.
	속성명에 camelCase 와 kebab-case(따옴표를 함께사용) 를 사용할수있습니다. 
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
	 <!-- 스타일 객체에 직접바인딩하여 템플릿이 더간결하게 되도록하는것이 좋다. -->
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
	 # 배열구문
	 
	 v-bind:style 에 대한 배열구문은 여러개의 스타일 객체를 사용할수있게합니다.
	  -->
	  <div v-bind:style="[baseStyles, overridingStyles]"></div>
	  
	  <!--
	  # 자동접두사
	  
	  v-bind:style 에 벤더접두어가 필요한 css속성 을 사용하면
	  Vue 는 자동으로 해당 접두어를 감지하여 스타일을 적용한다.
	  
	  # 다중값 제공
	    -->
	   <div v-bind:style="{ display: ['-webit-box','-ms-flexbox','flex']}"></div> 
	   
	   <!-- 브라우저가 지원하는 배열의 마지막 값만 렌더링한다. -->
</body>
</html>