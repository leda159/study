<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		/* request : 내장객체로 선어할 필요 없음 */
		String userid = request.getParameter("id");
		String password = request.getParameter("passwd");
		
		out.println("<p>아이디:"+userid+"<br>");
		out.println("<p>비밀번호:"+password+"<br>");
	%>
	<p>아이디: <%=userid %>
	<p>비밀번호:<%=password %>
</body>
</html>