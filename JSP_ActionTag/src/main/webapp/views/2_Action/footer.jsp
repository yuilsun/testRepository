<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//현재 날짜 객체 생성해서 yyyy라는 문자열 형태로 반환하는 작업 하기 
		String year = new SimpleDateFormat("yyyy").format(new Date());
	%>
	
	Copyright © 1998-<%=year %> KH Information Educational Institute All Right Reserved
	
	<br>
	
	test : ${param.test} <br>
	
	
</body>
</html>