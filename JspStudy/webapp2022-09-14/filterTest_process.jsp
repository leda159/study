<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		out.println("아이디:"+id+"<br>");
		out.println("비밀번호:"+passwd+"<br>");
		out.println("이름:"+name+"<br>");
	%>
</body>
</html>