<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생수정</title>

</head>
<body>
	
	<jsp:include page="menu.jsp"/>
	
	<%-- 타이틀 선언 --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">학생수정</h1>
		</div>
	</div>
	
	<%@include file="dbconn.jsp" %>
	
	<%

	    String sno = request.getParameter("sno");
	
	    PreparedStatement pstmt = null;
	    PreparedStatement pstmt2 = null;
	    ResultSet rs = null;
	    ResultSet rs2 = null;
	    String departCd,departName;
	    
	    String sql = "select * from student where sno = ?";
	    
	    pstmt = conn.prepareStatement(sql);
	    
	    pstmt.setString(1,sno);
	    
	    rs = pstmt.executeQuery();
	    
	    if(rs.next()){
	    	
	    	//테이블에 저장되어 있는 학과코드를 가져오기 위해 선언
	    	String db_departCd = rs.getString("departCd");
		
	    	sql = "SELECT * FROM depart order by departCd";
			pstmt2 = conn.prepareStatement(sql);
			rs2 = pstmt2.executeQuery();
			
	%>

	<div class="container">
		<form name="newProduct" action="./studentUpdate_process.jsp" class="form-horizontal" 
		      method="post">
			<div class="form-group row">
				<label class="col-sm-2 text-center">학생번호</label>
				<div class="col-sm-3">
					<input type="text" id="sno" name="sno"  readonly="readonly" class="form-control text-center" value="<%=rs.getString("sno")%>">
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2 text-center">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control text-center" value="<%=rs.getString("name")%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">학과</label>
				<div class="col-sm-3">
					<select class="form-control text-center" name="departCd">
						<option value="">선택하세요</option>
						<%
						    
						    
							while (rs2.next()) {
								departCd = rs2.getString("departCd");
								departName = rs2.getString("departName");
						%>
					
						<option value="<%=departCd%>" <%if(rs2.getString("departCd") != null && rs2.getString("departCd").equals(db_departCd)){%> selected <%}%>><%=departName%></option>
						
						<%
							}
						%>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">연락처</label>
				<div class="col-sm-3">
					<input type="text" id="phone" name="phone" class="form-control text-center" value="<%=rs.getString("phone")%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">이메일</label>
				<div class="col-sm-3">
					<input type="text" id="email" name="email" class="form-control text-center" value="<%=rs.getString("email")%>">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-12">
					<input type="submit" class="btn btn-primary" style="margin-left:50px;width:400px;" value="수정">
				</div>
			</div>
		</form>
	</div>
	
	<%
	    }
	%>
</body>
</html>