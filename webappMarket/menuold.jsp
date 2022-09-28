<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  bootstrap.min.css : 부트스트랩 css파일   --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 

<%-- datepicker 관련 설정 --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a href="navbar-brand" href="./welcome.jsp">HOME</a>
			</div>
		</div>	
		<div>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<a class="nav-link" href="./products.jsp">상품목록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="./addProduct.jsp">상품등록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="./editProduct.jsp?edit=update">상품수정</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="./editProduct.jsp?edit=delete">상품삭제</a>
					</li>
				</ul>
			</div>
	</nav>
</body>
</html>





