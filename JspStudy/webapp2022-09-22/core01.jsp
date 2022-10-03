<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	browser 변수 값 설정
	<%--변수 지정  User-Agent : 현재 실행중인 브라우저 명--%>
	<c:set var="browser" value="${header['User-Agent']}"/>
	<br>
	<c:out value="${browser}"/> <!-- 변수값 출력 -->
	
	<p>browser 변수 값 제거후
	<c:remove var="browser"/> <!-- 변수 값 삭제처리 -->
	<c:out value="${browser}"/>
</body>
</html>




