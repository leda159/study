<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//쿠키 정보 생성
		//인코딩(encoding) : 문자열을 컴퓨터가 인식하도록 바이트단위로 변환처리하는 과정
		//디코딩(decodign) : 인코딩된 바이트 단위의 글자를 물자열로 복원하는 과정
				
				
		
		Cookie cartId = new Cookie("Shipping_cartId",URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
		Cookie name = new Cookie("Shipping_name",URLEncoder.encode(request.getParameter("name"),"utf-8"));
		Cookie shippingDate = new Cookie("Shipping_shippingDate",URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
		Cookie country = new Cookie("Shipping_country",URLEncoder.encode(request.getParameter("country"),"utf-8"));
		Cookie zipCode= new Cookie("Shipping_zipCode",URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
		Cookie addressName = new Cookie("Shipping_addressName",URLEncoder.encode(request.getParameter("addressName"),"utf-8"));
		Cookie addressName2 = new Cookie("Shipping_addressName2",URLEncoder.encode(request.getParameter("addressName2"),"utf-8"));
	
		//쿠키의 유효시간 지정  (24시간)
		cartId.setMaxAge(24*60*60); 
		name.setMaxAge(24*60*60);
		shippingDate.setMaxAge(24*60*60);
		country.setMaxAge(24*60*60);
		zipCode.setMaxAge(24*60*60);
		addressName.setMaxAge(24*60*60);
		addressName2.setMaxAge(24*60*60);
		
		
		//생성된 쿠키정보를 응답처리시 헤더에 포함해서 클라이언트 브라우저에 전송
		response.addCookie(cartId); 
		response.addCookie(name);
		response.addCookie(shippingDate);
		response.addCookie(country);
		response.addCookie(zipCode);
		response.addCookie(addressName);
		response.addCookie(addressName2);
		
		
		//주문배송 확인을 하는 페이지로 이동을 시킨ㄷㅏ
		response.sendRedirect("orderConfirmation.jsp");
		
		
	%>
</body>
</html>