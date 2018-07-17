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

폼 입력 바인딩

v-model 디렉티브를 사용하여
input과 textarea에 양방향 데이터바인딩을 생성가능.

v-model은 모든 form엘리먼트의 초기 value checked selected속성을 무시한다.
컴포넌트의 data옵션 안에있는 JavaScript에서 초기값을 선언해야한다.
 -->
 
 
<!-- #문자열 -->

<input v-model="message" placeholder="여기를 수정해보세요">
<p>메시지: {{ message }}</p>

<!-- #여러줄을 가진 문장 -->
<span>여러 줄을 가지는 메시지:</span>
<p style="white-space: pre-line">{{ message }}</p>
<br>
<textarea v-model="message" placeholder="여러줄을 입력해보세요"></textarea>

<!-- 텍스트 영역의 보간 <textarea>{{ text }}</textarea>
	은작동하지않으며 대신 v-model을 사용해야한다.
 -->


<!-- #체크박스
하나의 체크박스는 단일 boolean값을 가진다.
 -->
<input type="checkbox" id="checkbox" v-model="checked">
<label for="checkbox">{{ checked }}</label>

<!-- 여러개의 체크박스는 같은배열을 바인딩할수있다. -->
<div id='example-3'>
  <input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
  <label for="jack">Jack</label>
  <input type="checkbox" id="john" value="John" v-model="checkedNames">
  <label for="john">John</label>
  <input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
  <label for="mike">Mike</label>
  <br>
  <span>체크한 이름: {{ checkedNames }}</span>
</div>
<script>
	new Vue({
		el:'#exmaple-3',
		data:{
			chekedNames:[]
		}
	});
</script>


<!-- #라디오 -->
<input type="radio" id="one" value="One" v-model="picked">
<label for="one">One</label>
<br>
<input type="radio" id="two" value="Two" v-model="picked">
<label for="two">Two</label>
<br>
<span>선택: {{ picked }}</span>

<!-- #셀렉트 -->
<select v-model="selected">
  <option disabled value="">Please select one</option>
  <option>A</option>
  <option>B</option>
  <option>C</option>
</select>
<span>선택함: {{ selected }}</span>
<script>
	new Vue({
		el:'',
		data:{
			selected:''
		}
	});
</script>

<!-- 다중셀렉트  -->
<select v-model="selected" multiple>
  <option>A</option>
  <option>B</option>
  <option>C</option>
</select>
<br>
<span>Selected: {{ selected }}</span>

<!-- v-for를 이용한  동적옵션 렌더링 -->
<select v-model="selected">
  <option v-for="option in options" v-bind:value="option.value">
    {{ option.text }}
  </option>
</select>
<span>Selected: {{ selected }}</span>

<script>
	new Vue({
	  el: '...',
	  data: {
	    selected: 'A',
	    options: [
	      { text: 'One', value: 'A' },
	      { text: 'Two', value: 'B' },
	      { text: 'Three', value: 'C' }
	    ]
	  }
	})
</script>

<!-- 

값 바인딩하기

라디오, 체크박스 및 셀렉트 옵션의경우 v-model 바인딩값은 보통 정적인 문자열 or 체크박스의 boolean 
 -->
<!-- `picked` 는 선택시 문자열 "a" 입니다 -->
<input type="radio" v-model="picked" value="a">

<!-- `toggle` 는 true 또는 false 입니다 -->
<input type="checkbox" v-model="toggle">

<!-- `selected`는 "ABC" 선택시 "abc" 입니다 -->
<select v-model="selected">
  <option value="abc">ABC</option>
</select>

<!-- # 체크박스 -->
<input
  type="checkbox"
  v-model="toggle"
  true-value="yes"
  false-value="no"
>
// 체크된 경우
vm.toggle === 'yes'
// 체크 되지 않은 경우
vm.toggle === 'no'

<!-- # 라디오 -->
<input type="radio" v-model="pick" v-bind:value="a">
// 체크 하면:
vm.pick === vm.a

<!-- # 셀렉트 옵션 -->
<select v-model="selected">
  <!-- inline object literal -->
  <option v-bind:value="{ number: 123 }">123</option>
</select>
// 선택 하면:
typeof vm.selected // -> 'object'
vm.selected.number // -> 123


<!--

수식어


#.lazy

v-model은 각 입력 이벤트후 입력과 데이터를 동기화한다.
.lazy 수식어를 추가하여 change이벤트이후 동기화할수있다.
  -->
 <!-- "input" 대신 "change" 이후에 동기화 됩니다. -->
<input v-model.lazy="msg" > 
 
 
<!-- 

#.number

사용자 입력이 자동으로 숫자로 형변환되기를 원하는경우
v-model이 관리하는 input에 number수식어를 추가한다.
 
 type=number를 사용하는경우에도 HTML입력 엘리먼값은 항상 문자열을 반환함.
 -->
 <input v-model.number="age" type="number">
 
 <!-- 
 
 # .trim
 
 v-model이 관리하는 input을 자동으로 trim하기 원하면 trim수정자를 추가하면된다.
  -->
<input v-model.trim="msg">



 
</body>
</html>