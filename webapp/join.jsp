<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- action은 이동하는 jsp 페이지 
	     method는 전송방식 (post , get) -->



<form action="#" method="post">
	<p>아이디:<input type="text" name="id"> <!-- name속성이 있어야 서버로 전동이 된다 -->
	<p>비밀번호:<input type="password" name="passwd">
	<p>이름:<input type="text" name="name">
	<p><input type="submit" value="가입"> <!-- submit은 값을 받아서 서버로 전송한다 -->
	<input type="reset" value="취소">  <!-- 입력받은 값을 화면에서 지우는 기능 -->
	
</form>
</body>
</html>