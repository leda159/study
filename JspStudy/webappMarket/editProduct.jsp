<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제하시겠습니까?")){
			location.href= "./deleteProduct.jsp?id=" + id;
		}
	}
</script>
</head>
<body>
	<%
		String edit = request.getParameter("edit");
	%>
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
			%>
				<div class="col-md-4">
					<img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width:100%">
					<h3><%=rs.getString("p_name")%></h3>
					<p><%=rs.getString("p_description")%>
					<p><%=rs.getString("p_unitPrice")%>원
					<p>
					<%
						if(edit.equals("update")){
							
					%>
							<!-- 상품수정 메뉴를 클릭하면 상품내역을 수정
							하는 화면으로 이동시 상품코드를 매개변수로 전달 -->
							<a href="updateProduct.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-success" role="button">수정&raquo;</a>
					<%
						}else if(edit.equals("delete")){
					%>
					
						<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;</a>
					<%
						}
					%>
				</div>
			<%
				}

				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			%>
		</div>
			<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>