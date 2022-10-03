<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>장바구니 리스트</h3>
	<%
		request.setCharacterEncoding("utf-8");
	
		ArrayList<String> list =
			(ArrayList<String>)session.getAttribute("cartList");
		
		if(list == null){
	%>
	
			장바구니에 담긴 상품이 없습니다.선택하세요!
			
	<%
		}else {
			for(String product : list){
				out.println(product + "<br>");
			}
		}
	%>		
</body>
</html>




