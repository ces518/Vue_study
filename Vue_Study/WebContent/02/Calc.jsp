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
���� �Ӽ��� ������

���� �Ӽ�

���ø� ������ ����ϴ� ǥ������ �������� �ʹ����� ������ ���ø��� ������ ���������� ��ƴ�.

������ ������ ��� �ݵ�� ���� �Ӽ��� ����ؾ��մϴ�.
 -->

<div id="example">
	<p>���� �޽��� : "{{ message}}"</p>
	<p>���������� ���� �޽���  : "{{ reversedMessage}}"</p>
	<p>������ �޽��� : "{{ reversedMsg() }}"</p>
</div>

<script>
	var vm = new Vue({
		el:'#example',
		data:{
			message:'�ȳ��ϼ���'
		},
		computed:{
			reversedMessage:function(){
				// this �� vm�ν��Ͻ��� ����Ų��.
				return this.message.split('').reverse().join('');
			}
		},
		 
	/* 	# ���� ĳ�� vs �޼���

		ǥ���Ŀ��� �޼��带 ȣ���Ͽ� ��������� ���� �� �ִ�
		  */
		methods:{
			reversedMsg: function(){
				return this.message.split('').reverse().join('');
			}
		}
	});
	/* 
	���� �Ӽ���� �޼���Ͱ��� �Լ��� �����Ҽ� �ִ�.
	����� ���� ���������� �������� ���� �Ӽ��� ���Ӽ��� ���� ĳ�õȴٴ� ���Դϴ�.
	
	���� �Ӽ��� ���Ӽ��� �Ϻΰ� ����� ��쿡�� �ٽð��ȴ�.
	message�� ��������ʴ� �� ���� �Ӽ���reversedMessage�� ���� ������
	�ٽ� �������ʿ���� ������ ���� ����� ��� ��ȯ�Ѵ�.
	
	Date.now() �� ������ �������� �������ʱ⶧���� ������Ʈ�����ʴ´ٴ°��� �ǹ�
	�޼���ȣ���� �� ���������� �׻� �޼��带 ȣ���Ѵ�.
	*/
</script>

 <!-- 
 
 # ���ȼӼ� vs ���õ� �Ӽ�
 
 Vue�� Vue�ν��Ͻ��� �Ӽ����� ����� ����.
 �ٸ� ������ ������� ������ �ʿ䰡 �ִ°�� 
 watch �ݹ麸�� ���� �Ӽ��� ����ϴ°��� ����.
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
 		//�� �ڵ�� �ݺ��� �ʼ����̱� ������ ���ȼӼ� �� ���.
 		,computed:{
 			fullName:function(){
 				return this.firstName + ' ' + this.lastName;
 			}
 		}
 	});
 </script> 
 
 <!--  
 # ���� setter
 
 ���� �Ӽ��� �⺻������ getter�� ������������ �ʿ��Ѱ�� setter�� �����Ҽ��� �ֽ��ϴ�.
 -->
 <script>
 	new Vue({
 		computed:{
 			fullName:{
 				get : function(){
 					//���� 
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
 ������
 
 ��κ� ���ȼӼ��� �� ���������� �����ڰ� �ʿ��Ѱ�쵵 ����.
 Vue ���� watch �ɼ��� ���� ������ ���濡 �����ϴ� ������� 
 ������ ���濡 ���� �������� �񵿱�� �Ǵ� �ð��� ���� �ҿ�Ǵ� ������ �����Ϸ��� ��쿡 ���� �����ϴ�.
  -->
  
 <div id="watch-example">
 	<p>
 		yes/no ������ ������� :
 		<input v-model="question"/>
 	</p>
 	<p>{{ answer }}</p>
 </div> 
</body>
</html>