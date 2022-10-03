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
	String name = request.getParameter("name");
	
	
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
		session.invalidate(); //세션정보삭제
		%>
		 <script>
			 alert("삭제 되었습니다.");
		 	location.href="main.jsp"
		 </script>
		 
		 
		 <%
		
		
	}else{
		out.println("아이디가 없습니다.");
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
%>
</body>
</html>