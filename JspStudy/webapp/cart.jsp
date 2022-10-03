<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %> 
<%@ page import="dto.Product" %>   
<%@ page import="dao.ProductRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%
	//tomcat 서버가 클라이언트JSessionID
	String cartId = session.getId();
%>
<script>
function checkOrder(){
	<%
		ArrayList<Product> list= (ArrayList<Product>)session.getAttribute("cartList");
	
		//장바구니가 비어 있으면
		if(list== null || list.size() ==0){
	%>
		alert("장바구니에 내역이 없습니다. 주문하세요.");
		return false;  //return false를 하면 submit이 동작을 안한다. 다음 코드로 진행이 안된다
	<%
		}
	%>
}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="right">
						<a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a>
						<a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success"
						onclick="return checkOrder();">주문하기</a>
						<a href="./products.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>	
					</td>	
				</tr>
			</table>
		</div>
		<div style="padding-top:50px">
			<table class="table table-hover table-striped">
				<tr>
					<th class="text-center col-sm-4">상품</th>
					<th class="text-right col-sm-2">가격</th>
					<th class="text-right col-sm-2">수량</th>
					<th class="text-right col-sm-2">소계</th>
					<th class="text-center col-sm-2">비고</th>
				</tr>
				<%
					int sum=0;    //cartList : 주문한 상품 내역이 다 들어가있다
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartList");
					// 세션 속성인 cartList를 반복하면서 출력한다
					if(cartList == null)
						cartList = new ArrayList<Product>();
					
					for(int i=0; i<cartList.size(); i++){ //상품 리시트 하나씩 출력하기
						Product product = cartList.get(i);
					
					
						// 소계 계산 = 단가 * 수량
						int total = product.getUnitPrice() * product.getQuantity();
						// 총액 계산
						sum = sum + total;
					
				%>
				<tr>
					<td class="text-center col-sm-4"><%=product.getProductId()%>-<%=product.getPname()%></td>
					<td class="text-right col-sm-2"><fmt:formatNumber value="<%=product.getUnitPrice()%>"/></td>
					<td class="text-right col-sm-2"><fmt:formatNumber value="<%=product.getQuantity()%>"/></td>
					<td class="text-right col-sm-2"><fmt:formatNumber value="<%=total%>" /></td>
					<td class="text-center col-sm-2"><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge-danger">삭제</a></td>
				</tr>
				<%
				}
				%>
				<tr>
					<th></th>
					<th></th>
					<th class="text-right">총액</th>
					<th class="text-right"><fmt:formatNumber value="<%=sum %>" /></th>
					<th></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>







