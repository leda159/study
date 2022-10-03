<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<sql:setDataSource
		var ="dataSource"
		url="jdbc:mysql://localhost:3306/examdb?serverTimezone=Asia/Seoul"
		driver="com.mysql.cj.jdbc.Driver"
		user="exam"
		password="exam1234"/>
		
	<sql:update dataSource="${dataSource}" 
	            var="resultSet">
		insert into customer(id,passwd,name,regDate)
		       values(?,?,?,now())
		<sql:param value="${param.id}"/>       
		<sql:param value="${param.passwd}"/>
		<sql:param value="${param.name}"/>
	</sql:update>		
	
	<%-- <c:import var="url" url="customerList.jsp"/>
	${url} --%>
</body>
</html>



