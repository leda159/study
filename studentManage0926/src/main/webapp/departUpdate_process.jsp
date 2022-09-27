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
		request.setCharacterEncoding("utf-8");
	
		String sno = request.getParameter("sno");
		String departCd = request.getParameter("departCd");
		String departName = request.getParameter("departName");
		
		PreparedStatement pstmt = null;
		
		String sql = "update depart" +
		             "   set departName = ?," +
		          	 "       updateDate = now()" +
		             " where departCd = ?";
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1,departName);
		pstmt.setString(2,departCd);
		
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("departList.jsp");
		
	%>
</body>
</html>