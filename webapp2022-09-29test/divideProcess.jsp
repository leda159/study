<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>       
<%@ page errorPage="exceptionProcess.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <c:set var="num1" value="${param.num1 }" />
<c:set var="num2" value="${param.num2 }" />
<c:set var="dive" value="${num1/num2 }" />

${num1 }/${num2 }=
<c:out value="${dive}" /> --%>



<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		PrintWriter out2 = response.getWriter();
	
		out2.printf("처리결과 <br> %,d / %,d = %,d",num1,num2,num1/num2);
%>
</body>
</html>