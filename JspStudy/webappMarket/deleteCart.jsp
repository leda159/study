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
		//cart.jsp에서 전달된 JsessionID 값
		String id = request.getParameter("cartId");
		
		if(id == null || id.trim().equals("")){
			response.sendRedirect("cart.jsp");
			return;
		}
		
		//모든 세션 속성값을 삭제처리
		session.invalidate();
		
		//장바구니 화면으로 이동
		response.sendRedirect("cart.jsp");
		
	%>
</body>
</html>