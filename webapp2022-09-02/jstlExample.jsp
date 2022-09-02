<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <!--  
    prefix: 접두사  
    core:   taglib에 있는 중요한 기능을 사용할때
    fmt:    각 나라의 돈,시간,날짜
    sql:    taglib를 이용해서 데이터를 넣을수도 삭제할수도 업데이트 할수도 있는 용도 -->
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri = "http://java.sun.com/jsp/jstl/sql" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 {
		color:blue;
	}
</style>
</head>
<body>

	<!-- c:set -변수에 값을 대입하는 taglib
		 var   - 변수
		 scope="page" - 현재페이지에서만 홍길동이 살아있고 다른 페이지로 넘어가면 없어진다 -->
	<c:set var="name" value="홍길동" scope="page" />
	<h2>
		<%-- c:out - 화면에 출력
			 value = "${변수갑}" --%>
		이름:<c:out value="${name }"/>
	</h2>
	
	<br>
	
	<c:set var="num1" value="10" />
	<c:set var="num2" value="20" />
	<h2>
		합계:${num1 + num2}
	</h2>
	
	
	
	
	<!-- 조건문 -->
	<c:set var="num" value="10" />
	<c:if test="${num % 2 ==0 }" >
		<h2>
			${num }은<c:out value="짝수입니다." />
		</h2>
	</c:if>
	
	<c:set var="num" value="10" />
	<c:if test="${num % 2 ==1 }" >
		<h2>
			${num }은<c:out value="홀수입니다." />
		</h2>
	</c:if>
	
	
	<!-- choose문장(switch) -->
	<c:choose>
		<c:when test="${num % 2 ==0 }">
			<h2>
				${num }은 짝수입니다.
			</h2>
		</c:when>
		<c:when test="${num % 2 ==1 }">
			<h2>
				${num }은 홀수입니다.
			</h2>
		</c:when>
		<c:otherwise>
			숫자를 입력하세요.
		</c:otherwise>
	</c:choose>
	
	
	<!-- 반복문 -->
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:out value="${i }"/>
	</c:forEach>
</body>
</html>






