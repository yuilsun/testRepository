<%@page import="com.kh.model.vo.Student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL core library</h1>
	<h3>1.변수(속성)</h3>
	<pre>
		*변수 선언 (&lt;c:set var="변수명" value="리터럴" scope="스코프영역지정(생략가능)"&gt;)
		-변수를 선언하고 초기값을 대입해두는 기능을 제공
		-해당 변수를 어떤 scope에 담을 것인지 지정가능하다 (생략시 기본값으로 pageScope 영역에 할당)
		-해당 scope영역에 setAttribute 메소드를 이용하여 key + value를 담아놓는것과 같음
		- c:set을 통해 선언된 변수는 EL로 접근하여 사용가능 (단,스크립팅원소는 접근 불가)
		
		*주의사항
		-변수 타입을 지정하지 않음
		-반드시 해당 변수에 담아두고자 하는 값을 초기값(value)을 넣어야한다(선언과 동시에 초기화)
	</pre>
	

	
	<!-- Unknown tag (c:set) : 커스텀 태그를 사용하려면 해당 라이브러리 추가해야함 -->
	<c:set var="num" value="10"></c:set><!-- Scope 설정없이 선언하면 pageScope에 담긴다 -->
	<c:set var="num2" value="20" scope="request"/> <!-- requestScope에 담기게 됨 -->
	
	num 변수값 : ${num} <br>
	num2 변수값 : ${num2} <br>
	
	<!-- session 영역에 result 라는 이름의 변수로 num 과 num2를 더한 값을 선언하고 아래에서 출력해보기 -->
	<c:set var="result" value="${num + num2 }" scope="session"></c:set>
	<br>
	result 변수값 : ${result } <br>
	<!-- 변수명만 제시하면 공유범위가 작은곳부터 큰곳까지 모두 순회하며 해당 키값을 찾기 때문에 속도저하가 일어날 수 있다.
		 때문에 필요한 변수는 스코프.변수명으로 지정하는것을 권장함
		 
	 -->
	<br>
	각 영역값 출력 <br>
	${pageScope.num}<br>
	${requestScope.num2 } <br>
	${sessionScope.result} <br>
	request.result : ${requestScope.result} <br><!-- 영역을 지정하면 해당 영역에서만 찾는다 -->
	
	<c:set var="result" scope="request"> <!-- value 속성 대신에 태그 사이에 값을 넣어주는 방식으로도 가능 -->
		9999
	</c:set>
	
	request.result : ${requestScope.result } <br>
	
	<hr>
	
	<pre>
		변수삭제(&lt;c:remove var="제거하고자하는 변수명" scope="스코프영역지정(생략도 가능)"&gt;
		-해당 변수를 scope에서 찾아 삭제하는 태그
		-scope 지정 생략시 모든 scope에서 해당 변수 찾아서 삭제
		-영역.removeAttribute() 메소드와 같은 역할을 수행한다.
	</pre>
	
	삭제전 result : ${result } <br><br>
	
	1)특정 scope 지정해서 삭제 <br>
	
	 <!-- 9999가 삭제되고 session에 있던 result가 나옴 -->
	<c:remove var="result" scope="request"/>
	
	삭제후 result : ${result } <br>
	
	2)모든 scope에서 삭제 <br>
	<c:remove var="result"/>
	
	삭제후 result : ${result } <br>
	
	<hr>
	
	<pre>
		변수(데이터) 출력
		(&lt;c:out value="출력하고자하는값" default="기본값(생략가능)" escapeXml="true/false(기본값,생략가능) &gt;")
		-데이터를 출력하고자 할때 사용하는 태그
		-기본값 : value에 출력하고자 하는 값이 없을 경우 기본값으로 출력할 내용물을 기술(생략가능)
		-escapeXml : 태그로써 해석하여 출력할지 여부 (생략가능)
		
		result : <c:out value="${result}"/>
		default 설정한 result : <c:out value="${result}" default="없음"/>
		
		<c:set var="test" value="<b>오늘은 월요일</b>"/>
		
		<c:out value="${test}"/>  
		<c:out value="${test}" escapeXml="false"/>
		<c:out value="${test}" escapeXml="true"/>  <!-- 태그로 인식하지 않음 (단순 텍스트 인식) -->
		
	</pre>
	
	
	<hr>
	
	<h3>2.조건문 - if(&lt;c:if test="조건식" &gt;)</h3>
	<pre>
		-JAVA의 단일 if문과 비슷한 역할을 하는 태그
		-조건식은 test라는 속성에 작성(단,EL구문으로 작성해야한다.); 
	</pre>
	
	<%--
	<%
		if(10>3){
			작성구문
		}
	%>
	 --%>
	 
	 <c:if test="${num > num2 }">
 		<b>num이 num2보다 큽니다.</b>
	 </c:if>
	
	
	<c:if test="${num lt num2 }">
 		<b>num이 num2보다 작습니다.</b>
	 </c:if>
	
	<br>
	
	<c:set var="str" value="안녕하세요"/>
	
	<c:if test="${ str == '안녕하세요' }">
		<mark>Hello World!!</mark>	
	</c:if>
	
	<c:if test="${str ne '안녕하세' }">
		<mark>GoodBye World!!</mark>
	</c:if>
	
	<br>
	
	
	<h3>3.조건문 - choose (&lt;c:choose&gt; &lt;c:when&gt; &lt;c:otherwise&gt;)</h3>
	-JAVA의 if-else,if-else if문 또는 switch문과 비슷한 역할을 하는 태그 <br>
	-각 조건들을 c:choose의 하위요소로 c:when을 통해서 작성 <br>
	
	<%--
		자바구문 
		if(num==20){
		
		}else if(num==15){
		
		}else{
		
		}
	 --%>
	 <br>
	 <c:choose>
	 	<%--주의 사항: choose 구문 사용시 태그들 사이에 어떠한 값이나 html 주석도 들어가선 안된다. 오류발생 
	 		 		때문에 주석을 작성하고자 한다면 jsp주석을 이용할것
	 	--%>
	 	<c:when test="${num eq 20 }"> <!-- if -->
	 		<b>안녕하십니까..</b>
	 	</c:when>
	 	<c:when test="${num eq 10 }"> <!-- else if -->
	 		<b>반갑습니다..</b>
	 	</c:when>
	 	<c:otherwise> <!-- else -->
			<b>다 아닌가 봅니다..</b>	 	
	 	</c:otherwise>
	 </c:choose>
	 
	 
	 <hr>
	 
	 <h3>4.반복문 - forEach</h3>
	 <pre>
	 	for loop 문 - (&lt;c:forEach var="변수명" begin="초기값" end="끝값" step="증가시킬값(생략가능)"&gt;)
	 	향상된 for 문 - (&lt;c:forEach var="변수명" items="순차적으로접근할 배열 또는 컬렉션"
	 								varStatus="현재 접근된 요소의 상태값을 보관할 변수명(생략가능)"&gt;)
	 	
	 	- step : 지정하지 않을 시 기본값 1
	 	- varStatus : 현재 접근된 요소의 상태값을 보관할 변수명(생략가능)	
	 	  ㄴ속성들 
	 	  count : 1부터 숫자 세어줌
	 	  index : 0부터 숫자 세어줌
	 	  first : 반복이 처음인지 여부 (true/false) 
	 	  last : 마지막 반복인지 여부 (true/false)
	 	  current : 현재 반복 요소
	 	
	 </pre>
	 
	 <!-- for loop 문 -->
	 <%-- <%for(int i=0; i<10; i++){}%> --%>
	 
	 <c:forEach var="i" begin="1" end="5" step="1">
	 	반복확인 : ${ i } <br>
	 </c:forEach>
	 <br>
	 <%-- <%for(int i=0; i<10; i+=2){}%> --%>
	 
	 <c:forEach var="i" begin="1" end="5" step="2">
	 	반복확인 : ${ i } <br>
	 </c:forEach>
	 
	 <!-- 태그 안에도 처리가능 -->
	 
	 <c:forEach var="i" begin="1" end="5">
	 	<h${i}>태그 안에서도 적용 가능</h${i}>
	 </c:forEach>
	 
	 <br>
	 
	 <!-- 사용할 배열준비 -->
	 <c:set var="color">
	 	red,yellow,green,blue
	 </c:set> <!-- 배열과 같은 역할 -->
	 
	 color 값 : ${color} <br>
	 
	 <!-- 향상된 for문 -->
	
	<ul>
	 <c:forEach items="${color}" var="c">
	 	<li style="color:${c};">${c}</li>
	 </c:forEach>
	</ul>
	 
	 
	<!-- 반복문 활용 -->
	<%
		ArrayList<Student> list = new ArrayList<>();
		list.add(new Student("김학생",20,"남자"));
		list.add(new Student("이학생",21,"여자"));
		list.add(new Student("박학생",25,"여자"));
		list.add(new Student("최학생",29,"남자"));
		
		//servlet에서 처리해왔다고 가정하기
		request.setAttribute("list", list);
	%>
	<table border="1">
		<thead>
			<tr>
				<th>순번</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<%--
			<%if(list.isEmpty()) {%>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			<%}else{ %>
				<%for(int i=0; i<list.size(); i++) {%>
					<tr>
						<td><%=i+1%></td>
						<td><%=list.get(i).getName() %></td>
						<td><%=list.get(i).getAge() %></td>
						<td><%=list.get(i).getGender() %></td>
					</tr>
				<%} %>
			<%} %>
			 --%>
			 <c:choose>
			 	<c:when test="${ empty list }">
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="s" items="${list}" varStatus="status">
						<tr>
							<td>${status.count}</td> <!-- varStatus 속성 : index-0부터,count-1부터 -->
							<td>${s.name }</td>
							<td>${s.age }</td>
							<td>${s.gender }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	 
	<hr>
	
	<h3>5.반복문-forTokens</h3>
	<pre>
		&lt;c:forTokens var="각값을 보관할 변수" items="분리시킬 문자열" delims="구분자"&gt;
		
		-구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하며 반복수행
		-JAVA의 split("구분자") 또는 StringTokenizer 와 비슷한 역할
		-구분자를 여러개 넣어서 구분시킬 수 있음
	</pre>
	
	<c:set var="device" value="컴퓨터,휴대폰,노트북,에어컨/세탁기.냉장고"/>
	
	<ul>
		<c:forTokens var="d" items="${device}" delims=",/.">
			<li>${d}</li>
		</c:forTokens>
	</ul>
	
	<hr>
	
	<h3>6.쿼리스트링 관련 - url,param</h3>
	
	<pre>
		&lt;c:url var="변수명" value="요청할url"&gt;
			&li;c:param name="키값" value="벨류" &gt;
			&li;c:param name="키값" value="벨류" &gt;
			...
		&lt;/c:url&gt;	
		
		-url 경로를 생성하고 쿼리스트링을 정의할 수 있는 태그
		-넘겨야할 쿼리스트링이 길어질 경우 사용하면 편리하다
	</pre>
	
	<%--
	<a href="list.do?currentPage=1&keyword=오늘날씨&category=검색">기존 쿼리스트링 전달방식</a>
	<a href="list.do?currentPage=<%=page.getCurrenPage()%>&keyword=<%=page.getKeyword() %>&category=<%=page.getCategory()%>">기존 쿼리스트링 전달방식</a>
	<a href="list.do?currentPage=${page.currentPage }&keyword=${page.keyword }&category=${page.category}">기존 쿼리스트링 전달방식</a>
	--%>
	 
	<%--value에는 ? 이전경로 넣어주기 --%>
	<c:url var="query" value="list.do"> 
		<c:param name="currentPage">1</c:param>
		<c:param name="keyword">오늘날씨</c:param>
		<c:param name="category" value="검색"/>
	</c:url>
	
	<br>
	
	생성된 url : ${query} <br>
	
	<a href="${query}">c:url을 이용한 방식</a>
	 
	
	
	
	<br><br><br><br><br>
</body>	
</html>