<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 문자열 함수를 사용하기 위함 -->    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>java 문자열 검색  				<!-- contains: 문자열에서 특정 문자가 있는지 체크하여 있으면 true, 없으면 false -->
	<p>Hello,Java Server Pages! => ${fn:contains("Hello,Java Server Pages!","java")}
	<p>hello,Java Server Pages! => ${fn:containsIgnoreCase("hello,Java Server Pages!","java")}	
       								<!-- containsIgnoreCase: 대,소문자를 무시해서 특정 문자가 있는지 체크한다 -->
</body>
</html>



