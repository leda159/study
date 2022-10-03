<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 자바빈즈를 사용한다는 선언 -->
	<p><jsp:useBean id="now" class="java.util.Date" />
	
	<!-- 현재일자와 시간중 날짜만 출력 -->
	<p><fmt:formatDate value="${now }" type="date" />
	<!-- 현재일자와 시간중 시간만 출력 -->
	<p><fmt:formatDate value="${now }" type="time" />
	<!-- 현재일자와 시간중 날짜,시간 모두 출력 -->
	<p><fmt:formatDate value="${now }" type="both" />
	<!-- default 날짜 시간 다 보여줌 -->
	<p><fmt:formatDate value="${now }" type="both" dateStyle="default" timeStyle="default" />
	<!-- short 날짜 시간 짧게 보여줌 -->
	<p><fmt:formatDate value="${now }" type="both" dateStyle="short" timeStyle="short" />
	<p><fmt:formatDate value="${now }" type="both" dateStyle="medium" timeStyle="medium" />
	<p><fmt:formatDate value="${now }" type="both" dateStyle="long" timeStyle="long" />
	<!-- short 날짜 시간 전부 보여줌 -->
	<p><fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" />
	<!-- pattern을주면 아래와같이 나타남 -->
	<p><fmt:formatDate value="${now }" type="both" pattern="yyyy년MM월dd일 a HH시mm분ss초 E요일"/>
</body>
</html>