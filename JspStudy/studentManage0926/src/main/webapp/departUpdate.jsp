<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과수정</title>

</head>
<body>
	
	<jsp:include page="menu.jsp"/>
	
	<%-- 타이틀 선언 --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">학과수정</h1>
		</div>
	</div>
	
	<%@include file="dbconn.jsp" %>
	
	<%

	    String departCd = request.getParameter("departCd");
	
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    String sql = "select * from depart where departCd = ?";
	    
	    pstmt = conn.prepareStatement(sql);
	    
	    pstmt.setString(1,departCd);
	    
	    rs = pstmt.executeQuery();
	    
	    if(rs.next()){
	%>
	
	
	<div class="container">
		<form name="newProduct" action="./departUpdate_process.jsp" class="form-horizontal" 
		      method="post">
		      
			<div class="form-group row">
				<label class="col-sm-2 text-center">학과코드</label>
				<div class="col-sm-3">
					<input type="text" id="departCd" name="departCd"  class="form-control" value="<%=rs.getString("departCd")%>">
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2 text-center">학과명</label>
				<div class="col-sm-3">
					<input type="text" id="departName" name="departName" class="form-control" value="<%=rs.getString("departName")%>">
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<input type="submit" class="btn btn-primary" 
					       value="수정">
				</div>
			</div>
		</form>
	</div>
	
	<%
	    }
	%>
</body>
</html>