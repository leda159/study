<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="cart" class="dao.Cart" 
	             scope="session"/>
	<%
		//세션정보를 관리하는 객체로
		//true로 지정하면 현재 생성되어 있는 세션정보를
		//리턴하고 false로 지정하면 현재 생성된 세션정보가
		//없을시 null을 리턴한다.
		HttpSession httpSession = 
		            request.getSession(true);
	
		cart.update(request,
				    httpSession,
				    request.getParameter("pcode"),
				    Integer.parseInt(request.getParameter("qty"))
				   );
		
		//장바구니 화면으로 이동
		response.sendRedirect("cart.jsp");
	
	%>             
	             
	
</body>
</html>






