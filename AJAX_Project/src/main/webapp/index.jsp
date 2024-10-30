
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h1>AJAX Project</h1>


	<h3>AJAX 개요</h3>

	<p>
		Asynchronous JavaScript And XML의 약자로 <br> 서버로부터 데이터를 가져와 전체 페이지를
		새로고침하지 않고 일부만 로드할 수 있게 하는 기법 <br> 우리가 기존에 사용하던 a태그 요청 및 form 요청등은
		동기식 요청이다. <br> 동기식 요청은 응답페이지가 돌아와야 다른 작업을 수행 가능 <br> 비동기식
		요청을 보내기 위해서는 AJAX기술을 이용한다 <br>
		<br> *동기식 /비동기식 <br> -동기식 : 요청 처리 후 그에 해당하는 응답페이지가 돌아와야만 다음
		작업을 수행할 수 있음. <br> 만약 서버에서 호출된 결과까지의 시간이 지연된다면 계속 대기해야한다. <br>
		전체 페이지가 리로드 된다(새로고침) <br>
		<br> -비동기식 : 현재 페이지를 그대로 유지하며 중간에 추가적인 요청작업을 할 수 있다. <br>
		요청을 해도 다른 페이지로 넘어가는것이 아니라 데이터 통신이 되는 것 <br> 요청을 보내놓고 그에 해당하는 응답이
		돌아오기 전에도 다른 작업 수행 가능 <br> ex)아이디 중복체크,검색어 자동완성 기능 등등 <br>
		<br> *비동기식의 단점 <br> -현재 페이지에 지속적으로 리소스가 쌓인다(페이지 로드가 느려질 수
		있음) <br> -페이지 내 복잡도가 증가한다 - 에러발생시 디버깅 난이도 상승 <br> -요청 후 돌아온
		응답에 대해서 새로운 요소를 만들어 데이터를 출력해줘야함 <br> -DOM 요소를 만들어 뿌려주기 때문에 해당 요소
		생성 구문을 잘 숙지해야한다 <br>
		<br>
	</p>

	<pre>
		*jQuery 방식으로의 AJAX 통신 
		
		$.ajax({
			속성명 : 속성값,
			속성명 : 속성값,
			....
		});
		
		주요 속성 
		-url : 요청할 url (필수)
		-type|method : get/post 요청방식 (생략시 기본값 get)
		-data : 요청할 전달값
		-success : ajax 통신 성공시 실행할 함수 
		-error : ajax 통신 실패시 실행할 함수
		-complete : ajax 통신 성공여부와 상관없이 실행할 함수
		
		-부수적인 속성
		-async : 서버와의 비동기 처리 방식 설정여부 - 동기통신도 가능하도록 하는 설정
		-contentType : request의 데이터 인코딩 타입 정의
		-dataType : 서버에서 response로 오는 데이터 타입 설정, 생략시 자동추론
		-.....
	</pre>

	<h1>jQuery 방식을 이용한 ajax 테스트</h1>
	<h3>1. 버튼 클릭시 get 방식으로 서버에 데이터 전송 및 응답</h3>

	입력 :
	<input type="text" id="input1">
	<button id="btn1">전송</button>

	<br> 응답 :
	<div id="output1">현재 응답 없음</div>

	<script>
		$(function() {

			$("#btn1").click(function() {
				//기존 방식 서버요청 (get)
				//ajax1.do 라는 매핑주소로 요청
				//location.href="/ajax/ajax1.do?input="+$("#input1").val();
				//console.log($("#input1").val());
				//비동기 통신 처리로 작성해보기
				//각 속성은 , 로 구분해줌
				$.ajax({
					url : '/ajax/ajax1.do', //요청주소
					data : {
						//전달값이 있다면 키 : 값 형태로 작성 
						input : $("#input1").val()
					},
					success : function(result) { //통신 성공 시 실행할 작업을 정의하는 함수영역
						console.log("통신 성공");
						//성공시 응답데이터는 success : function (매개변수) - 매개변수에 담기게 된다.
						console.log(result);
						//응답 데이터 화면에 보여주기 
						$("#output1").html(result);
					},
					error : function() { //통신 실패시 실행할 작업을 정의하는 함수 영역
						console.log("통신 실패")
					},
					complete : function() { //통신 실패 성공 여부 상관 없이 실행할 작업을 정의하는 함수 영역
						console.log("성공 실패 상관 없이 수행됨");
					}
				});
			});
		});
	</script>


	<br>

	<h3>2.버튼 클릭시 post방식으로 서버에 데이터 전송 및 응답</h3>

	이름 :
	<input type="text" id="input2">
	<br> 나이 :
	<input type="number" id="input3">
	<br>
	<button onclick="test2();">전송</button>
	<button onclick="test22();">전송2</button>

	<br> 응답 :
	<span id="result2">현재 응답 없음</span>

	<script>
		//배열 방식(JSONArray)으로 전달받기 
		function test2() {

			//이름,나이 데이터를 추출하여 비동기통신 전달해보기 
			$.ajax({

				url : "ajax2.do",
				data : {
					name : $("#input2").val(),
					age : $("#input3").val()
				},
				type : "post",
				success : function(result) {

					var str = "이름은 " + result[0] + "이고 나이는 " + result[1]
							+ "살입니다.";

					$("#result2").text(str);

				},
				error : function() {
					console.log("통신 오류");
				}

			});

		}
	
		//객체 방식(JSONObject)으로 전달받기
		function test22() {

			//이름,나이 데이터를 추출하여 비동기통신 전달해보기 
			$.ajax({

				url : "ajax2.do",
				data : {
					name : $("#input2").val(),
					age : $("#input3").val()
				},
				type : "get",
				success : function(result) {
					
					console.log(result);

				},
				error : function() {
					console.log("통신 오류");
				}
			});
		}
	</script>


	<h3>3.서버로 데이터 전송 후 조회된 객체를 응답 데이터로 받아보기</h3>
	
	회원번호 입력 : <input type="number" id="userNo">
	<button id="btn3">조회</button>
	
	<div id="result3"></div>
	
	
	<script>
		$(function(){
			
			$("#btn3").click(function(){
				
				var userNo = $("#userNo").val();
				
				
				$.ajax({
					url : "ajax3.do",
					data : {
						userNo : userNo
					},
					success : function(user){
						//ul li 로 user에 담긴 각 속성값 넣어서 result3 에 출력하기
						/*
						var str = "<ul>";
							str +="<li>"+user.userNo+"</li>";
							str +="<li>"+user.userName+"</li>";
							str +="<li>"+user.age+"</li>";
							str +="<li>"+user.gender+"</li></ul>";
							
						$("#result3").html(str);
						*/
						//위 구문을 반복문을 이용하여 처리해보기 
						var ul = $("<ul>");
						
						for(var key in user){
							ul.append($("<li>").text(user[key]));
						}
						
						$("#result3").html(ul);
					},
					error : function(){
						console.log("통신 실패");
					}
				});
			});
		});
	</script>
	

	<h3>4.목록 조회</h3>
	
	<button onclick="test4();">JSON으로 회원 전체 조회</button>
	<button onclick="test5();">GSON으로 회원 전체 조회</button>
	
	<div id="result4">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	
	<script>
		function test4(){
			//ajax4.do 로 요청하여 회원정보 목록을 조회해오기
			//AjaxController4
			//회원 목록을 DB에서 조회해왔다는 가정으로 임의의 Member객체 4개를 list에 담아왔다고 했을때 
			//해당 목록데이터를 응답데이터로 보내어 tbody에 각 행에 추가하기
			
			$.ajax({
				url : "ajax4.do",
				success : function(list){
					
					var str = "";
					
					for(var i=0;i<list.length; i++){
						str += "<tr>"
							  +"<td>"+list[i].userNo+"</td>"
							  +"<td>"+list[i].userName+"</td>"
							  +"<td>"+list[i].age+"</td>"
							  +"<td>"+list[i].gender+"</td>"
							  +"</tr>";
					}
					
					$("#result4 tbody").html(str);
					
					
				},
				error : function(){
					console.log("통신오류");
				}
			});
			
		}
		
		
		//GSON이용해서 데이터 처리해보기 
		function test5(){
			
			$.ajax({
				url : "ajax5.do",
				success : function(list){
					
					var str = "";
					
					for(var i=0;i<list.length; i++){
						str += "<tr>"
							  +"<td>"+list[i].userNo+"</td>"
							  +"<td>"+list[i].userName+"</td>"
							  +"<td>"+list[i].age+"</td>"
							  +"<td>"+list[i].gender+"</td>"
							  +"</tr>";
					}
					
					$("#result4 tbody").html(str);
					
					
				},
				error : function(){
					console.log("통신오류");
				}
			});
			
		}
		
		
		
		
		
	</script>





	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>

</html>