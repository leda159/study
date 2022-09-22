<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- jstl을 이용하여 데이터베이스 연결 설정 -->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<!-- jstl로 데이터베이스 연결 설정정보 -->
		
		
	<sql:setDataSource
		var="dataSource"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/examdb?serverTimezone=Asia/Seoul"
		user="exam"
		password="exam1234"/>
</body>
</html>






