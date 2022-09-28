<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%@ include file="../menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">
					Please Sign In</h3>
			<% 
				String error = 
				     request.getParameter("error");
			
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디나 비밀번호츨 확인하세요!");
					out.println("</div>");
				}
			%>
			
			<form class="form-signin" action="login_process.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">아이디</label>
					<input type="text" class="form-control" placeholder="아이디를 입력하세요" name="id" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label>
					<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="passwd" required>
				</div>
				
				<button type="submit" class="btn btn-lg btn-success btn-block">
						로그인
				</button>
			</form>
		</div>
	</div>
</body>
</html>