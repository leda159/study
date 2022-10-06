<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>회원가입 결과
	<p>아이디:${sessionScope.id}
	<p>비밀번호:${sessionScope.passwd}
	<p>이름:${sessionScope.name}
	<p>연락처:${sessionScope.phone}
	<p>이메일:${sessionScope.email}
</body>
</html>