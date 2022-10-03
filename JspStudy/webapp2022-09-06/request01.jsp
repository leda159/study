<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>

 <!-- 전송방식
 
	  (jsp방식) (sql방식)
	 * post : insert
	 * get : select
	 * put : update
	 * delete : delete
	-->	
	
	<form action="request01_process.jsp" method="post">
		<p>아이디:<input type="text" name="id">
		<p>비밀번호:<input type="password" name="passwd">
		<p><input type="submit" value="전송">
	</form>
</body>
</html>

