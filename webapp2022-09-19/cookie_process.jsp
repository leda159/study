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
		
		if(id.equals("admin") && passwd.equals("admin1234")){
			Cookie cookie_id = new Cookie("userID",id); //쿠키 클래스를 선언해서 참조변수 cookie_id에 담는다
														// 참조변수 cookie_id는 Cookie클래스를 참조한다
			cookie_id.setMaxAge(60*60); //1시간 유효시간 설정
			response.addCookie(cookie_id);  //클라이언트에게 전송
			response.sendRedirect("welcome.jsp"); //welcome.jsp로 이동
		}else{
			out.println("<script>");
			out.println("alert('아이디나 비밀번호를 확인하세요!')");
			out.println("location.href='cookie.jsp'");
			out.println("</script>");
		}	
		%>
</body>
</html>