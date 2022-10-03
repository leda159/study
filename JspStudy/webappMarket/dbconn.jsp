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
		//데이터베이스와 연결을 하는 객체
		Connection conn = null;
		
		//예외발생시 즉시 처리
		try {
			
			String url = "jdbc:mysql://localhost:3306/webmarketdb?serverTimezone=Asia/Seoul";
			String user = "koreashop";//사용자명
			String password = "koreashop1234";
			
			//드라이브를 로딩 시켜준다.
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//데이터베이스와 연결
			conn = DriverManager.getConnection(url,user,password);
			
			//out.println("데이터베이스 연결 성공");
		}catch(SQLException e){
			out.println("데이터베이스 연결 실패<br>");
			out.println("SQLException:" + e.getMessage());
		}
	%>
</body>
</html>





