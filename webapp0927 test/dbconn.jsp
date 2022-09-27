<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		Connection conn = null;
		
		try {
			
			String url = "jdbc:mysql://localhost:3306/scheduledb?serverTimezone=Asia/Seoul";
			String user = "sche01";
			String password = "sche1234";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		
			conn = DriverManager.getConnection(url,user,password);
			
		}catch(SQLException e){
			out.println("데이터베이스 연결 실패<br>");
			out.println("SQLException:" + e.getMessage());
		}
	%>
</body>
</html>