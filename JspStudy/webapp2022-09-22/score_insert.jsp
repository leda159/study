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
	<%-- 데이터베이스 연결 설정 include --%>
	<%@ include file="dbconn.jsp" %>
	
	<c:set var="total" 
	       value="${param.kor + param.eng + param.math}"/>
	<c:set var="avg" 
	       value="${(param.kor + param.eng + param.math)/3}"/>
	
	<c:choose>
		<c:when test="${avg >= 90}">
			<c:set var="grade" value="A"/>
		</c:when>
		<c:when test="${avg >= 80}">
			<c:set var="grade" value="B"/>
		</c:when>
		<c:when test="${avg >= 70}">
			<c:set var="grade" value="C"/>
		</c:when>
		<c:when test="${avg >= 60}">
			<c:set var="grade" value="D"/>
		</c:when>
		<c:otherwise>
			<c:set var="grade" value="F"/>
		</c:otherwise>
	</c:choose>
	
	<sql:update dataSource="${dataSource}" var="resultSet">
		insert into score(sno,kor,eng,math,total,avg,grade,regDate)
		     values(?,?,?,?,?,?,?,now())
		<sql:param value="${param.sno}"/>     
		<sql:param value="${param.kor}"/>
		<sql:param value="${param.eng}"/>
		<sql:param value="${param.math}"/>
		<sql:param value="${total}"/>
		<sql:param value="${avg}"/>
		<sql:param value="${grade}"/>
	</sql:update>
	
	<script>
		alert("성적 등록 성공");
		location.href="menu.jsp";
	</script>	
</body>
</html>









