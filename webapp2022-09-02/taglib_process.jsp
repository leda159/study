<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCT YPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 국어점수 -->
	<c:set var="kor" value="${param.kor}" />
	<!-- 영어점수 -->
	<c:set var="eng" value="${param.eng}" />
	<!-- 수학점수 -->
	<c:set var="math" value="${param.math}" />
	
	
	
	<!-- 총합계 출력 -->
	<p>총합계:<fmt:formatNumber value="${kor+eng+math}" />
	<!-- 평균 출력 -->
	<p>평균:<fmt:formatNumber value="${(kor+eng+math)/3}" pattern="##0.0"/>
	
	
</body>
</html>