<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<h3>param 액션 태그</h3>
	
	<!-- 
	param01_date.jsp로 제어권이 넘어가면서속성값을 매개변수로 가져간다.
	 
	encoding(인코딩)?
	문자열을 컴퓨터가 인식가능한 바이트단위로 변환처리를 해주는 기능	
	
	decoding(디코딩)?
	바이트 단위를 다시 문자열로 복원하는 기능		
			-->
	
	<jsp:forward page="param01_date.jsp">
		<jsp:param name="id" value="admin"/>
		<jsp:param name="name" value='<%=java.net.URLEncoder.encode("관리자") %>'/>
	</jsp:forward>
	
	<p>Java Server Page
</body>
</html>