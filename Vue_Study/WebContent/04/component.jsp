<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cnd.jsdelivr.net/npm/vue"></script>
</head>
<body>

<!--

컴포넌트


컴포넌트란 ?

Vue의 가장 강력한 기능중 하나

기본 HTML엘리먼트를 확장하여 재사용가능한 코드를 캡슐화하는데 도움이된다.
경우에 따라 특별한is속성으로 호가장된 원시 HTML로 나타낼수도있다.
  -->

<!-- 

컴포넌트 사용하기

# 전역등록
 -->


<div id="example">
	<my-comp></my-comp>
</div>

<script>
	new Vue({
		el:'#example',
		//옵션
	});
	
	Vue.component('my-comp',{
		template:'<div> 사용자 정의 컴포넌트 </div>'
	});
	//Vue는 상요자지정태그이름에대해 W3C규칙을 적용하지않음
	//( 모두소문자이고 하이픈포함 )
</script>

<!-- 

# 지역등록

컴포넌트를 components 인스턴스 옵션으로 등록함으로써
다른인스턴스/컴포넌트의 범위에서만 사용할수있는 컴포넌트를 생성할수있다.
 -->

<script>
	var child = {
			template: '<div> 사용자 정의 컴포넌트 </div>'
	}
	
	new Vue({
		components:{
			'my-component' : child
		}
	});
</script>


<!-- 

# DOM 템플릿 구문분석경고

DOM을 템플릿으로 사용할 때 , Vue는 템플릿컨텐츠만 가져올수있기때문에
HTML이 작동하는 방식에 고유한 몇가지 제한사항이 적용됩니다.
이는 브라우저가 구문분석과 정규화한 후에 작동합니다.
<ul>
<ol>
<table>
<select>
는 그안에올수있는 엘리먼트가 제한되어있다.
is 속성을 사용하면된다.
 -->
<table>
  <tr is="my-row"></tr>
</table>

<!-- 

# data는 반드시 함수여야한다.
 -->

<script>
	Vue.component('my-component',{
		template:'<span>{{ message }}</span>',
		data:{ //data는 인스턴스함수여야한다.
			message:'hello'
		}
	});
</script>

<div id="example-2">
  <simple-counter></simple-counter>
  <simple-counter></simple-counter>
  <simple-counter></simple-counter>
</div>

<script>
var data = { counter: 0 }

Vue.component('simple-counter', {
  template: '<button v-on:click="counter += 1">{{ counter }}</button>',
  // 데이터는 기술적으로 함수이므로 Vue는 따지지 않지만
  // 각 컴포넌트 인스턴스에 대해 같은 객체 참조를 반환합니다.
//   data: function () {
//     return data
//   }
  data: function () {
	  return {
	    counter: 0
	  }
	}
})

new Vue({
  el: '#example-2'
})
</script>

<!-- 

# 컴포넌트 작성

Vue.js 에서 부모-자식 컴포넌트 관계는 props 는 아래 , events는 위로 이다.
부모는 props를 통해 자식에게 데이터를 전달하고
자식은 events를 통해 부모에게 메시지를보낸다.



Props

# Props로 데이터전달하기

데이터는 Props 옵션을 사용하여 하위컴포넌트로 잔달할수있다.

 -->

<child message="Hi Vue.js"></child>
<script>
	Vue.component('child',{
		//props 정의
		props:['message'],
		template:'<span>{{ message }}</span>'
	});

</script>

<!--

# camelCase vs. kebab-case
  -->
  <!-- html은 kebab case -->
<child my-message="Hi"></child>
<script>
	Vue.component('child',{
		//JavaScript는 camelCase
		props:['myMessage'],
		template:'<span>{{ myMessage }}</span>'
	});
</script>


<!-- 

# 동적 props

v-bind를 사용하여 부모의데이터애 props를 동적으로 바인딩할수있다.
 -->


<div>
	<input v-model="parentMsg"/>
	<br/>
	<child v-bind:my-message="parentMsg"></child>
</div>

<!-- 

객체의 모든속성을 props로 전달하라며녀 , 인자없이 v-bind를 쓸수있다.





# 리터럴 vs.동적

실제 숫자가아닌 일반문자열 1로 전달되기때문에
실제  javascript숫자를 전달하려면 값이 javascript표현식으로 되도록
v-bind를 사용해야함
 -->
 
 <!-- 이것은 일반 문자열 "1"을 전달합니다. -->
<comp some-prop="1"></comp>

 
 <!-- 이것은 실제 숫자로 전달합니다. -->
<comp v-bind:some-prop="1"></comp>
 
 
 <!-- 
 
 # 단방향 데이터흐름
 
 모든 props는 단방향 바인딩을 형성한다.
 
 
 # prop 검증
 
 컴포넌트가 prop에 대한 요구사항을 지정할수있다.
 
 props를 문자열 배열로 정의하는 대신 유효성검사 요구사항이 있는 개체를 사용할수있다.
  -->

<script>
Vue.component('example', {
	  props: {
	    // 기본 타입 확인 (`null` 은 어떤 타입이든 가능하다는 뜻입니다)
	    propA: Number,
	    // 여러개의 가능한 타입
	    propB: [String, Number],
	    // 문자열이며 꼭 필요합니다
	    propC: {
	      type: String,
	      required: true
	    },
	    // 숫자이며 기본 값을 가집니다
	    propD: {
	      type: Number,
	      default: 100
	    },
	    // 객체/배열의 기본값은 팩토리 함수에서 반환 되어야 합니다.
	    propE: {
	      type: Object,
	      default: function () {
	        return { message: 'hello' }
	      }
	    },
	    // 사용자 정의 유효성 검사 가능
	    propF: {
	      validator: function (value) {
	        return value > 10
	      }
	    }
	  }
	})
</script>

<!--

type은 다음 네이티브생성자중 하나를 생성할수있다.

String
Number
Boolean
Function
Object
Array
Symbol

type은 커스텀 생성자 함수가될수있고, assertion은 instanceof 체크로 만들어진다.

props검증이 실패하면 Vue는 콘솔에서 경고를 출력한다.
props는 컴포넌트 인스턴스가 생성되기전에 검증되기때문에
default , validator 함수내에서
data,computed,methods 같은 인스턴스속성을사용할수없다.
  -->


<!--

Props가 아닌 속성


input 에 data-3d-date-picker속성을 요구하는 부트스트랩프러그인으로
써드파티 bs-date-input 컴포넌트를 사용하고있다면
이속성ㅇ르 컴포넌트의 인스턴스에 추가할수있다.
  -->
<bs-date-input data-3d-date-picker="true"></bs-date-input>

<!-- data-3d-date-picker="true" 속성은 bs-date-input의 루트엘리먼트에 자동으로추가된다. -->


<!-- 

# 존재하는 속성 교체/병합

데이트피커 플러그인의 테마를 추가하려면 다음과같이 특정클래스를 추가해야할수도있습니다.
 -->
<bs-date-input
  data-3d-date-picker="true"
  class="date-picker-theme-dark"
></bs-date-input>

<!--

# v-on 을 이용한 사용자 지정 이벤트

$on(eventName) 을 사용하여 이벤트를감지
$emit(eventName) 을 사용하여 이벤트를 트리거


$on 은 자식에서호출한이벤트는감지하지않는다.
v-on을 템플릿에 반드시지정해야한다.
  -->
<div id="counter-event-example">
  <p>{{ total }}</p>
  <button-counter v-on:increment="incrementTotal"></button-counter>
  <button-counter v-on:increment="incrementTotal"></button-counter>
</div>

<script>
Vue.component('button-counter', {
	  template: '<button v-on:click="incrementCounter">{{ counter }}</button>',
	  data: function () {
	    return {
	      counter: 0
	    }
	  },
	  methods: {
	    incrementCounter: function () {
	      this.counter += 1;
	      this.$emit('increment');
	    }
	  },
	})

	new Vue({
	  el: '#counter-event-example',
	  data: {
	    total: 0
	  },
	  methods: {
	    incrementTotal: function () {
	      this.total += 1
	    }
	  }
	})
</script>

<!-- 

컴포넌트에 네이티브 이벤트바인딩

컴포넌트의 루트 엘리먼트에서 네이티브 이벤트를 수신하려는 경우가 있을수있다.

이러한 경우에 v-on 에 .native 수식자를 사용할수 있다.
 -->

<my-component v-on:click.native="doTheThing"></my-component>

<!-- 

#.sync 수식어

자식컴포넌트가 .sync를 가지는 속성을 변경하면
값의변경이 부모에 반영된다.
단방향 데이터흐름이 아니며
자식속성을 변경하는코드는 부모의상태에 영향을미친다.

 -->
 <input v-model="something">
<!--  위 문장은 아래와 같습니다. -->

<input
  v-bind:value="something"
  v-on:input="something = $event.target.value">
<!-- 컴포넌트와 함께 사용하면 다음과 같이 간단해집니다. -->

<custom-input
  :value="something"
  @input="value => { something = value }">
</custom-input>


<!-- 

# 컴포넌트의 v-model 사용자정의

v-model은 value를 보조변수로 사용하고 input을 이벤트로 사용하지만 체크박스와 라디오버튼과 같은
일부 입력타입은 다른목적으로 value 속성을 사용할 수 있습니다.
 -->
 Vue.component('my-checkbox', {
  model: {
    prop: 'checked',
    event: 'change'
  },
  props: {
    // 다른 목적을 위해 `value` prop를 사용할 수 있습니다.
    checked: Boolean,
    value: String
  },
  // ...
})

<my-checkbox v-model="foo" value="some value"></my-checkbox>
<my-checkbox
  :checked="foo"
  @change="val => { foo = val }"
  value="some value">
</my-checkbox>
<!-- 

# 비 부모 - 자식간 통신

비어있는 Vue인스턴스를 중앙 이벤트버스로 사용할수있다.

var bus = new Vue()
// 컴포넌트 A의 메소드
bus.$emit('id-selected', 1)
// 컴포넌트 B의 created 훅
bus.$on('id-selected', function (id) {
  // ...
})
 -->
 
 <!-- 
 
 슬롯을 사용한 컨텐츠배포
 
 컴포넌트 사용시 다음과같이 구성하는것이좋다.
  -->
 <app>
  <app-header></app-header>
  <app-footer></app-footer>
</app>

<!--


# 범위 컴파일

<child-component>
  {{ message }}
</child-component>

message는 부모데이터에 바인딩되어야한다.

상위 템플릿의 모든 내용은 상위 범위로 컴파일된다.
하위 템플릿의 모든 내용은 하위범위에서 컴파일된다.
  -->
  <!-- 작동하지 않습니다 -->
<child-component v-show="someChildProperty"></child-component>
<!-- Vue.component('child-component', { -->
<!--   // 이제 작동합니다. 올바른 위치에 놓여 있습니다. -->
<!--   template: '<div v-show="someChildProperty">Child</div>', -->
<!--   data: function () { -->
<!--     return { -->
<!--       someChildProperty: true -->
<!--     } -->
<!--   } -->
<!-- }) -->


<!-- 

# 단일 슬롯

하위컴포넌트의 템플릿에 최소한 하나의 <slot> 콘텐츠가 포함되어있지않으면
부모콘텐츠가 삭제된다.

원래 <slot> 태그 안에 있는 내용은 대체콘텐츠로 간주된다.
대체콘텐츠는 하위범위에서 컴파일되며 호스팅 엘리먼트가 비어있고 삽입할 콘텐츠가 없는경우에만 표시된다.
 -->

<div>
  <h2>나는 자식 컴포넌트의 제목입니다</h2>
  <slot>
    제공된 컨텐츠가 없는 경우에만 보실 수 있습니다.
  </slot>
</div>

<div>
  <h1>나는 부모 컴포넌트의 제목입니다</h1>
  <my-component>
    <p>이것은 원본 컨텐츠 입니다.</p>
    <p>이것은 원본 중 추가 컨텐츠 입니다</p>
  </my-component>
</div>

<div>
  <h1>나는 부모 컴포넌트의 제목입니다</h1>
  <div>
    <h2>나는 자식 컴포넌트의 제목 입니다</h2>
    <p>이것은 원본 컨텐츠 입니다.</p>
    <p>이것은 원본 중 추가 컨텐츠 입니다</p>
  </div>
</div>


<!-- 

# 이름을 가지는 슬롯

<slot> 엘리먼트는 특별한 속성인 name을 가지고있다.


 -->
 <div class="container">
  <header>
    <slot name="header"></slot>
  </header>
  <main>
    <slot></slot>
  </main>
  <footer>
    <slot name="footer"></slot>
  </footer>
</div>


<app-layout>
  <h1 slot="header">여기에 페이지 제목이 위치합니다</h1>

  <p>메인 컨텐츠의 단락입니다.</p>
  <p>하나 더 있습니다.</p>

  <p slot="footer">여기에 연락처 정보입니다.</p>
</app-layout>


<div class="container">
  <header>
    <h1>여기에 페이지 제목이 위치합니다</h1>
  </header>
  <main>
    <p>메인 컨텐츠의 단락입니다.</p>
    <p>하나 더 있습니다.</p>
  </main>
  <footer>
    <p>여기에 연락처 정보입니다.</p>
  </footer>
</div>


<!-- 

# 범위를 가지는 슬롯

범위가 지정된 슬롯은 이미렌더링된 엘리먼트 대신 재사용 가능한 템플릿 으로 작동하는 특별한 유형의 슬롯.

prop을 컴포넌트에게 전달하는 것처럼, 하위컴포넌트에서 단순데이터를 슬롯에게 전달하면된다.
 -->
<div class="child">
  <slot text="hello from child"></slot>
</div>

<!-- 
부모에서 특볋한속성 slot-scope 를 가진 <template> 엘리먼트가 있어야한다.
 -->
 <div class="parent">
  <child>
    <template slot-scope="props">
      <span>hello from parent</span>
      <span>{{ props.text }}</span>
    </template>
  </child>
</div>
 
 <div class="parent">
  <div class="child">
    <span>hello from parent</span>
    <span>hello from child</span>
  </div>
</div>

<my-awesome-list :items="items">
  <!-- scoped slot 역시 이름을 가질 수 있습니다 -->
  <li
    slot="item"
    slot-scope="props"
    class="my-fancy-item">
    {{ props.text }}
  </li>
</my-awesome-list>
그리고 리스트 컴포넌트의 템플릿 :

<ul>
  <slot name="item"
    v-for="item in items"
    :text="item.text">
    <!-- 대체 컨텐츠는 여기입니다. -->
  </slot>
</ul>
 
 <!-- 
 
 디스트럭쳐링
 
 slot-scope 값은 실제로 함수 서명의 인수 위치에 나타날 수 있는 유효한 JavaScript 표현식입니다. 이는 지원되는 환경 (싱글 파일 컴포넌트 또는 최신 브라우저)에서 ES2015 디스트럭처를 사용할 수 있다는 것을 의미합니다.
  -->
  <child>
  <span slot-scope="{ text }">{{ text }}</span>
</child>
  
</body>
</html>