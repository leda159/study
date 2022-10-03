<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage_error.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 넘긴 값이 없는데 값을 받으려고할때 오류 (NullPointException) -->
	
	name 파라미터:  <%=request.getParameter("name").toUpperCase() %>
	
</body>
</html>