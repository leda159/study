<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--fmt: bundle 태그는 사용할 Resource Bundle의 위치 선언 -->
	<fmt:bundle basename="myBundle.myBundle_ko">
		<!-- fmt:message: resource Bundle 파일에서 value값을 리턴받아 출력 -->
		<p><fmt:message key="name" />
			<!-- resource Bundle 파일에서 key에 대한 값을 리턴 받아서 변수에 대입  -->
		   <fmt:message key="hello" var="msg" />
		<p>${msg }   
	</fmt:bundle>
</body>
</html>

