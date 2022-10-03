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
	Cookie[] cookies = request.getCookies(); //쿠키를 받아서 쿠키 배열 변수에 넣고

	//쿠키 삭제
	for(int i=0; i<cookies.length; i++){ //반복문 돌려서
		if(cookies[i].getName().equals("userID")){   // 쿠키가 userID 일때
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
	}
			
			
	//로그인 화면으로 이동
	response.sendRedirect("cookie.jsp");
%>
</body>
</html>