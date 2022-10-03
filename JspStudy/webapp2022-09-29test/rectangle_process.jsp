<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="Rectangle" class="bigdata.Rectangle" scope="request" />
	
	
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		

		
		PrintWriter out2 = response.getWriter();
		out2.printf("사각형 면적<br><br>");
		out2.printf("가로길이%,d이고 세로길이%,d인 사각형 면적은%,d입니다.",num1,num2,num1*num2);
		
		
	%>
</body>
</html>