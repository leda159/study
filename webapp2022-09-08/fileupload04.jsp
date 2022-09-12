<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="fileupload04_process.jsp" 
		  method="post"
		  enctype="multipart/form-data">
		  <p>이름:<input type="text" name="name">
		  <p>제목:<input type="text" name="subject">
		  <p>파일:<input type="file" 
		                name="filename">
		  <p><input type="submit" value="파일올리기">
	</form>
</body>
</html>