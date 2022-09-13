<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	img {
	width:300px;
	height:300px;
	/* 가로,세로 비율을 유지하면서 컨테이너에 꽉차게 표시 */
	object-fit:cover;
	}
</style>
</head>
<body>
	
	<!-- 자바빈즈를 이용 -->
	<jsp:useBean id="productDAO"
	             class="dao.ProductRepository"
	             scope="session"/>
	             
    <jsp:include page="menu.jsp"/>
    
    <div class="jumbotron">
    	<div class="container">
    		<h1 class="display-3">상품 정보</h1>
    	</div>
    </div>	             
    
    <%
    	/* products.jsp 페이지에서 선택한 상품코드값 */
    	String id = request.getParameter("id");
    
    	//page209
    	ProductRepository dao = ProductRepository.getInstance();
    	    
    	/* 상품목록에서 상세보기 버튼을 클릭한 상품정보가 대입 */
    	Product product = dao.getProductById(id); 
    %>
    
     <div class="container">
    	<div class="row">
    		<div class="col-md-5">
    			<img src="./resources/images/<%=product.getFilename()%>" style="width:100%">
    		</div>		
    		<div class="col-md-6">
    			<h3><%=product.getPname()%></h3>
    			<p><%=product.getDescription()%>
    			<p><b>상품코드:</b>
    			<span class="badge badge-danger">
    				<%=product.getProductId()%>
    			</span>
    			<p><b>제조사:</b><%=product.getManufacturer()%>
    			<p><b>분류:</b><%=product.getCategory()%>
    			<p><b>재고수:</b><%=product.getUnitsInStock()%>
    			<h4><%=product.getUnitPrice()%></h4>
    			<p><a href="#" class="btn btn-info">상품주문 &raquo;</a>
    			<a href="./products.jsp" class="btn btn-secondary">상품목록 &raquo;</a>
    		</div>
    	</div>
    	<hr>
    	<jsp:include page="footer.jsp"/>
    </div>
</body>
</html>



