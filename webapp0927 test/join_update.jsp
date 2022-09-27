<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ include file="dbconn.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender= request.getParameter("gender");
	String email = request.getParameter("email");
	
	PreparedStatement pstmt = null;
	
	

		String sql = "update member"+
					 "	set  password = ?," +
					 "	     name = ?,"+
					 "	     age = ?,"+
					 "	     gender = ?,"+
					 "	     email = ?"+
					 " where id = ?";
					
	pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1,password);
		pstmt.setString(2,name);
		pstmt.setString(3,age);
		pstmt.setString(4,gender);
		pstmt.setString(5,email);
		pstmt.setString(6,id);
		
		pstmt.executeUpdate();
		
	
	
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		
		out.println("<script>");
		out.println("alert('정상적으로 수정되었습니다!')");
		out.println("location.href='login.jsp'");
		out.println("</script>");
	
	
	
%>	
	
	
</body>
</html>