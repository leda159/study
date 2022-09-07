<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* session에 지정된 모든 속성값을 삭제 */
		session.invalidate();
		/* 메인화면으로 이동 */
		response.sendRedirect("body.jsp");
	%>
</body>
</html>

