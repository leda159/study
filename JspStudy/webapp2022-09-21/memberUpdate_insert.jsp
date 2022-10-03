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
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email1= request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String emailList = request.getParameter("emailList");
	String birthdate = request.getParameter("birthdate");
	String postCd = request.getParameter("postCd");
	String addr = request.getParameter("addr");
	String addr2 = request.getParameter("addr2");
	
	PreparedStatement pstmt = null;
	
	

		String sql = "update member"+
					 "	set  passwd = ?," +
					 "	    name = ?,"+
					 "	    phone = ?,"+
					 "	    email1 = ?,"+
					 "	    email2 = ?,"+
					 "	    emailList = ?,"+
					 "	    birthdate = ?,"+
					 "	    postCd = ?,"+
					 "	    addr = ?,"+
					 "	    addr2 = ?"+
					 " where id = ?";
					
	pstmt = conn.prepareStatement(sql);	
		
		pstmt.setString(1,passwd);
		pstmt.setString(2,name);
		pstmt.setString(3,phone);
		pstmt.setString(4,email1);
		pstmt.setString(5,email2);
		pstmt.setString(6,emailList);
		pstmt.setString(7,birthdate);
		pstmt.setString(8,postCd);
		pstmt.setString(9,addr);
		pstmt.setString(10,addr2);
		pstmt.setString(11,id);
		
		pstmt.executeUpdate();
		
		 %>
		 <script>
			 alert("변경완료");
		 		location.href="main.jsp";
		 </script>
		 
		 
		 <% 
		

		
	
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("menu.jsp");
	
	
%>		
</body>
</html>