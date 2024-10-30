<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1.formatNumber</h1>
	<p>
		숫자데이터의 포맷(형식) 지정 <br>
		-표현하고자 하는 숫자 데이터의 형식을 통화기호,%등 원하는 쓰임에 맞게 지정하는 태그 <br><br>
		
		&lt;fmt:formatNumber value="출력할값" groupingUsed="true/false"
							type="percent/currency" currencySymbol="$"/&gt; <br>
		
		-groupingUsed,type,currencySymbol은 생략가능
	</p>
	
	<c:set var="num1" value="123456789"/>
	<c:set var="num2" value="0.75"/>
	<c:set var="num3" value="50000"/>
	
	<br>
	그냥 출력 : ${num1} <br>
	세자리마다 구분하여 출력 : <fmt:formatNumber  value="${num1 }"/> <br>
	숫자 그대로 출력 : <fmt:formatNumber value="${num1}" groupingUsed="false"/> <br>
	
	<!-- 
		groupingUsed 기본값 : true (설정시 숫자를 , 로 3자리마다 구분지어줌)
	 -->
	<!-- type="percent" : 소수점을 백분율로 변경하여 보여준다. -->
	percent : <fmt:formatNumber value="${num2}" type="percent"/> <br>
	
	<!-- type="currency" : 통화(돈) 단위로 보여진다. 현재 로컬 정보에 맞는 단위 사용-->
	currency : <fmt:formatNumber value="${num3}" type="currency"/> <br>
	
	<!-- currencySymbol="$" : 통화 기호 변경 속성 -->
	currency $로 변경해보기 : <fmt:formatNumber value="${num3}" type="currency" currencySymbol="$"/> <br>
	
	<h3>2.formatDate</h3>
	
	<p>
		날짜 및 시간 데이터 포맷(형식) 지정 <br>
		단 java.util.Date 객체를 사용해야함
	</p>
	
	<c:set var="current" value="<%=new java.util.Date() %>"/>
	
	<br>
	그냥 출력 : ${current } <br>
	
	<ul>
		<li>
			<!--  type="date" 날짜를 출력 년월일, 생략시 기본값 -->
			현재 날짜 : <fmt:formatDate value="${current }"  type="date"/>
		</li>
		<li>
			현재 시간 : <fmt:formatDate value="${current }" type="time"/>
		</li>
		<li>
			현재 날짜 및 시간 : <fmt:formatDate value="${current }" type="both"/>
		</li>
		<li>
			<!-- 출력 형식 길이 속성 : dateStyle(날짜) timeStyle(시간) -->
			<!-- medium(기본길이형식) -->
			medium : <fmt:formatDate value="${current }" type="both" dateStyle="medium" timeStyle="medium"/>
		</li>
		<li>
			long : <fmt:formatDate value="${current }" type="both" dateStyle="long" timeStyle="long"/>
		</li>
		<li>
			<!-- long보다 더 길게 표기 (요일) -->
			full : <fmt:formatDate value="${current }" type="both" dateStyle="full" timeStyle="full"/>
		</li>
		<li>
			short : <fmt:formatDate value="${current }" type="both" dateStyle="short" timeStyle="short"/>
		</li>
		<li>
			customizing : <fmt:formatDate value="${current }" type="both" pattern="yyyy-MM-dd(E) a HH:mm:ss"/>
		</li>
	
	</ul>
	<!-- 
		yyyy : 년도
		MM : 월
		dd : 일
		E : 요일
		a : 오전/오후
		HH: 24시 기준 시
		hh : 12시 기준 시
		mm : 분
		ss: 초
	
	 -->
	
	
	<br><br><br>
	
	
	
	
</body>
</html>