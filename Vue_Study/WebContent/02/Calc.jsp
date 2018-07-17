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
계산된 속성과 감시자

계산된 속성

템플릿 내에서 사용하는 표현식은 편리하지만 너무많은 로직을 템플릿에 넣으면 유지보수가 어렵다.

복잡한 로직의 경우 반드시 계산된 속성을 사용해야합니다.
 -->

<div id="example">
	<p>원본 메시지 : "{{ message}}"</p>
	<p>뒤집히도록 계산된 메시지  : "{{ reversedMessage}}"</p>
	<p>뒤집힌 메시지 : "{{ reversedMsg() }}"</p>
</div>

<script>
	var vm = new Vue({
		el:'#example',
		data:{
			message:'안녕하세요'
		},
		computed:{
			reversedMessage:function(){
				// this 는 vm인스턴스를 가리킨다.
				return this.message.split('').reverse().join('');
			}
		},
		 
	/* 	# 계산된 캐싱 vs 메서드

		표현식에서 메서드를 호출하여 같은결과를 얻을 수 있다
		  */
		methods:{
			reversedMsg: function(){
				return this.message.split('').reverse().join('');
			}
		}
	});
	/* 
	계산된 속성대신 메서드와같은 함수를 정의할수 있다.
	방식은 서로 동일하지만 차이점은 계산된 속성은 종속성에 따라 캐시된다는 것입니다.
	
	계산된 속성은 종속성중 일부가 변경된 경우에만 다시계산된다.
	message가 변경되지않는 한 계산된 속성인reversedMessage에 대한 접근은
	다시 수행할필요없이 이전에 계산된 결과를 즉시 반환한다.
	
	Date.now() 가 반응형 의존성을 가지지않기때문에 업데이트되지않는다는것을 의미
	메서드호출은 재 렌더링마다 항상 메서드를 호출한다.
	*/
</script>

 <!-- 
 
 # 계산된속성 vs 감시된 속성
 
 Vue는 Vue인스턴스의 속성감시 방법을 제공.
 다른 데이터 기반으로 변경할 필요가 있는경우 
 watch 콜백보다 계산된 속성을 사용하는것이 좋다.
  -->
 <div id="demo">{{ fullName }}</div>
 
 <script>
 	var vm = new Vue({
 		el:'#demo',
 		data:{
 			firstName: 'Foo',
 			lastName: 'Bar',
 			fullName: 'Foo Bar'
 		},
 		watch:{
 			firstName: function(val){
 				this.fullName = val + ' '+this.lastName;
 			},
 			lastName: function(){
 				this.fullName = this.firstName + ' '+val;
 			}
 		}
 		//위 코드는 반복이 필수적이기 때문에 계산된속성 을 사용.
 		,computed:{
 			fullName:function(){
 				return this.firstName + ' ' + this.lastName;
 			}
 		}
 	});
 </script> 
 
 <!--  
 # 계산된 setter
 
 계산된 속성은 기본적으로 getter만 가지고있지만 필요한경우 setter를 제공할수도 있습니다.
 -->
 <script>
 	new Vue({
 		computed:{
 			fullName:{
 				get : function(){
 					//생략 
 				},
 				set : function(newValue){
 					var names = newValue.split(' ');
 					this.firstName = names[0];
 					this.lastName = names[names.length-1]
 				}
 			}
 		}
 	});
 </script>
 
 
 <!-- 
 감시자
 
 대부분 계산된속성이 더 적합하지만 감시자가 필요한경우도 존재.
 Vue 에서 watch 옵션을 통해 데이터 변경에 반응하는 방법제공 
 데이터 변경에 대한 응답으로 비동기식 또는 시간이 많이 소요되는 조작을 수행하려는 경우에 가장 유용하다.
  -->
  
 <div id="watch-example">
 	<p>
 		yes/no 질문을 물어보세요 :
 		<input v-model="question"/>
 	</p>
 	<p>{{ answer }}</p>
 </div> 
</body>
</html>