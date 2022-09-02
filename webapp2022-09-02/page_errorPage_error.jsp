<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 현재 페이지가 예외처리 페이지인지 여부 설정 -->
<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>errorPage 디렉티브 태그<br>
	에러가 발생했습니다.</h4>
	
	<%
		/* printStackTrace:예외발생내역을 상세하게 출력 */
		exception.printStackTrace(new PrintWriter(out));
	%>
</body>
</html>