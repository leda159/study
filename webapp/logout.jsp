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
		//세션에 지정된 모든 속성값을 삭제처리
		session.invalidate();
		//상품등록 페이지로 이동
		response.sendRedirect("addProduct.jsp");
	%>
</body>
</html>



