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
	
		try {
			
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
			
			String sql = "insert into member" + 
					     "     values(?,?,?,?,?,?,?,?,?,now(),null)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,id);
			pstmt.setString(2,passwd);
			pstmt.setString(3,name);
			pstmt.setString(4,phone);
			pstmt.setString(5,email);
			pstmt.setString(6,birthday);
			pstmt.setString(7,postCd);
			pstmt.setString(8,addr);
			pstmt.setString(9,addr2);
			
			pstmt.executeUpdate();
			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
			out.println("<script>");
			out.println("alert('회원가입 성공')");
			out.println("location.href='../menu.jsp'");
			out.println("</script>");
		}catch(SQLException e){
			out.println("SQLException:" + e.getMessage());
		}
		
	%>
</body>
</html>