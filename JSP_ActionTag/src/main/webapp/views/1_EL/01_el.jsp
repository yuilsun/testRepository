<%@page import="com.kh.model.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1.기존방식대로 스크립틀릿과 표현식을 이용하여 각 영역에 담겨있는 값을 출력해보자.</h3>
	

	<% 
		//requestScope에 담긴 값 뽑기
		String classRoom = (String)request.getAttribute("classRoom");
		Student student = (Student)request.getAttribute("student");
		
		//sessionScope에 담긴 값 뽑기
		String academy = (String)session.getAttribute("academy");
		Student student2 = (Student)session.getAttribute("student2");
	%>
	
	
	<p>
		학원명 : <%=academy %> <br>
		강의장 : <%=classRoom %> <br>
		학생 1 : <%=student %> <br>
		<ul>
			<li>이름 : <%=student.getName() %></li>
			<li>나이 : <%=student.getAge() %></li>
			<li>성별 : <%=student.getGender() %></li>
		</ul>
		
		
		학생 2 : <%=student2 %> <br>
		<ul>
			<li>이름 : <%=student2.getName() %></li>
			<li>나이 : <%=student2.getAge() %></li>
			<li>성별 : <%=student2.getGender() %></li>
		</ul>
		
	</p>
	
	
	<hr>
	
	<h3>2. EL을 이용하여 보다 쉽게 해당 Scope에 저장된 값들 출력하기</h3>
	
	<p>
		EL은 getXXX을 통해 값을 추출할 필요 없이 해당 키값만 제시하면 접근가능 <br>
		내부적으로 해당 Scope영역에 해당 키값에 담긴 벨류를 얻어올 수 있다. <br>
		기본적으로 EL은 JSP 내장 객체를 구분하지 않고 자동적으로 모든 내장 객체에 <br>
		키값을 검색하여 존재하는 경우 값을 가져온다.
	</p>
	
	
	<p>
		학원명 : ${academy} <br>
		강의장 : ${classRoom } <br>
		학생 1 : ${student } <br>
		
		<%-- 
			student에 접근했을떄 반환받는 값은 Student 객체이다.
			해당 객체 필드에 담긴 값을 출력하고자 한다면
			키.필드명을 이용하면 된다.
			내부적으로 getter메소드가 수행되며 값을 조회해오기 때문에
			해당 객체(VO)에는 getter메소드가 정의되어 있어야한다.
		 --%>
		
		<ul>
			<li>이름 : ${student.name } </li>
			<li>나이 : ${student.age }</li>
			<li>성별 : ${student.gender }</li>
		</ul>
		
		
		학생 2 : ${student2 } <br>
		<ul>
			<li>이름 : ${student2.name }</li>
			<li>나이 : ${student2.age }</li>
			<li>성별 : ${student2.gender }</li>
		</ul>
	</p>
	
	
	<hr>
	
	<h3>3. EL사용시 내장객체들에 저장된 키값이 동일할 경우</h3>
	scope 값 : ${scope} <br> <!-- request Scope -->
	
	<!-- 
		EL표기법으로 키값을 찾을 땐 작은 범위의 Scope부터 찾아서
		먼저 찾게된 값을 반환한다.
		page -> request -> session -> application 순으로 찾게된다.
		
		만약 모든 영역에서 해당 키값을 찾지 못한다면? 아무것도 출력되지 않음(오류발생하지 않음)
	
	 -->
	
	<h3>4.Scope를 지정하여 각 영역에 있는 키값에 접근하기</h3>
	<%
		//페이지스코프에 담아주기
		pageContext.setAttribute("scope","page Scope");
	%>
	<%-- [영역Scope.키] 로 접근--%>
	pageContext에 담긴 값 : ${scope } 또는 ${pageScope.scope } <br>
	requestScope에 담긴 값 : ${requestScope.scope } <br>
	sessionScope에 담긴 값 :  ${sessionScope.scope } <br>
	applicationScope에 담긴 값 : ${applicationScope.scope } <br>
	
	
	없는 키값 접근해보기 : ${test} <br>
	<%--없는 키값 접근시 출력되지 않고 오류도 발생하지 않음 --%>
	
	<br><br>
	
	
	

</body>
</html>