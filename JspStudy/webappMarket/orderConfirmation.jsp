<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String cartId = session.getId();
	
		String shipping_cartId = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";
		String shipping_addressName2 = "";
		
		//생성된 쿠키 정보를 가져와서 쿠키 배열에 대입
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				
				Cookie thisCookie = cookies[i];
				
				//쿠키명을 가져온다.
				String n = thisCookie.getName();
				
				//해당 쿠키에 대한 쿠키값을 가져와서 변수에 대입
				if(n.equals("Shipping_cartId")){
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				
				if(n.equals("Shipping_name")){
					shipping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				if(n.equals("Shipping_shippingDate")){
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				
				if(n.equals("Shipping_country")){
					shipping_country = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				if(n.equals("Shipping_zipCode")){
					shipping_zipCode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				
				if(n.equals("Shipping_addressName")){
					shipping_addressName = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				
				if(n.equals("Shipping_addressName2")){
					shipping_addressName2 = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
			}
		}
		
	%>
	
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br>
				성명:<%out.println(shipping_name);%><br>
				우편번호:<%out.println(shipping_zipCode);%><br>
				주소:<%out.println(shipping_addressName);%><br>
				    <%out.println(shipping_addressName2);%>(<%out.println(shipping_country);%>)<br>
			</div>
			<div class="col-4" align="right">
				<p><em>배송일:<%out.println(shipping_shippingDate);%></em>
			</div>
		</div>
		
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품명</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum=0;
				
					//장바구니에 있는 상품 목록을 가져와서 ArrayList 변수에 대입
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartList");
					
					//장바구니에 상품이 없는 경우
					if(cartList == null){
						cartList = new ArrayList<Product>();
					}	
					
					//장바구니 내역이 있으면 반복문으로 출력
					for(int i=0;i<cartList.size();i++){
						Product product = cartList.get(i);
						
						//상품소계
						int total = product.getUnitPrice() * product.getQuantity();
						//총합계
						sum = sum + total;
				%>
				<tr>
					<td class="text-center"><em><%=product.getPname()%></em></td>
					<td class="text-center"><fmt:formatNumber value='<%=product.getQuantity()%>' pattern="#,##0"/></td>
					<td class="text-center"><fmt:formatNumber value='<%=product.getUnitPrice()%>' pattern="#,##0원"/></td>
					<td class="text-center"><fmt:formatNumber value='<%=total%>' pattern="#,##0원"/></td>
				</tr>
				<%
					}
				%>
			<tr>
				<td></td>
				<td></td>
				<td class="text-right"><strong>총액:</strong></td>
				<td class="text-center text-danger"><strong><fmt:formatNumber value='<%=sum%>' pattern="#,##0원"/></strong></td>
			</tr>	
			</table>
			
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button">이전</a>
			<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
			
		</div>
				
	</div>
</body>
</html>



