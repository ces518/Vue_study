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

이벤트핸들링

이벤트 청취

v-on 디렉티브를 사용하여 DOM이벤트를 듣고 트리거될떄 JavaScript 실행할수있습니다.

 -->
<div id="example-1">
	<button v-on:click="counter += 1"> Add 1</button>
	<p>클릭회수 = {{ counter }}번</p>
</div>


<script>
	var example1 = new Vue({
		el:'#example-1',
		data:{
			counter : 0
		}
	});
</script>


<!-- 

메서드 이벤트 핸들러

많은 이벤트 핸들러의 로직은더 복잡할것이므로 , JavaScript를 v-on속성값으로 보관하는것은
간단하지않다.

v-on이 호출하고자하는 메서드의 이름을 받는이유이다.

 -->

<div id="example-2">
	<button v-on:click="greet">Greet</button>
</div>

<script>
	var example2 = new Vue({
		el:'#example-2',
		data:{
			name = 'Vue.js'
		},
		methods:{
			greet:function(event){
				//함수 내의 this는 Vue인스턴스를 가리킴.
				alert('Hello' + this.name + '!');
				if(event){
					alert(event.taget.tagName);
				}
			}
		}
	});
</script>

<!-- 

인라인 메서드 핸들러

메서드 이름을 직접 바인딩하는 대신 인라인 javaScript 구문에 메서드를 사용할수도있다.
 -->

<div id="example-3">
	<button v-on:click="say('hi')">Say Hi</button>
	<button v-on:click="say('what')">Say What</button>
</div>


<script>
	var example-3 = new Vue({
		el:'#example-3',
		methods:{
			say:function(msg){
				alert(msg);
			}
		}
	});

</script>

<!-- 인라인 명령문 핸들러에서 원본 DOM 이벤트에 액세스 해야할 수도 있습니다.
	$event 변수를 사용해 메서드에 전달할 수도 있습니다.
 -->

<button v-on:click="warn('Form cannot be submitted yet.',$event)"></button>

<script>
	new Vue({
		methods:{
			warn : function(msg,event){
				if(event) event.preventDefault();
				alert(msg);
			}
		}
	});
</script>


<!-- 

이벤트 수식어

v-on 의 이벤트 수식어

.stop
.prevent
.capture
.self
.once
 -->

<!-- 클릭 이벤트 전파가 중단됩니다 -->
<a v-on:click.stop="doThis"></a>

<!-- 제출 이벤트가 페이지를 다시 로드 하지 않습니다 -->
<form v-on:submit.prevent="onSubmit"></form>

<!-- 수식어는 체이닝 가능합니다 -->
<a v-on:click.stop.prevent="doThat"></a>

<!-- 단순히 수식어만 사용할 수 있습니다 -->
<form v-on:submit.prevent></form>

<!-- 이벤트 리스너를 추가할 때 캡처모드를 사용합니다 -->
<!-- 즉, 내부 엘리먼트를 대상으로 하는 이벤트가 해당 엘리먼트에서 처리되기 전에 여기서 처리합니다. -->
<div v-on:click.capture="doThis">...</div>


<!-- event.target이 엘리먼트 자체인 경우에만 트리거를 처리합니다 -->
<!-- 자식 엘리먼트에서는 안됩니다 -->
<div v-on:click.self="doThat">...</div>

<!-- 수식어를 사용할 때 순서를 지정하세요. 
다시말해 `@click.prevent.self를 사용하면 **모든 클릭**을 막을 수 있으며@click.self.prevent`는 엘리먼트 자체에 대한 클릭만 방지합니다.
 -->

<!-- 클릭 이벤트는 최대 한번만 트리거 됩니다. -->
<a v-on:click.once="doThis"></a>

<!-- 스크롤의 기본 이벤트를 취소할 수 없습니다. -->
<div v-on:scroll.passive="onScroll">...</div>

<!-- 
 브라우저는 핸들러가 event.preventDefault()를 호출할지 알지 못하므로 프로세스가 완료된 후 스크롤 합니다. .
 passive 수식어는 이 이벤트가 기본 동작을 멈추지 않는다는 것을 브라우저에 알릴 수 있습니다.
 -->


<!-- 

키수식어

키 이벤트를 수신할때 v-on에 대한 키 수식어를 추가할수있다.
 -->

<!-- keyCode가 13 일 때만 vm.submit() 을 호출한다. -->
<input v-on:keypu.13="submit"/>

<!-- 

자주 사용하는 키의 알리아스를 제공한다.

.enter
.tab
.delete (delete와 backspace 모두 캡처)
.esc
.space
.up
.down
.left
.right

또한 config.keyCodes 객체를 통해 사용자지정 키 수식어별칭을 지정할수 있다.

// `v-on:keyup.f1`을 사용할 수 있습니다.
Vue.config.keyCodes.f1 = 112
 -->

<!-- 

# 오토매틱 키 수식어

keyboardEvent.key 를 통해 노출된 유효키이름을 수식어로 직접사용가능.
 -->

<input @keyup.page-down="onPageDown">

<!-- 

시스템 수식어 키목록

.ctrl
.alt
.shift
.meta

.meta = windows에서는 window키 
 -->

<!-- Alt + C -->
<input @keyup.alt.67="clear">

<!-- Ctrl + Click -->
<div @click.ctrl="doSomething">Do something</div>


<!-- 

# .exact 수식어

.exact 수식어는 다른시스템 수식어와 조합해
그 핸들러가 시랭되기 위해 정확한 조합이 눌러야하는것을 보여준다.
 -->

<!-- Alt 또는 Shift와 함께 눌린 경우에도 실행됩니다. -->
<button @click.ctrl="onClick">A</button>

<!-- Ctrl 키만 눌려있을 때만 실행됩니다. -->
<button @click.ctrl.exact="onCtrlClick">A</button>

<!-- 아래 코드는 시스템 키가 눌리지 않은 상태인 경우에만 작동합니다. -->
<button @click.exact="onClick">A</button>


<!-- 

# 마우스 버튼 수식어

.left
.right
.middle
 -->



</body>
</html>