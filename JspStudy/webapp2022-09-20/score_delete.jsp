<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>학생 성적 삭제</h2>

<form action="score_delete_process.jsp" method="post">
	<p>삭제 학생번호:<input type="text" name="sno">
	<input type="submit" value="삭제">
</form>
</body>
</html>