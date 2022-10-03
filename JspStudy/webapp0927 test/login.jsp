<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 페이지</h2>

<form action="login_insert.jsp" method="post">
	<p>아이디: <input style="margin-left:15px;" type="text" name="id">
	<p>비밀번호: <input type="password" name="password">
	<p><input style="margin-left:100px;" type="submit" value="로그인">
	<input type="button" value="회원가입" onclick="location.href='join.jsp';">
</form>
</body>
</html>