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
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sdate = request.getParameter("sdate");
	
	
	


	String sql = "select * from schedule";
	
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	
	if(rs.next()){
		sql = "delete from schedule where sdate = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,sdate);
		pstmt.executeUpdate();
		%>
		 <script>
			 alert("정상적으로 삭제하였습니다.");
		 	location.href="list.jsp"
		 </script>
		 
		 
		 <%
		
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
%>
</body>
</html>