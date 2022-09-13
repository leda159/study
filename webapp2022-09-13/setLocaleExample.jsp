<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!-- fmt :  각 나라의 숫자,날짜,시간,통화를 표현하기 위한 태그 라이브러리 -->    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 현재 국가의 로케일 정보를 출력 -->
	<%=response.getLocale() %>
	
	<!-- 로케일 정보를 변경 -->
	<fmt:setLocale value="ko_KR" />
	<p><%=response.getLocale() %>
	<p>금액:<fmt:formatNumber value="10000" type="currency" />
	
	<!-- 로케일 정보를 일본으로 지정 -->
	<fmt:setLocale value="ja_JP" />
	<p><%=response.getLocale() %>
	<p>금액:<fmt:formatNumber value="10000" type="currency" />
	
	<!-- 로케일 정보를 미국으로 지정 -->
	<fmt:setLocale value="en_US" />
	<p><%=response.getLocale() %>
	<p>금액:<fmt:formatNumber value="10000" type="currency" />
</body>
</html>