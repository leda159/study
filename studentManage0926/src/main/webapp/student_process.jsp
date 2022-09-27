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
	
		try {
			
			request.setCharacterEncoding("utf-8");
		
			String sno = request.getParameter("sno");
			String name = request.getParameter("name");
			String departCd = request.getParameter("departCd");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");

			PreparedStatement pstmt = null;
			
			String sql = "insert into student values(?,?,?,?,?,now(),null)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,sno);
			pstmt.setString(2,name);
			pstmt.setString(3,departCd);
			pstmt.setString(4,phone);
			pstmt.setString(5,email);
			
			pstmt.executeUpdate();
			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
			out.println("<script>");
			out.println("alert('학생등록 성공')");
			out.println("location.href='menu.jsp'");
			out.println("</script>");
		}catch(SQLException e){
			out.println("SQLException:" + e.getMessage());
		}
		
	%>
</body>
</html>