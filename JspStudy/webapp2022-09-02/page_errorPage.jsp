<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 예외가 발생했을때 page_errorPage_error.jsp로 이동한다 -->
<%@ page errorPage="page_errorPage_error.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str = null;
		out.println(str.toString());
	%>
</body>
</html>