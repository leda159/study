<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String productId = request.getParameter("productId");
		String name = request.getParameter("name");
		String unitPrice = request.getParameter("unitPrice");
		String description = request.getParameter("description");
		String manufacturer = request.getParameter("manufacturer");
		String category = request.getParameter("category");
		String unitsInStock = request.getParameter("unitsInStock");
		String condition = request.getParameter("condition");
		
		// wrapper클래스 : 기본자료형을 객체타입으로 선언 
		Integer price;
		
		// 단가 입력이 안된경우 
		if(unitPrice.isEmpty()){
			price = 0;
		}else{
			//입력받은 값을 정수형으로 변환
			price = Integer.valueOf(unitPrice);
		}
		
		
		long stock;
		//재고수량
		if(unitsInStock.isEmpty()){
			stock = 0;
		}else{
			stock = Long.valueOf(unitsInStock);
		}
		
		
		
		//new 가 없는 이유 
		
		//ProductRepository의 getInstance()메서드 가 static으로 선언되어 있으므로
		//new명령을 사용하여 인스턴스를 생성하지 않고 클래스명.메서드로 바로 접근가능
		
		ProductRepository dao = ProductRepository.getInstance();
		
		
		//상품등록 화면에서 입력한 내용을 ArrayList에 추가하기 위해 Product 클래스의 인스턴스를 생성
		Product newProduct = new Product(); 
		
		newProduct.setProductId(productId);
		newProduct.setPname(name);
		newProduct.setUnitPrice(price);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(stock);
		newProduct.setCondition(condition);
		
		//ArrayList에 신규 상품 정보를 추가
		dao.addProduct(newProduct);
		
		//상품목록으로 이동
		response.sendRedirect("products.jsp");
		
	%>
</body>
</html>


