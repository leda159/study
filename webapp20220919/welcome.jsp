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
	//설정된 모든 쿠키를 배열에 저장
	Cookie[] cookies = request.getCookies();
	



	if(cookies == null){  //쿠키가 없다면
		response.sendRedirect("cookie_out.jsp"); //jsp로 이동해라  
	}
	
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("userID")){ //만든 쿠키 아이디와 같다면
	%>
		<h3><%=cookies[i].getValue()%></h3>님 반갑습니다.
	<% 		
		}
	}
%>
		<a href="cookie_out.jsp">로그아웃</a>
		
		
		
</body>
</html>