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

	<sql:setDataSource
		var ="dataSource"
		url="jdbc:mysql://localhost:3306/examdb?serverTimezone=Asia/Seoul"
		driver="com.mysql.cj.jdbc.Driver"
		user="exam"
		password="exam1234"/>
		
	<sql:update dataSource="${dataSource}" 
	            var="resultSet">
		delete from customer where id = ?	       
		<sql:param value="${param.id}"/> 
	</sql:update>		
	
	<script>
		alert("정상적으로 삭제 완료");
	</script>
	<%-- <c:import var="url" url="customerList.jsp"/>
	${url} --%>
</body>
</html>



