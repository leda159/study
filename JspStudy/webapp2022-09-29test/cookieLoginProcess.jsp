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
		
		if(id.equals("test")&& password.equals("test1234")){
				
			Cookie cookie_id = new Cookie("idCookie",id);
			Cookie cookie_pw = new Cookie("pwCookie",password);
			
			cookie_id.setMaxAge(60*60*60); 
			response.addCookie(cookie_id);
			
			out.println("쿠키 생성이 성공<br>");
			out.println("아이디 쿠키이름:"+cookie_id.getName()+"<br>");
			out.println("아이디 쿠키값:"+id+"<br>");
			out.println("비밀번호 쿠키이름:"+cookie_pw.getName()+"<br>");
			out.println("비밀번호 쿠키값:"+password);
			
			
		}else if(id.equals("test") || password.equals("test1234")){
			out.println("아이디나 비밀번호 오류");
		}
	%>
</body>
</html>