<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//cart.jsp에서 전달된 상품코드
		String id = request.getParameter("id");
	
		if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		//ProductRepository dao = ProductRepository.getInstance();
		
		//장바구니에서 삭제하려는 상품 검색
		//Product product = dao.getProductById(id);
		
		//if(product == null){
		//	response.sendRedirect("exceptionNoProductId.jsp");
		//}
		
		ArrayList<Product> cartList 
		   = (ArrayList<Product>)session.getAttribute("cartList");
		
		Product goodsQnt = new Product();
		
		for(int i=0;i<cartList.size();i++){
			goodsQnt = cartList.get(i);
			
			//장바구니에서 삭제하려는 상품을 검색하면
			//ArrayList에서 삭제처리한다.
			if(goodsQnt.getProductId().equals(id)){
				cartList.remove(goodsQnt);
			}
		}
		
		//장바구니 화면으로 이동
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>




