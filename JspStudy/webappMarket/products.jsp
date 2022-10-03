<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
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
	<jsp:include page="menu.jsp"/>
	
	<!-- 부트스트랩을 이용하여 타이틀 선언 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>

	<!-- 부트스트랩에서 영역 지정시 container 지정 -->
	<div class="container">
		<div class="row" align="center">
		
			<%@ include file="dbconn.jsp"%>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
			%>
			
			<!-- 부트스트랩은 가로를 12등분한다
			col-xs-숫자 : 항상 가로로 배치
			col-sm-숫자 : 해상도 768px 이하에서 세로로 배치
			col-md-숫자 : 해상도 992px 이하에서 세로로 배치
			col-lg-숫자 : 해상도 1200px 이하에서 세로로 배치 -->
			
			<!-- 한행에 상품 3개씩 출력처리 -->
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width:100%">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_unitPrice")%>원
				<p>
				<a href="./product.jsp?id=<%=rs.getString("p_id")%>" 
				   class="btn btn-primary btn-sm" 
				   role="button">상세정보 &raquo;</a>
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>	             
	             
</body>
</html>