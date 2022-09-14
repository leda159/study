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
		String id =request.getParameter("id");
		String passwd =request.getParameter("passwd");
		
		if(id.equals("admin") && passwd.equals("admin1234")){
			session.setAttribute("userID", "id"); //세션 속성은 같은 웹브라우저에서는 값이 유효
			out.println("로그인 성공");
		}else
			out.println("로그인 실패");
	%>
	
	
	
</body>
</html>