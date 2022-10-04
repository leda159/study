<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원등록</h2>

<form action="/joinProcess2" method="post">
	<div>
		<label>아이디</label>
		<input type="text" name="id">
		<p><label>비밀번호</label>
		<input type="password" name="password">
		<p><label>이름</label>
		<input type="text" name="name">
		<p><label>이메일</label>
		<input type="text" name="email">
		<p><label>연락처</label>
		<p><input type="text" name="phone">
		<input type="submit" value="회원가입">
		
	</div>
</form>	
</body>
</html>