<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="dbconn.jsp" %>    

	<%
		String user_id = (String)session.getAttribute("session_ID");
		String sql = "select * from member where id ='"+user_id+"'";
	
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	
	    
	    pstmt = conn.prepareStatement(sql);
	    rs = pstmt.executeQuery();
		  
		
		 if(rs.next()){
			 String id = request.getParameter("id");
		%>



<h2>회원수정 페이지</h2>
<form action="join_update.jsp" method="post">
	<p>아이디 : <input style="margin-left:35px;" type="text" id="id" name="id" value="<%=rs.getString("id") %>">
	<p>비밀번호 : <input style="margin-left:20px;" type="password" name="password">
	<p>이름 : <input style="margin-left:50px;" type="text" id="name" name="name" value="<%=rs.getString("name") %>">
	<p>나이 : <input style="margin-left:50px;" type="text" id="age" name="age" value="<%=rs.getString("age") %>">
	<p>성별 : <input type="radio" name="gender" value="남자" checked value="<%=rs.getString("gender") %>">남자
			 <input type="radio" name="gender" value="여자">여자
	<p>이메일주소 : <input type="text" id="email" name="email" value="<%=rs.getString("email") %>">
	<p><input type="submit" value="수정">
	<input type="button" value="메뉴목록" onclick="location.href='menu.jsp'">	
</form>
 
<%
	 }	
%>
</body>
</html>