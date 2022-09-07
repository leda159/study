<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!-- 자바빈즈를 이용 -->
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	
	<%
		// products.jsp 페이지에서 선택한 상품코드값 
		String id= request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
		
		//상품목록에서 상세보기 버튼을 클릭한 상품정보가 대입이된다 
		//Product product = productDAO.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><b>상품 코드:</b><span class="badge badge-danger">
					<%=product.getProductId()%></span>
				<p><b>제조사 : <%=product.getManufacturer() %></b>
				<p><b>분류 : <%=product.getCategory() %></b>
				<p><b>재고 수 : <%=product.getUnitsInStock() %></b>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p><a href="#" class="btn btn-info">상품 주문 &raquo;</a>
				<a href="./products.jsp" class="btn-secondary">상품 목록 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>