<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<jsp:include page="menu.jsp"/>
<%@ include file="dbconn.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과등록</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">학과등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="./depart_process.jsp" class="form-horizontal" 
		      method="post">
			<div class="form-group row">
				<label class="col-sm-2 text-center">학과코드</label>
				<div class="col-sm-3">
					<input type="text" name="departCd"  class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 text-center">학과명</label>
				<div class="col-sm-3">
					<input type="text" name="departName" class="form-control">
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