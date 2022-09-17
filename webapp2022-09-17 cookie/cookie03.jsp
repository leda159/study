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
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++){
			//setMaxAge(); : 쿠키의 유효시간을 지정한다. (단위:초) 
			//setMaxAge(24*60*60) 24시간 *60분*60초  = 하루
			if(cookies[i].getName().equals("userID") || cookies[i].getName().equals("userPW")){
				cookies[i].setMaxAge(0);
			}
			response.addCookie(cookies[i]);
		}
		response.sendRedirect("cookie02.jsp");
	%>
</body>
</html>