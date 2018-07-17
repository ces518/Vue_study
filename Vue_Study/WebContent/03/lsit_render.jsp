<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cnd.jsdelivr.net/npm/vue"></script>
</head>
<body>

<!-- 

리스트 렌더링

v-for 로 엘리먼트에 배열 매핑하기

v-for 디렉티브를 사용하여 배열을 기반으로 리스트를 렌더링할수있다.

v-for 디렉티브는 item in items 형태로 특별한 문법이 필요.

items 는 원본데이터 배열이고 , item 은 반복되는 배열엘리먼트 변수명

 -->
<ul id="example-1">
	<li v-for="item in items">
		{{ item.message}}
	</li>
</ul>

<script>
	var example1 = new Vue({
		el : '#example-1',
		data : {
			items:[
				{ message : 'Foo'},
				{ message : 'Bar'}
			]
		}
	});
</script>

<!-- 

index 전달

v-for 디렉티브는 현재 항목의 인덱스에대한 두번째 전달인자옵션을 제공함.
 -->

<ul id="example-2">
	<li v-for="(item index) in items">
		{{ parentMessage }} - {{ index }} - {{ item.message }}
	</li>
</ul>

<!-- 

v-for 와 객체

v-for를 사용하여 객체의 속성을 반복할수도있다.
 -->
 
 <ul id="v-for-obj" class="demo">
 	<li v-for="value in object">
 		{{ value }}
 	</li>
 </ul>
 <script>
 	new Vue({
 		el : '#v-for-obj',
 		data:{
 			object:{
 				firstName ; 'John',
 				lastName : 'Doe',
 				age : 30
 			}
 		}
 	});
 </script>
 
 
 <!-- 
 
 Key
 
 Vue 가 v-for에서 렌더링된 엘리먼트목록을 갱신할때 
 in-place-patch 전략을 사용한다.
 Vue 가 각 노드의ID를 추적하고 기존엘리먼트를 재사용하고 , 재정렬할수있도록 힌트를제공하려면
 고유한  key속성을 제공해야한다.
 v-bind를 사용하여 동적값에 바인딩해야한다.
  -->
  
  <div v-for="item in items" :key="item.id">
  	<!-- content -->
  </div>
  
<!-- 
배열변경감지

# 변이메서드

vue는 감시중인 배열의 변이 메서드를 래핑하여 뷰 갱신을 트리거한다.
래핑된 메서드는 다음과같다.

push()
pop()
shift()
unshift()
splice()
sort()
reverse()


 -->  
 
 
 <!-- 
 
 # 배열 대체
 
 변이 메서드는 호출된 원본배열을 변형한다.
 
 변형하지않는 방법도 제공합니다.
 
 filter() , concat(), slice() 
 
 이 방법을 사용하면 원본배열을 변형하지않고 항상 새 배열을 반환한다.
 
 example1.items = example1.items.filter(function(item){
 	return item.message.match(/Foo/);
 });
 
 기존 것을버리고 전체목록을 다시렌더링하는것이 아니다.
 재사용을 극대화하기위해 겹치는개체가 포함된 다른배열로 대체하여 효율적이다.
  
  
 # 주의사항
 
 JavaScript 의 제한으로 인해 Vue는 배열에 대해 다음 변경사항을 감지할수없다.
 
 1.인덱스로 배열에있는항목을 직접설정하는경우
 vm.items[indexOfItem] = newValue;
 
 2.배열길이를 수정하는경우
 vm.items.length = newLength; 
  
  
 1번을 극복하기위해 
 다음 두경우모두 1번과 동일하게 수행하며 반응형 시스템에서도 상태변경을 트리거한다.
 
 Vue.set(example1.items,indexOfItem,newValue);
 example1.items.splice(indexOfItem,1,newValue);
 
 
 2번을 극복하기위해 splice를 사용해야한다. 
 
 example1.itesm.splice(newLength);
  -->
  
  <!--  
  
  객체변경 감지에 관한 주의사항
  
  JavaScript의 한계로 Vue는 속성추가및 삭제를 감지하지못한다.
  
  var vm = new Vue({
  	data:{
  		a:1
  	}
  });
  
  //vm.a 는 반응형
  
  vm.b = 2;
  //vm.b는 반응형이아니다.
  
  Vue.set(object,key,value);메서드를 활용하면
  중첩된 객체에 반응형속성을추가할수있다.
  
  vue.set(vm,'age',27);
  
  인스턴스메서드인vm.$set을 사용할수도있다.
  vm.$set();
  
  Obejct.assign() 이나 _.extend() 를 사용해 기존객체에 새 속성을 할당할수있다.
  
  Object.assign(this.userProfile,{
  		age:27,
  		favoriteColor: 'Vue Green'
  });
  
  this.userProfile = Object.assign({}, this.userProfile, {
  age: 27,
  favoriteColor: 'Vue Green'
})
  -->
  
  
  <!-- 
  
  
  필터링 / 정렬된 결과 표시
  
   -->
  <div id="app">
  	<li v-for="n in evenNumber">{{ n }}</li>
	<li v-for="n in even(numbers)">{{ n }}</li>
  </div>
  <script>
  	new Vue({
  		el:'#app'
  		data:{
  			numbers:[1,2,3,4,5]
  		},
  		computes:{
  			evenNumber:function(){
  				return this.numbers.filter(function(number){
  					return number % 2 === 0;
  				});
  			}
  		},
  		methods:{
  			even: function(numbers){
  				return numbers.filter(function(number){
  					return number % 2 === 0;
  				});
  			}
  		}
  	});
  	// 계산된속성을 사용할수없는상황 ( 중첩된 v-for 루프내부 )
  </script>
  
  <!--
  
  Range v-for
  
  v-for는 숫자를 사용할수있다.
  이 경우 템플릿을 여러번반복한다.
    -->
  <div>
  	<span v-for="n in 10">{{ n }}</span>
  </div>
  
  
  <!-- 
  
  v-for 템플릿
  
  v-if와 마찬가지로  <template> 태그를 사용해 여러엘리먼트의블럭을렌더링할수있다.
   -->
  
  <ul>
  	<template v-for="item in items">
  		<li>
			{{ items.msg }}  		
  		</li>
  		<li class="divider"></li>
  	</template>
  </ul>
  
  <!-- 
  
  v-for와 v-if
  
  동일한 노드에 둗가지 모두있다면 , v-for가 v-if보다 높은우선순위를 가진다.
  v-if는 루프가 반복될때마다 실행된다.
  
   -->
  
  <li v-for="todo in todos" v-if="!todo.isComplete">
  	{{ todo }}
  </li>
  
  <!-- 
  
  v-for와  컴포넌트
   -->
  	
  	<my-component v-for="item in items" :key="item.id"></my-component>
  	<my-component 
  		v-for="(item in index) in items"
  		v-bind:item="item"
  		v-bind:index="index"
  		v-bind:key="item.id"
  	></my-component>
  	
</body>
</html>