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
		String password = request.getParameter("password");
		
		
		
		if(id.equals("exam") && password.equals("exam1234")){  
			session.setAttribute("ID", id);
			session.setAttribute("PASS", password);
		%>
		<input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp'">
		
		<% 		
			
		}else if(id.equals("exam") || password.equals("exam1234")){
			out.println("아이디나 비밀번호 오류");
		}
	%>
	
		
	
	
</body>
</html>