<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<jsp:include page="menu.jsp"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">사원등록</h1>
		</div>
	</div>
	
	<div class="container">
	
		<form name="newProduct" action="./empJoin_process.jsp" class="form-horizontal" 
		      method="post">
		      
			<div class="form-group row">
				<label class="col-sm-2 text-center">사원코드</label>
				<div class="col-sm-3">
					<input type="text" id="empno" name="empno"  class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="passwd" name="passwd" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">이름</label>
				<div class="col-sm-3">
					<input type="text" id="ename" name="ename" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">연락처</label>
				<div class="col-sm-3">
					<input type="text" id="phone" name="phone" class="form-control">
				</div>
			</div>

		    <div class="row">
				<div class="col-sm-5 offset-sm-5">
					<button class="btn btn-success" type="submit">등록</button>
				</div>
			</div>	
		
		</form>
	</div>
</body>
</html>