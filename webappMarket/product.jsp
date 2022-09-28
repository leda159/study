<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<%@ include file="dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	img {
	width:300px;
	height:300px;
	/* 가로,세로 비율을 유지하면서 컨테이너에 꽉차게 표시 */
	object-fit:cover;
	}
</style>
<script>

	//상품리스트에서 선택한 상품을 장바구니에 담는 함수 
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();			
		}
	}	
</script>
</head>
<body>
	             
    <jsp:include page="menu.jsp"/>
    
    <div class="jumbotron">
    	<div class="container">
    		<h1 class="display-3">상품 정보</h1>
    	</div>
    </div>	             
    
    <%
    	/* products.jsp 페이지에서 선택한 상품코드값 */
    	String id = request.getParameter("id");
    
     	PreparedStatement pstmt = null;
     	ResultSet rs = null;
     	
     	String sql = 
     		"select * from product where p_id = ?";
     	
     	pstmt = conn.prepareStatement(sql);
     	
     	pstmt.setString(1,id);
     	
     	rs = pstmt.executeQuery();
     	
     	if(rs.next()){

    %>
    
     <div class="container">
    	<div class="row">
    		<div class="col-md-5">
    			<img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width:100%">
    		</div>		
    		<div class="col-md-6">
    			<h3><%=rs.getString("p_name")%></h3>
    			<p><%=rs.getString("p_description")%>
    			<p><b>상품코드:</b>
    			<span class="badge badge-danger">
    				<%=rs.getString("p_id")%>
    			</span>
    			<p><b>제조사:</b><%=rs.getString("p_manufacturer")%>
    			<p><b>분류:</b><%=rs.getString("p_category")%>
    			<p><b>재고수:</b><%=rs.getLong("p_unitsInStock")%>
    			<h4><%=rs.getInt("p_unitPrice")%>원</h4>
    			<p>
    			<form name="addForm" 
    			      action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
    				<a href="#" class="btn btn-info" onclick="addToCart();">상품주문 &raquo;</a>
    				<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
    				<a href="./products.jsp" class="btn btn-secondary">상품목록 &raquo;</a>
    			</form>
    		</div>
    	</div>
    	<hr>
    </div>
    <%
     	}
    %>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>



