<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp:useBean 자바빈즈를 사용하겠다고 선언 -->
	<jsp:useBean id="bean" class="bigdata.Calculator" />
	<%
		int m = bean.process(5);
		out.print("5의 3제곱:"+m);
	%>
</body>
</html>