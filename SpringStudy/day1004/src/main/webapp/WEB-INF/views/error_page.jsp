<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>
		<c:out value="${exception.getMessage() }" />
	</h4>
	
	<ul>	<!-- getStackTrace : 상세하게 에러내용을 나타냄 -->
		<c:forEach var="stack" items="${exception.getStackTrace() }">
			<li><c:out value="${stack}"></c:out></li>
		</c:forEach>
	</ul>
</body>
</html>