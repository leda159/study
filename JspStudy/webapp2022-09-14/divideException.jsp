<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	분모는 0으로 나눌 수 없습니다.<br>
	
	예외 발생 유형:<%=exception.getClass().getName() %> <br>
	예외 메시지 :<%=exception.getMessage() %>
</body>
</html>