<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- text/html → MIME 이라고 한다
    MIME : ex) image/jpeg image/gif image/jpg --> 
<%@ page import ="java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>   
<!DOCTYPE html>
<html>
<head>

<!-- bootstrap.min/css:부트스트랩 css파일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<%@ include file = "menu.jsp" %>
<body>

<%!
	String greeting = "웹 쇼핑몰에 오신 것을 환영합니다";
	String tagline = "Welcome to Web Market!";
%>
	<!-- @jumbotron:타이틀을 지정할때 사용 -->
	<!-- @display-3:1~6까지 글꼴 크기 지정 -->
	<div class="jumbotron">
		<div class=" container">
			<h1 class="display-3">
				<%=greeting %>
			</h1>
		</div>
	</div>
	<div class="container">
		<!-- 글자를 가운데 정렬 -->
		<div class=" text-center">
			<h3>
				<%=tagline %>
			</h3>
			<%
				/* 응답처리시 화면을 1초에 한번씩 새로고침 */
				response.setIntHeader("refresh", 1);
			
				/* Date:현재 날짜를 가져오는 클래스 */
				Date day= new java.util.Date();
				
				SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 a HH시mm분ss초 E요일");
				
				String today = sf.format(day);
				out.println("현재시간:"+today);
			%>
		</div>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>

