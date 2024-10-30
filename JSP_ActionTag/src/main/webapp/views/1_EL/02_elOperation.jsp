<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL 연산</h2>
	
	<h3>1.산술 연산</h3>
	<p>
		*기존 방식 (표현식) <br>
		10 + 3 = <%=(int)request.getAttribute("big")+ (int)request.getAttribute("small") %>
	</p>
	
	
	<p>
		*EL 연산
		10 + 3 : ${big + small } <br>
		10 - 3 : ${big - small } <br>
		10 * 3 : ${big * small } <br>
		10 / 3 : ${big / small } 또는 ${big div small }<br>
		10 % 3 : ${big % small } 또는 ${big mod small }<br>
	</p>
	
	
	
	<h3>2. 숫자간 대소 비교 연산</h3>
	
	<p>
		*기존 방식 <br>
		10 > 3  :  <%=(int)request.getAttribute("big") > (int)request.getAttribute("small") %>
		
		<br><br>
		
		*EL 방식 <br>
		10 > 3 : ${big > small} 또는 ${big gt small } <br>
		10 < 3 : ${big < small } 또는 ${big lt small } <br>
		10 >= 3 : ${big >= small } 또는 ${big ge small } <br>
		10 <= 3 : ${big <= small } 또는 ${big le small } <br>
	
	</p>
	
	<h3>3. 동등 비교 연산</h3>
	
	<p>
		* 기존방식 <br>
		10과 3이 일치합니까? : <%=(int)request.getAttribute("big") == (int)request.getAttribute("small") %> <br>
		sOne과 sTwo가 일치합니까? : <%=request.getAttribute("sOne") == request.getAttribute("sTwo") %> <br>
	
		<br><br>
		
		*EL연산 <br>
		10과 3이 일치합니까? ${big == small } 또는 ${big eq small } <br>
		big에 담긴 값과 10이 일치합니까? ${big == 10 } 또는 ${big eq 10 } <br>
		
		<%--EL 에서 문자열 == 또는 eq 구문은 자바에서의 equals() 메소드와 동일한 동작을 수행한다.(값비교) --%>
		sOne과 sTwo가 일치합니까? : ${sOne == sTwo } 또는 ${sOne eq sTwo }<br>
		
		<%-- ne : not eq --%>
		sOne과 sTwo가 일치하지 않습니까? ${sOne != sTwo } 또는 ${sOne ne sTwo } <br>
		<!-- El 구문안에서 문자열의 표현은 ""와 ''둘다 가능하다 -->
		sOne과 "안녕"이 일치합니까? ${sOne == "안녕" } 또는 ${sOne eq '안녕' } <br>
	</p>
	
	<hr>
	
	<h3>4. 객체가 null인지 리스트가 비어있는지 확인 연산</h3>
	
	<p>
		*EL 연산 <br>
		student1이 null입니까? : ${student1 == null} 또는 ${empty student1 } <br>
		student2이 null입니까? : ${student2 == null} 또는 ${empty student2 } <br>
		student1이 null이 아닙니까? : ${student1 != null} 또는 ${not empty student1 } <br>
		
		list1이 비어있습니까? : ${empty list1 }<br>
		list2가 비어있습니까? : ${empty list2 }<br>
	</p>
	
	<h3>5. 논리연산자</h3>
	<p>
		AND 연산 : ${true && true } 또는 ${true and true } <br>
		OR 연산 : ${true || false } 또는 ${true or false } <br>
 	</p>
	
	
	<p>
		big이 small보다 크고 list1은 비어있습니까 ? : ${big gt small and empty list1 }<br>
		big과 small의 곱은 4의 배수입니까? : ${big * small mod 4 eq 0 } <br>
		list2가 비어있지 않거나 또는 sOne에 담긴 값이 "안녕하세요"와 일치합니까? 
		${not empty list2 or sOne eq '안녕하세요' } <br>
	</p>
	
	
	
	
	

</body>
</html>