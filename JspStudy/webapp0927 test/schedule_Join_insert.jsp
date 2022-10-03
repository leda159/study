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

	String sdate = request.getParameter("sdate");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String location = request.getParameter("location");
	
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into schedule values(?,?,?,?,now(),null)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,sdate);
	pstmt.setString(2,title);
	pstmt.setString(3,content);
	pstmt.setString(4,location);
	
	
	pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	out.println("<script>");
	out.println("alert('정상적으로 스케줄이 저장되었습니다!')");
	out.println("location.href='list.jsp'");
	out.println("</script>");
}catch(SQLException e){
	out.println("SQLException:" + e.getMessage());
}
	
%>
</body>
</html>