<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>							<!-- split: 문자열을 특정문자로 구분하여 배열에 대입 -->
								<!-- 인덱스0:Hello,   인덱스1:Java   인덱스2:Server 인덱스3:Pages! --> 
	<c:set var="texts" value="${fn:split('Hello, Java Server Pages!',' ')}"/>
	
	<c:forEach var="i" begin="0" end="${fn:length(texts)-1}">
		<p>text[${i}] = ${texts[i]}	
	</c:forEach>
	
	<p><c:out value="${fn:join(texts,'-')}"/>
							<!-- texts : 인덱스에 들어있는 문자열들 -->
							<!-- join : 문자열을 연결을 시킴 - 사용해서 -->
</body>
</html>


