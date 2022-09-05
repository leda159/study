<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward action tag</title>
</head>
<body>

	<h2>액션 태그</h2>
	<!-- 
	jsp:forward?
	
	a.jsp에서 b.jsp로 제어권이 완전히 넘어가면서
	기존 a.jsp 출력 버퍼에 있던 데이터는 삭제처리되고
	주소 url은 a.jsp 기존 그대로 표시됨
	a.jsp의 request,response 객체의 값은 b.jsp에서 사용 가능 -->
	
	<!-- jps태그 위에 있느 내용들은 다 삭제되고 화면상에 안보임 -->
	<jsp:forward page="forward_date.jsp" />
	<p>----------------------
</body>
</html>