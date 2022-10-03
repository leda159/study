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
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	String sql = "select * from member";
	
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	
	if(rs.next()){
		sql = "delete from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.executeUpdate();
		session.invalidate();
		%>
		 <script>
			 alert("삭제 되었습니다.");
		 	location.href="login.jsp"
		 </script>
		 
		 
		 <%
		
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
%>
</body>
</html>