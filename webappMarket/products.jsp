<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>


<!-- 자바빈즈 사용 선인 -->
<!-- scope:session - 같은 브라우저에서는 JsessionID가 동일하므로 연결유지 -->   
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> 


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 목록</title>
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


	             

	<jsp:include page="menu.jsp" />
		<!-- jumbotron ~ display- : 부트스트랩을 이용하여 타이틀 선언 -->
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">상품 목록</h1>
			</div>
		</div>
		
		<%
			ProductRepository dao = ProductRepository.getInstance(); 
		%>
		
		
		<%
		/* 상품리스트를 리턴하여 변수에 대입 */
		ArrayList<Product> listOfProducts = dao.getAllProducts();
		
		%>
		<!--container:부트스트랩에서 영역 -->
		<div class="container">
			<!-- row:행(가로) -->
			<div class="row" align="center">
				<%
					for(int i=0; i<listOfProducts.size(); i++){
						/* ArrayList에서 한행씩 가져와서 Product형태로 product에 대입 */
						Product product = listOfProducts.get(i);

				%>
				
				
				
				<!-- 부트스트랩은 가로를 12등분한다
				한 행에 3줄씩 처리
				col-xs-숫자 :	 항상 가로로 배치
				col-sm-숫자 : 화면이 줄어들면 (해상도 768px 이하에서) 세로로 배치
				col-md-숫자 : 화면이 줄어들면 (해상도 992px 이하에서) 세로로 배치
				col-lg-숫자 : 화면이 줄어들면 (해상도 1200px 이하에서) 세로로 배치
				한행씩 가져와서 화면에서 출력-->
				
				<!--  ./  :현재 폴더
				../ :상위 폴더-->
				<div class="col-md-4">
					<img src="./resources/images/<%=product.getFilename()%>" style="width:100%">
					<h3><%=product.getPname() %></h3>
					<p><%=product.getDescription() %>
					<p><%=product.getUnitPrice() %>원
					<p><a href="./product.jsp?id=<%=product.getProductId()%>"
					class="btn btn-primary btn-sm " role="button">상세 정보 &raquo;</a>
				</div>
				<%
					}
				%>
			</div>
			<hr>
		</div>
		<jsp:include page="footer.jsp" />
</body>
</body>
</html>