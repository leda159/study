<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="form03_process.jsp" method="POST">
		<p>사과<input type="checkbox" name="fruit" value="apple" >
		<p>오렌지<input type="checkbox" name="fruit" value="orange" >
		<p>바나나<input type="checkbox" name="fruit" value="banana" >
		<p><input type="submit" value="전송">
	</form>
</body>
</html>