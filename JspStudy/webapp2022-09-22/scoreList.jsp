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
	* {
		text-align:center;
	}

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
	<%@ include file="dbconn.jsp" %>	
	<%-- 테이블에서 데이터 select --%>
	<sql:query var="rs" dataSource="${dataSource}">
		select *
		  from student s,score s2
		 where s.sno = s2.sno
	  order by s2.total desc
	</sql:query>
	
	<table align="center">
		<caption>성적 리스트</caption>
		<tr>
			<th>학생번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총합계</th>
			<th>평균</th>
			<th>학점</th>
		</tr>
		
		<c:forEach var="row" items="${rs.rows}">
			<tr>
				<td>${row.sno}</td>
				<td>${row.name}</td>
				<td>${row.kor}</td>
				<td>${row.eng}</td>
				<td>${row.math}</td>
				<td>${row.total}</td>
				<td>${row.avg}</td>
				<td>${row.grade}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>