<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>  
<%@ page import="java.text.SimpleDateFormat" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>


</head>
<body>
    <!-- nav: 메뉴를 생성하는 태그
    navbar-expand :해상도에 따라 메뉴크기 조정
    navbar-dark:메뉴 글자색
    bg-dark:메뉴 배경색
    containter:영역지정 -->

	<%@ include file="menu.jsp" %>

    <%-- 선언문 : 변수 선언,메서드 선언 --%> 
	<%!
		String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
		String tagline = "Welcome to Web Market!";
	%>
	
	<!-- jumbotron:타이틀 지정
	display-3 :1부터 6까지 글꼴 크기 지정 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting %>
			</h1>
		</div>
	</div>	
	<div class="container">
		<!--글자를 가운데 정렬 -->
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
			<%
				/* 응답처리시 화면을 5초에 한번씩 새로고침 */
			    response.setIntHeader("Refresh",5);
			
				/* 현재 날짜 가져오는 클래스 */
				Date day = new java.util.Date();
				
				SimpleDateFormat sf =
				   new SimpleDateFormat("yyyy년MM월dd일 a hh:mm:ss E요일");
				
				String today = sf.format(day);
				
				out.println("현재시간:" + today);

			%>
		</div>
	</div>

	<%@ include file="footer.jsp" %>
</body>
</html>




