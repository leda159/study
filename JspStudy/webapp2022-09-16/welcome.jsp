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
		String userID = (String)session.getAttribute("userID");
		
		if(userID == null || userID.trim().equals("")){
			response.sendRedirect("session.jsp");
		}else{
			//out.println(userID + "님 반갑습니다.<br>");
	%>
		
	<h3><%=userID %>님 반갑습니다.</h3>
	
	<a href="session_out.jsp">로그아웃</a>
	
	<%
		}
	%>
</body>
</html>