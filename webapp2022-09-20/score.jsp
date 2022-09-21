<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>학생성적</h2>

<form action="score_process.jsp" method="post">
	<p>학생번호:<input type="text" name="sno">
	<p>학생이름:<input type="text" name="sname">
	<p>국어:<input type="text" name="kor">
	<p>영어:<input type="text" name="eng">
	<p>수학:<input type="text" name="math">
	<input type="submit" value="전송">
</form>
</body>
</html>