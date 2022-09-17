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

	<%
	PrintWriter out2 = response.getWriter();
	out2.println("<h4>구구단 출력하기</h4>");
	%>
	
	<jsp:useBean id="gugudan" class="bigdata.GuGuDan" scope="request" />
	<%
	for(int i=1; i<=9; i++){
		out.println(5+"*"+i+"="+ gugudan.process(i)+"<br>");
	}
	
	
	for(int i=1; i<=9; i++){
		out2.printf("%d*%d=%d<br>",5,i,gugudan.process(i));
	}
	%>
	
	
</body>
</html>
