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
	//데이터베이스와 연결하는 객체 
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/webmarketdb?serverTimezone=Asia/Seoul";
	String user = "koreashop";
	String password = "koreashop1234";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);
%>
</body>
</html>