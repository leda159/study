<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="num1" value="${param.num1 }" />
	<c:set var="num2" value="${param.num2 }" />
	<c:set var="total" value="0" />
	
	<c:forEach var="i" begin="${param.num1 }" end="${param.num2 }" step="1">
		<c:if test="${i % 5 ==0 }">
			<c:set var="total" value="${total + i }" />
		</c:if>
	</c:forEach>
	
	
	
	${param.num1 } 부터 ${param.num2 } 까지 5의 배수의 합계:
	<c:out value="${total }" />
</body>
</html>