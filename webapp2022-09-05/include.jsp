<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<h2>include 액션 태그</h2>
	
	<!-- 
	jsp:include ?
	a.jsp에서 실해오디다가 b.jsp로 제어권이 넘어가서 b.jsp가 실행된 후
	다시 a.jsp action tag 다음 라인으로 제어권이 넘어와서 실행된다.
	 
	flush가 true 선언되면 기존 버퍼에 있던 내용을 출력하고 버퍼를 비운다.
	 -->
	 
	 <jsp:include page="include_date.jsp" flush="true" />
	<p>--------------------------
</body>
</html>