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
	
	<fmt:setLocale value='<%=request.getParameter("language")%>'/>





	<fmt:bundle basename="examBundle.myBundle"> <!-- 시작은 한글로 한다 -->
		
		<a href="?language=ko">한국어</a>|
		<a href="?language=en">영어</a>
		
		<form action="#" method="post">
			<p><fmt:message key="id"/><input type="text" name="id">
			<p><fmt:message key="password"/><input type="password" name="password">
			<p><input type="submit" value="<fmt:message key="button"/>">
		</form>
	</fmt:bundle>
</body>
</html>