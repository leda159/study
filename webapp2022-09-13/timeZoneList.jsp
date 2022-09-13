<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전세계 타임존 리스트</h3>
	<c:forEach var="id" items="<%=java.util.TimeZone.getAvailableIDs() %>">${id}<br>
	</c:forEach>
</body>
</html>