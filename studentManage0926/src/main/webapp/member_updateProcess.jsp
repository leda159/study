<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Context init = new InitialContext();
			DataSource ds = 
				(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			
			String sql = "update member" +
			             "   set name = ?," +
			             "       age = ?," +
			             "       gender = ?," +
			             "       email = ?," +
			             "       updatedate = sysdate" +
			             " where id = ?";
			
			 conn = ds.getConnection();
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1,name);
			 pstmt.setInt(2,age);
			 pstmt.setString(3,gender);
			 pstmt.setString(4,email);
			 pstmt.setString(5,id);
			
			 int result = pstmt.executeUpdate();
			 
			 if(result != 0){//수정이 정상처리되면
				 out.println("<script>");
				 out.println("location.href='member_list.jsp'");
				 out.println("</script>");
			 }else{
				 out.println("<script>");
				 out.println("location.href='member_update.jsp'");
				 out.println("</script>");
			 }
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
</body>
</html>





