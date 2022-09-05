<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- request.getParameter(속성)은 무조건 문자열로 인식한다 -->
	
	
	<p> 아이디: 	<%=request.getParameter("id") %>
	
	
				<%String name = request.getParameter("name");%>	
	<p> 이름:		<%=java.net.URLDecoder.decode("name") %> 		
</body>
</html>