<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ include file ="dbconn.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<sql:update dataSource="${dataSource}"
				var="resultSet">
		insert into student(sno,name,phone,regDate)
			   value(?,?,?,now())	
		<sql:param value="${param.sno}" />	<%-- 입력 화면에서 값을 가져온다 --%>   
		<sql:param value="${param.name}" />
		<sql:param value="${param.phone}" /> 
	</sql:update>
	
	<script>
		alert("등록 완료!");
		location.href="menu.jsp";
	</script>
</body>
</html>