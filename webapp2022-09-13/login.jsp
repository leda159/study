<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="j_security_check" method="post">
		아이디:<input type="text" name="j_username">
		비밀번호:<input type="password" name="j_password">
		<input type="submit" value="로그인">
	</form>
</body>
</html>