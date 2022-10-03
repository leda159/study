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
		
			String empno = request.getParameter("empno");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("ename");
			String phone = request.getParameter("phone");
			
			PreparedStatement pstmt = null;
			
			String sql = "insert into emp values(?,?,?,?,now(),null)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,empno);
			pstmt.setString(2,passwd);
			pstmt.setString(3,name);
			pstmt.setString(4,phone);
			
			pstmt.executeUpdate();
			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
			out.println("<script>");
			out.println("alert('사원등록 성공')");
			out.println("location.href='menu.jsp'");
			out.println("</script>");
		}catch(SQLException e){
			out.println("SQLException:" + e.getMessage());
		}
		
	%>
</body>
</html>