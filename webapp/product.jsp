<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function addToCart(){ //상품리스트에서 선택한 상품을 장바구니에 담는 함수
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){//confirm: 재확인 한다 
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
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
    			<p><b>재고수:</b><fmt:formatNumber value="<%=product.getUnitsInStock()%>" />
    			<h4><fmt:formatNumber value="<%=product.getUnitPrice()%>" /></h4>      <!--id가 온 이유는 상품 코드값을 가지고 넘긴다-->
    			<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
    				<a href="#" class="btn btn-info" onclick="addToCart()">상품주문 &raquo;</a>
    				<a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a> <!--./ : 현재 디렉토리-->
    				<a href="./products.jsp" class="btn btn-secondary">상품목록 &raquo;</a>
    			</form>
    		</div>
    	</div>
    	<hr>
    	<jsp:include page="footer.jsp"/>
    </div>
</body>
</html>



