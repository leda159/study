<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri = "http://java.sun.com/jsp/jstl/sql" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 변수선언 -->
	<c:set var="evenSum" value="0"/>  <!-- 짝수 변수 -->
	<c:set var="oddSum" value="0"/>	  <!-- 홀수 변수 -->
	<c:set var="totalSum" value="0"/> <!-- 총합수 변수 -->
	
	
	
	<!-- 반복문 처리 -->
	
	<!-- 짝수합 -->
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:if test="${i % 2 == 0 }">
			<c:set var="evenSum" value="${evenSum+i }" />
		</c:if>
		<!-- 홀수합 -->
		<c:if test="${i % 2 == 1 }">
			<c:set var="oddSum" value="${oddSum+i }" />
		</c:if>
		<!-- 총합계 -->
		<c:set var="totalSum" value="${totalSum + i }"/>
	</c:forEach>
	
	
	<!-- 출력 -->
	<p>짝수합:<fmt:formatNumber value="${evenSum }" pattern="#,##0"/>
	<p>홀수합:<fmt:formatNumber value="${oddSum }" pattern="#,##0"/>
	<p>총합계:<fmt:formatNumber value="${totalSum }" pattern="#,##0"/>

	
	<h2>문자열 분할</h2>
	<c:forTokens var="animal" items="말,호랑이,사자,기린" delims=",">
		<c:out value="${animal }" />
	</c:forTokens>
	
	<br>
	
	
	<c:set var="kor" value="77" />
	<c:set var="eng" value="88" />
	<c:set var="math" value="91" />
	
	<fmt:formatNumber value="${(kor+eng+math)/3 }" pattern="##0.0" />
	
	
	
	<p>JSTL과 데이터베이스 연동 예제
	<!-- 오라클과 데이터베이스 연결 설정 완성 -->
	<sql:setDataSource
		var = "con"
		url = "jdbc:oracle:thin:@localhost:1521:bigdata"
		driver = "oracle.jdbc.driver.OracleDriver"
		user = "bigdata"
		password = "bigdata1234"
	/>	
	<!-- 데이터베이스 조회 
		dataSource:
	-->
	<sql:query var="rs" dataSource="${con }">
		select * from student
	</sql:query>
	
	
	<table border="1" align="center">
		<tr>
			<th>학생번호</th>
			<th>학생이름</th>
			<th>학생연락처</th>
			<th>학생이메일</th>
		</tr>
		<c:forEach var="row" items="${rs.rows }">
			<tr>
				<td>${row.sno }</td>
				<td>${row.name }</td>
				<td>${row.phone }</td>
				<td>${row.email }</td>	
			</tr>
		</c:forEach>
	</table>
</body>
</html>




