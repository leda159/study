<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%
	//로그인정보 가져옴
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("passwd");

	
	//세션 불러옴
	user_id = (String)session.getAttribute("UserID");
	user_pw = (String)session.getAttribute("UserPASS");

%>



<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class=" container">
			<h1 class="display-3" style="color:White">
				한국 쇼핑몰
			</h1>
		</div>
		<%
			if(user_id == null){//로그인 하지않았을때
		%>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="./login.jsp">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./join.jsp">회원가입</a>
				</li>
			</ul>
		</div>
		<%
			}else if(user_id != null){//로그인 했을때
		%>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="./logout.jsp">로그아웃</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./memberUpdate.jsp">회원수정</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./memberdelete.jsp">회원삭제</a>
				</li>
			</ul>
		</div>
		
		
		<%
			}
		%>
</nav>
</body>
</html>