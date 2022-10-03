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
	<c:forEach var="i" begin="0" end="10">  <!-- for문 -->
		<c:if test="${i%2==0 }">  			<!-- if문 -->
			<c:out value="${i}" />&nbsp;         <!-- 화면에 출력 -->
		</c:if>
	</c:forEach>
</body>
</html>