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
	
		String sno = request.getParameter("sno");
	
		String sql = "select * from student";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){//삭제하려는 사용자가 테이블에 존재
			sql = "delete from student where sno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sno);
			pstmt.executeUpdate();
		}else{
			out.println("일치하는 학생이 없습니다.");
		}
		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("logout.jsp");
	%>
</body>
</html>