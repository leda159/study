<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@ page language="ja123va" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		out.println("입력한 아이디:"+id+"<br>");
		out.println("입력한 비밀번호:"+passwd);
	%>
</body>
</html>