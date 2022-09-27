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
		String name = request.getParameter("name");
		String departCd = request.getParameter("departCd");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		PreparedStatement pstmt = null;
		
		String sql = "update student" +
		             "   set name = ?," +
		             "       departCd = ?," +
		             "       phone = ?," +
		             "       email = ?," +
		          	 "       updateDate = now()" +
		             " where sno = ?";
		            		 
				
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1,name);
		pstmt.setString(2,departCd);
		pstmt.setString(3,phone);
		pstmt.setString(4,email);
		pstmt.setString(5,sno);
		
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		//상품 리스트 화면으로 이동
		response.sendRedirect("studentList.jsp");
		
	%>
</body>
</html>