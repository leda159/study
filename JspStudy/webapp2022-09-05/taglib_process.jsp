<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- ${ }  ->  EL(표현언어)이라고한다. 변수or수식 올수있다 --%>
	
	<!-- param라는 객체를 이용해서 
	param.변수명(input의 name값)으로 사용가능 -->
	
	<!-- 받은값(param.변수명)을 왼쪽의 변수(var)에 대입한다 -->
	<c:set var="kor" value="${param.kor}" />
	<c:set var="eng" value="${param.eng}" />
	<c:set var="math" value="${param.math}" />
	
	<c:set var="total" value="${kor+eng+math }" />
	<c:set var="avg" value="${total/3 }" />
	
	<!-- 평균값 구할땐 소수점까지 화면상에 찍고 싶어서 fmt(taglib)사용 -->
	총합계:${total }<p>평균:<fmt:formatNumber value="${avg }" pattern="#,##0.0" />
	
</body>
</html>