<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
    
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
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String postCd = request.getParameter("postCd");
		String addr = request.getParameter("addr");
		String addr2 = request.getParameter("addr2");
		
		PreparedStatement pstmt = null;
		
		String sql = "update member" +
		             "   set passwd = ?," + 
		             "       name = ?," +
		             "       phone = ?," +
		             "       email = ?," +
		             "       birthday = ?," +
		          	 "       postCd = ?," + 
		             "       addr = ?," +
		          	 "       addr2 = ?," +
		             "       updateDate = now()" +
		             " where id = ?";
		            		 
				
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1,passwd);
		pstmt.setString(2,name);
		pstmt.setString(3,phone);
		pstmt.setString(4,email);
		pstmt.setString(5,birthday);
		pstmt.setString(6,postCd);
		pstmt.setString(7,addr);
		pstmt.setString(8,addr2);
		pstmt.setString(9,id);
		
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		//상품 리스트 화면으로 이동
		response.sendRedirect("../menu.jsp");
		
	%>
</body>
</html>