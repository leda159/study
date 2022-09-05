<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- @메뉴를 생성하는 태그 -->
	<!-- @navbar:메뉴를 만듬   @navbar-dark:메뉴 글자색 -->
	<!-- @navbar-expand:해상도에 따라 메뉴크기 조정(반응형) --> 
	<!-- @bg-dark:메뉴 배경색  @container:영역지정 -->
	<!-- @./ : 현재폴더       @../ : 상위폴더(부모) -->
	
	<nav class = "navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./welcome.jsp">Home</a>
			</div>
		</div>
	</nav>
</body>
</html>