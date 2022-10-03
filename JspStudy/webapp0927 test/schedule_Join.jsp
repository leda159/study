<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="schedule_Join_insert.jsp" method="post">
<table border="1">
	<tr>
		<td colspan="2" align="center">스케줄등록 페이지</td>
	</tr>
	<tr>
		<td>회의일자:</td>
		<td><input type="text" name="sdate"></td>

	</tr>
	<tr>
		<td>제목:</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>내용:</td>
		<td><input type="text" name="content"></td>
	</tr>
	<tr>
		<td>장소:</td>
		<td><input type="text" name="location"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="등록" >
		<input type="reset" value="다시작성" ></td>
	</tr>
</table>
</form>
</body>
</html>