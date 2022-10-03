<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>학생 성적 수정</h2>

<form action="score_update_process.jsp" method="post">
	<p>수정 학생번호:<input type="text" name="sno">
	<p>수정 국어:<input type="text" name="kor">
	<p>수정 영어:<input type="text" name="eng">
	<p>수정 수학:<input type="text" name="math">
	<input type="submit" value="전송">
</form>
</body>
</html>