<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/test/studentProcess" method="post">
	<div>
		<label>학생번호</label>
		<input type="text" name="sno">
		<p><label>이름</label>
		<input type="text" name="name">
		<p><label>이메일</label>
		<input type="text" name="addr">
		<p><label>연락처</label>
		<input type="text" name="phone">
		<p><input type="submit" value="학생등록">
		
	</div>
</form>	
</body>
</html>