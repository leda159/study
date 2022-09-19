<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String shipping_cartId="";
		String shipping_name="";
		String shipping_shippingDate="";
		String shipping_country="";
		String shipping_zipCode="";
		String shipping_addressName="";
		
		
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				
				Cookie thisCookie = cookies[i];
				
				String n = thisCookie.getName();
				
				//쿠키에서 주문번호를 가져온다.
				if(n.equals("Shipping_cartId")){
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				
				//쿠키에서 배송일자를 가져온다.
				if(n.equals("Shipping_shippingDate")){
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
			}
		}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은<% out.println(shipping_shippingDate); %>에 배송될 예정입니다!
		<p>주문번호:<% out.println(shipping_cartId); %>
	</div>
	<div class="container">  
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
	</div>
	
	
	
	
	
	<%
		//세션 속성값을 모두 삭제
		session.invalidate();
	
	
	
	for (int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		
		String n = thisCookie.getName();
		
		
		//startsWith : 문자열에서 특수문자로 시작하는지 여부를 알아보는 메서드
		if(n.startsWith("Shipping_")){ //쿠키의 이름이 Shipping_로 시작하면
			thisCookie.setMaxAge(0);   //유효시간을 0 으로 준다 > 쿠키 삭제
		}
		
		
		response.addCookie(thisCookie);
	}
	
	%>
</body>
</html>




