<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>선택하신 과일</h2>
	<form action="process.jsp" method="POST">
		<p>독서<input type="checkbox" name="hobby" value="독서" >
		<p>운동<input type="checkbox" name="hobby" value="운동">
		<p>영화<input type="checkbox" name="hobby" value="영화">
		<p><input type="submit" value="전송">
	</form>
</body>
</html>