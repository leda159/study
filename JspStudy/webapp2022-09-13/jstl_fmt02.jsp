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
	<!-- 문자열을 숫자타입으로 출력 -->
	<p>숫자:<fmt:formatNumber value="3200100" />
	<p><fmt:formatNumber value="3200100" type="number" />
	<!-- 숫자로 출력은 하되 1000단위콤마 표시 안함 -->
	<p><fmt:formatNumber value="3200100" type="number" groupingUsed="false" />
	<!-- 숫자로 출력은 하되 1000단위콤마 표시 함   type="currency" : 해당국가의 통화 단위를 표시 -->
	<p><fmt:formatNumber value="3200100" type="currency" groupingUsed="true" />
	<!-- 해당국가의 통화 단위 대신 다른 모양으로 출력 -->
	<p><fmt:formatNumber value="3200100" type="currency" currencySymbol="&" />
	<!-- 숫자를 퍼센트 단위로 출력 -->
	<p><fmt:formatNumber value="0.45" type="percent" />
	<!-- minIntegerDigits="10" : 최소 숫자 자리수를 10자리로 출력함    minFractionDigits="2" : 소수점 2째자리까지 출력 -->
	<p><fmt:formatNumber value="3200100" minIntegerDigits="10" minFractionDigits="2" />
	<!-- 소수점 2번째까지 나타나고 3번째소수는 반올림 한다  -->
	<p><fmt:formatNumber value="3200100.456" pattern=".00" />
	<p><fmt:formatNumber value="3200100.456" pattern="#,#00.0#" />
</body>
</html>