<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="calculater" class="bigdata.Calculator" scope="request"/>
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		

		
		PrintWriter out2 = response.getWriter();
		
		out2.printf("%,d + %,d = %,d <br>",num1,num2,calculater.add(num1,num2));
		out2.printf("%,d - %,d = %,d <br>",num1,num2,calculater.minus(num1,num2));
		out2.printf("%,d * %,d = %,d <br>",num1,num2,calculater.mul(num1,num2));
		out2.printf("%,d / %,d = %,f <br>",num1,num2,calculater.div(num1,num2));
	%>
	
</body>
</html>