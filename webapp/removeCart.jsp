<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.util.ArrayList" %>
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
		//cart.jsp에서 전달된 상품코드값
		String id = request.getParameter("id");
	
		if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		
		
		ProductRepository dao = ProductRepository.getInstance();
		
		//장바구니에서 삭제하려는 상품을 검색한다
		Product	product = dao.getProductById(id);
		
		if(product == null){
			response.sendRedirect("exceptionNoproductId.jsp");
		}
		
		ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartList");
		
		
		Product goodsQnt = new Product();
		
		for(int i=0; i<cartList.size(); i++){
			goodsQnt = cartList.get(i);
			
			//장바구니에서 삭제하려는 상품을 검색하면 ArrayList에서 삭제 처리한다. 
			if(goodsQnt.getProductId().equals(id)){
				cartList.remove(goodsQnt);
				break;
			}
		}
		
		//장바구니 화면으로 이동한다.
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>