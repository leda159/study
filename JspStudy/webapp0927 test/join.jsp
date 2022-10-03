<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입 페이지</h2>
<form action="join_insert.jsp">
	<p>아이디 : <input style="margin-left:35px;" type="text" name="id">
	<p>비밀번호 : <input style="margin-left:20px;" type="password" name="password">
	<p>이름 : <input style="margin-left:50px;" type="text" name="name">
	<p>나이 : <input style="margin-left:50px;" type="text" name="age">
	<p>성별 : <input type="radio" name="gender" value="남자" checked>남자
			 <input type="radio" name="gender" value="여자">여자
	<p>이메일주소 : <input type="text" name="email">
	<p><input type="submit" value="회원가입">
	<input type="reset" value="다시작성">	
</form>
</body>
</html>