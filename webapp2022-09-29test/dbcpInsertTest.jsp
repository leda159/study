<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn =null;
		
		String url ="jdbc:mysql://localhost:3306/exam0916?serverTimezone=Asia/Seoul";
		String user ="fadmin";
		String password ="fadmin1234";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,password);
		
		
		String studno ="1000";
		String name ="홍길동";
		String addr ="부산시 동래구 온청1동";
		String phone ="010-1234-5678";
		
		
		
		PreparedStatement pstmt =null;
		
		try{
			String sql = "insert into student" +
						 "		values(?,?,?,?)";
			
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setString(1,studno);
			pstmt.setString(2,name);
			pstmt.setString(3,addr);
			pstmt.setString(4,phone);
			
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("alert('자료 등록 성공')");
			out.println("</script>");
			
		}catch(SQLException e){
			
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	
	%>
</body>
</html>