<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>menu</h2>
<%
	request.setCharacterEncoding("utf-8");

	String user_id = request.getParameter("id");
	
	user_id= (String)session.getAttribute("session_ID");
%>
	
	
	
<% 
	if(user_id.equals("admin")){	
%>


<div>
	<ul>
		<li>
			<a href="join_up.jsp">회원수정</a>
		</li>
		<li>
			<a href="delete.jsp">회원삭제</a>
		</li>
		<li>
			<a href="list.jsp">스케줄 리스트</a>
		</li>
		<li>
			<a href="logout.jsp">로그아웃</a>
		</li>
	</ul>
</div>

<% 
	}else if(!user_id.equals("")){
%>
<div>
	<ul>
		<li>
			<a href="join_up.jsp">회원수정</a>
		</li>
		<li>
			<a href="delete.jsp">회원삭제</a>
		</li>
		<li>
			<a href="logout.jsp">로그아웃</a>
		</li>
	</ul>
</div>

<%
	}
%>

</body>
</html>