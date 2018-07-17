<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
</head>
<body>
<!-- 
Vue 인스턴스 만들기

모든 Vue앱은 Vue함수로 새 Vue 인스턴스를 생성해야함.


var vm = new Vue({
	// 옵션
});


Vue인스턴스를 인스턴스화 할때는 데이터, 템플릿, 엘리먼트, 메소드, 라이프사이클 콜백등 
options객체를 전달해야함.



속성과 메서드 

각 Vue 인스턴스는 data 객체에 있는 모든속성을 프록시 처리합니다.
 -->
 
  <div id="app-1">
 	<p>{{ foo }}</p>
 	<button v-on:click="foo = 'baz'">Change</button> 
 </div>
 
 <div id="example">
 	<p> {{ data }}</p>
 </div>
 <script>
 //데이터객체
 	var data = { a:1 };
 //Vue 인스턴스에 data객체를 추가	
 	var vm = new Vue({
 		data : data
 	});
 
 //같은객체를 참조
 vm.a === data.a 
 vm.a = 2;
 data.a = 2;
 
 // data속성들은 인스턴스가 생성될때 존재한것들만 '반응형' 이다.
 // 다음과같이 새속성을 추가하면 반응형이아님.
 vm.b = 'hi';
 
 // 나중에 필요한속성이며 , 빈값이거나 존재하지않은 상태로 시작한다면 아래와같이 초기값을 지정해주어야함.
  	var vm2 = new Vue({
 		data : {
 			newTodoText : '',
 			visitCount : 0,
 			hideCompletedTodos : false,
 			todos : [],
 			error : null
 		}
 	});
 
 //Object.freeze(); 를 사용하면 기존속성이 변경되는것을 막아 반응형이 되지못함.
 var obj = {
		 foo :'bar'
 }
 
 Object.freeze(obj);
 
 new Vue({
	 el:'#app-1',
	 data : obj
 });

 //Vue 인스턴스는 데이터 속성이외에도 유용한 인스턴스 속성 및 메서드를 제공합니다.
 // 사용자 정의속성과 구분하기위해 $ 접두어를 붙였습니다.
 
 vm.$data === data;
 vm.$el === document.getElementById('example');
 
 
 
 //$watch 는 인스턴스메서드
 vm.$watch('a',function(newVal, oldVal){
	 // vm.a 가 변경되면 호출됨.
 });
 
 
 </script>

 
 
 <!-- 
 	인스턴스 라이프사이클 훅
 	
 	각 Vue 인스턴스는 데이터 관찰을 설정하고 , 템플릿을 컴파이랗고, 인스턴스를 DOM에 마운트하고,
 	데이터가 변경될떄 DOM을 업데이트해야 할 때 일련의 초기화 단계를 거칩니다.
 	사용자 정의로직을 실행할수있는 라이프사이클 훅도 호출됨.
 	
 	create 훅은 인스턴스가 생성된후에 호출됩니다.
  -->
<h2>라이프사이클 다이어그램</h2>
<img id="img" v-bind:src="url" width="20%"/> 

<script>
	new Vue({
		el:'#img',
		data : {
			a:1,
			url:'${pageContext.request.contextPath}/img/lifecycle.png'
		},
		created:function(){
			console.log('a is = ' + this.a);
		}
	});
</script> 

<!-- 
	인스턴스 라이프사이클의 여러단계에서 호출될 다른훅도있습니다.
	mounted, updated, destroyed 가 있습니다.
	모든 라이프사이클 훅은 this 컨텍스트가 호출하는 Vue인스턴스를 가리키며 호출됨.

 -->
</body>
</html>