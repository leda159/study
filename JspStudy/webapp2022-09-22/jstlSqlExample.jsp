<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" 
           uri="http://java.sun.com/jsp/jstl/sql" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border-collapse:collapse;
		border:1px solid #000;
	}
	
	tr,th,td {
		border:1px solid #000;
	}
</style>
</head>
<body>
	<%-- 데이터베이스 연결 설정 --%>
	<sql:setDataSource
		var ="con"
		url="jdbc:mysql://localhost:3306/examdb?serverTimezone=Asia/Seoul"
		driver="com.mysql.cj.jdbc.Driver"
		user="exam"
		password="exam1234"/>
	
	<%-- 테이블에서 데이터 select --%>
	<sql:query var="rs" dataSource="${con}">
		select * from member order by id
	</sql:query>
	
	<table align="center">
		<caption>고객 리스트</caption>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>연락처</th>
		</tr>
		
		<c:forEach var="row" items="${rs.rows}">
			<tr>
				<td>${row.id}</td>
				<td>${row.passwd}</td>
				<td>${row.name}</td>
				<td>${row.phone}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>





