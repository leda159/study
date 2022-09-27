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
	
	
	String sdate = request.getParameter("sdate");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String location = request.getParameter("location");
	
	PreparedStatement pstmt = null;
	
	

		String sql = "update schedule"+
					 "	set  title = ?," +
					 "	     content = ?,"+
					 "	     location = ?"+
					 " where sdate = ?";
					
	pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1,title);
		pstmt.setString(2,content);
		pstmt.setString(3,location);
		pstmt.setString(4,sdate);
		
		
		pstmt.executeUpdate();
		
	
	
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		
		out.println("<script>");
		out.println("alert('정상적으로 수정하였습니다')");
		out.println("location.href='list.jsp'");
		out.println("</script>");
	
	
	
%>	
</body>
</html>