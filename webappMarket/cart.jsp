<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<jsp:include page="menu.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkOrder(){
		<%
			ArrayList<Product> list = 
			  (ArrayList<Product>)session.getAttribute("cartList");
		
			//장바구니가 비어 있으면
			if(list == null || list.size() == 0){
		%>
			   alert("장바구니에 내역이 없습니다.주문하세요");
			   return false;	  			   
		<%
			}
			
		%>
	}
</script>


<script>
	$(document).ready(function(){
		//장바구니 수량 증가 혹은 감소 버튼이 클릭시 처리
		$(".qtyUp,.qtyDown").click(function(){
			var qtyUp = $(this);//현재 객체의 값을 가져와 변수에 대입
			var tr = qtyUp.parent().parent();//현재행
			var td = tr.children();//현재행 td 정보
			var rowNum = tr.index() + 1;//현재 작업중인 행번호
			
			//수량을 증감시키기 위한 상품코드값을 변수에 대입
			//split을 이용하여 특수문자를 기준으로 각각 배열에 대입
			//처리
			var pid = td.eq(0).text().split('-')[0];
			var price = Number(td.eq(1).text());
			
			//hasClass:qtyUp이 class로 지정되어있는지 여부 체크
			if($(this).hasClass('qtyUp')){
				var qty = 
					  Number(td.children("input.qty").val()) + 1;
			}else{ //수량 감소 버튼 클릭시
				if(Number(td.children("input.qty").val()) == 1){
					alert("주문수량은 1개 이상 되어야 합니다.");
					return false;
				}
			
				var qty = 
					  Number(td.children("input.qty").val()) - 1;
				
			}
			
			//계산된 수량을 수량위치에 값 대입			
			$(this).parent().parent().children("td").children("input.qty").val(qty);
			
			//상품코드와 수량을 ArrayList에 반영하기 위해
			//hidden으로 전송처리
			document.cartQtyUpdate.pcode.value = pid;
			document.cartQtyUpdate.qty.value = qty;
			document.cartQtyUpdate.submit();
			
		});
	});
</script>


</head>
<body>
	<%
		//tomcat 서버가 클라이언트에게 응답시
		//발생시키는 JSessionID 값을 리턴
		String cartId = session.getId();
	%>
	

	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="right">
						<!-- 장바구니에 있는 모든 상품을 일괄 삭제버튼 -->
						<a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a>
						<a href="./shippingInfo.jsp?cartId=<%=cartId%>" 
						   class="btn btn-success"
						   onclick="return checkOrder();">
						   주문하기
						</a>
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
					<th class="text-right col-sm-2"> 수량</th>
					<th class="text-right col-sm-2">소계</th>
					<th class="text-center col-sm-2">비고</th>
				</tr>
				<%
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartList");
					
					if(cartList == null){
						cartList = new ArrayList<Product>();
					}
					
					//세션 속성인 cartList를 반복하면서 출력
					for(int i=0;i<cartList.size();i++){
						Product product = cartList.get(i);
						
						//소계 계산 = 단가 * 수량
						int total = product.getUnitPrice() * 
									product.getQuantity();
						
						//총액 계산
						sum = sum + total;
				%>
				<tr class="tr_this">
					<td class="text-center col-sm-4"><%=product.getProductId()%>-<%=product.getPname()%></td>
					<td class="text-right col-sm-2"><fmt:formatNumber value="<%=product.getUnitPrice()%>"/></td>
					
					<td class="text-right col-sm-2">
						<input style="text-center" 
						       readonly="readonly"
						       size="2"
						       name="qty"
						       class="qty"
						       value="<%=product.getQuantity()%>"/>
						&nbsp;&nbsp;
						<i class="fa fa-arrow-circle-up fa-lg qtyUp" 
						   style="color:blue;"></i>
						&nbsp;&nbsp;
						<i class="fa fa-arrow-circle-down fa-lg qtyDown" 
						   style="color:red;"></i>       
					</td>
					
					<td class="text-right col-sm-2"><fmt:formatNumber value="<%=total%>"/></td>
					<td class="text-center col-sm-2"><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th class="text-right">총액</th>
					<th class="text-right"><fmt:formatNumber value="<%=sum%>"/></th>
					<th></th>
				</tr>
			</table>

		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
	
	<%--장바구니 수량 변경처리를 위한 form 지정 --%>
	<form id="cartQtyUpdate"
	      name="cartQtyUpdate"
	      action="cartUpdate.jsp"
	      method="post">
	      <input type="hidden" name="pcode">
	      <input type="hidden" name="qty">
	</form>
	
</body>
</html>






