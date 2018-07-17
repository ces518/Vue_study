<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
</head>
<body>
<!-- 
템플릿 문법

Vue.js 는 렌더링된 DOM을 기본 Vue인스턴스의 데이터에
선언적 바인딩이가능한 HTML기반 템플릿구문을 사용.

JavaScript 기본기능을선호하는경우 템플릿대신 렌더링 함수를
직접작성가능하며 JSX지원

 -->
 
 <!-- 
 
 보간법 ( Interpolation )
 
 # 문자열
 
 데이터바인딩의 가장 기본형태는 Mustache 구문 ( 이중 중괄호 ) 를 사용한 텍스트보간.
  -->
<span class="spans">메시지 : {{ msg }}</span>

<!-- 
Mustache 태그는 해당 데이터 객체의 msg 속성값으로 대체됨.
또한 데이터 객체의 msg속성이 변경시마다 갱신됨.
 
 v-once 디렉티브를 사용하여 데이터 변경시 입데이트 되지않는 일회성 보간을 수행할 수 있지만,
 같은 노드의 바인딩에도 영향을 미칩니다.
 --> 
<span class="spans" v-once>다시는 변경하지 않습니다 : {{ msg }}</span>



<!-- 

#원시 HTML

이중 중괄호는 HTML이 아닌 일반 텍스트로 데이터를 해석합니다.
실제 HTML을 출력하려면 v-html 디렉티브 사용해야합니다.

 -->
<p>Using v-html directive : <span id="element" v-html="rawHtml"></span></p>
<!-- 
span의 내용은rawHtml로 대체됩니다.
이 떄 데이터 바인딩은 무시됩니다.
Vue 문자열 기반 템플릿 엔진이 아니기때문에 v-html 을 이용하여 템플릿을 사용할수없습니다.
 -->
 <script>
 	new Vue({
 		el:'.spans',
 		data:{
 			msg:'메세지'
 		}
 	});
 	new Vue({
 		el:'#element',
		data:{
			rawHtml:'<span style="color:red;">test</span>'
		}
 	});
 </script>
 
<!-- 
	Mustaches 는 HTML 속성에서 사용할수 없습니다.
	대신v-bind 디렉티브사용
 --> 
<div v-bind:id="dynamicId"></div>
 <!--  
 boolean 속성을 사용할때 단순히 true 인 경우
 v-bind 는 조금 다르게 작동한다.
 -->
<button v-bind:disabled="isButtonDisabled">Button</button>
<!-- isButtonDisabled가 null, undefined, false의 값을가지면 disabled속성은 랜더링된
	button 엘리먼트에 포함되지않음.
 -->


<!-- 
#JavaScript 표현식 사용

지금까지 템플릿의 간단한 속성 키에만 바인딩했으나
실제로 Vue.js는 모든 데이터 바인딩내에서 JavaScript 표현식의 모든 기능을 지원합니다.
 -->

{{ number +1 }}
{{ ok ? 'YES' : 'NO' }}
{{ message.split('').reverse().join('') }}

<div v-bind:id="'list-' + id"></div>

</body>
</html>