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
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("passwd");
		
			//String 객체의 값을 비교시 반드시 equals 메서드를 사용한다 
		
		if(id.equals("admin") && password.equals("5678")){
			//id라는 session속성을 지정한다 
			session.setAttribute("id",id);
			//강제로 다른 jsp로 이동
			response.sendRedirect("body.jsp");
		}else{
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>