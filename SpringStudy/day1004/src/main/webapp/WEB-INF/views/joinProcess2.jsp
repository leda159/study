<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Join클래스의 첫글자를 소문자로 입력하고 . 붙힌다  ex join.id -->
	<h2>매핑을 통한 회원가입 내역</h2>
	<p>아이디:${join.id}
	<p>비밀번호:${join.password}
	<p>이름:${join.name}
	<p>이메일:${join.email}
	<p>전화번호:${join.phone}
</body>
</html>