<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	try{
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("password");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into member values(?,?,?,?,?,?,now(),null)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,id);
	pstmt.setString(2,passwd);
	pstmt.setString(3,name);
	pstmt.setString(4,age);
	pstmt.setString(5,gender);
	pstmt.setString(6,email);
	
	pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	out.println("<script>");
	out.println("alert('정상적으로 저장되었습니다!')");
	out.println("location.href='login.jsp'");
	out.println("</script>");
}catch(SQLException e){
	out.println("SQLException:" + e.getMessage());
}
	
%>
</body>
</html>