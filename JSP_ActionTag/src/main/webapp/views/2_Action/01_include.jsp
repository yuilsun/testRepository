<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>include</h3>
	
	<p>또 다른 페이지를 포함하고자 할때 사용되는 방식 </p>
	
	<h4>1. 기존의 include 지시어를 이용한 방식 (정적 include방식 == 컴파일시 포함되는 형태)</h4>
	
	<%--
	<%@ include file="footer.jsp" %>
	
	<br><br>
	<p>
		특징 : include하고 있는 페이지 상에 선언되어있는 자바 변수를 현재 페이지에서도 사용 가능 <br>
		include한 페이지에 있는 year : <%=year %> <br><br>
		
		단, 현재 페이지에 같은 이름의 변수를 사용할 수 없다(이미 사용중)
		<% Date year = new Date(); %> <!-- 변수 중복오류 -->
	</p>
	 --%>
	 
	<hr>
	<h4>2.JSP 표준 액션 태그를 이용한 방식(동적 include 방식 == 런타임시 포함)</h4>
	
	<!-- 
		반드시 시작태그와 종료태그를 같이 사용해야한다 (XML형식)
		-만약 시작태그와 종료태그 사이에 넣을 값이 없다면 시작태그 끝에 / 를 작성하여 닫힘 처리 가능
		ex) <jsp:include page="footer.jsp"/>
	 -->
	  
	<%--<jsp:include page="footer.jsp"></jsp:include> --%>
	<jsp:include page="footer.jsp"/>
	
	<p>
		특징 1 : include 하고 있는 페이지에 선언된 변수를 공유하지 않음 <br>
		<%--<%=year %> --%>		 <!-- 변수 사용 불가 -->
		<% int year = 2025; %> <!-- 동일한 이름 변수 사용 가능 -->
		<br>
		새로 선언한 year : <%=year %> <br><br>
		
		특징 2 : 포함시 include하는 페이지로 값을 전달 가능 <br>
		
		<jsp:include page="footer.jsp">
			<jsp:param value="pram Test!!!" name="test"/>
		</jsp:include>
		
	
	</p>
	 
	 
	 
	 
	
	
</body>
</html>