<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<jsp:include page="menu.jsp"/>
<%@ include file="dbconn.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생등록</title>
</head>
<body>
	<%
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs,rs2;
		
		String departCd,departName;
		
		//학생등록 화면에서 학과 리스트는 테이블 연동
		String sql = "SELECT * FROM depart";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
	
	%>


	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">학생등록</h1>
		</div>
	</div>
	
	<div class="container">
	
		<form name="newProduct" action="./student_process.jsp" class="form-horizontal" 
		      method="post">
		      
			<div class="form-group row">
				<label class="col-sm-2 text-center">학생번호</label>
				<div class="col-sm-3">
					<input type="text" id="sno" name="sno"  class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">학과</label>
				<div class="col-sm-3">
					<select class="form-control" name="departCd" 
					        id="selectlist">
						<option value="">선택하세요</option>
						<%
							while (rs.next()) {
								departCd = rs.getString("departCd");
								departName = rs.getString("departName");
						%>
						<option value="<%=departCd%>"><%=departName%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">연락처</label>
				<div class="col-sm-3">
					<input type="text" id="phone" name="phone" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">이메일</label>
				<div class="col-sm-3">
					<input type="text" id="email" name="email" class="form-control">
				</div>
			</div>			

		    <div class="form-group row">
				<div class="col-sm-12">
					<input type="submit" class="btn btn-primary" style="margin-left:50px;width:400px;" value="등록">
				</div>
			</div>
		
		</form>
	</div>
</body>
</html>