<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 변수 선언 Camel Case 표기법--%>
	<c:set var="evenSum" value="0"/>
	<c:set var="oddSum" value="0"/>
	<c:set var="totalSum" value="0"/>
	<c:set var="fiveTotalSum" value="0"/>
	
	<%-- param 객체는 입력화면에서 입력한 값을 가지고 있는 객체 --%>
	<c:set var="num1" value="${param.num1}"/>		
	<c:set var="num2" value="${param.num2}"/>
	
	<%-- 반복문 --%>
	<c:forEach var="i" 
	           begin="${num1}" 
	           end="${num2}">
	    
	    <%-- 조건문 --%>       
	    <c:if test="${i % 2 == 0}">
	    	<c:set var="evenSum" value="${evenSum + i}"/>
	    </c:if>         
	    
		<c:if test="${i % 2 == 1}">
	    	<c:set var="oddSum" value="${oddSum + i}"/>
	    </c:if>
	    
	    <%-- 5의 배수  --%>
	    <c:if test="${i % 5 == 0}">
	    	<c:set var="fiveTotalSum" 
	    	       value="${fiveTotalSum + i}"/>
	    </c:if>
	    
	    <c:set var="totalSum" 
	    	       value="${totalSum + i}"/>
	    	       
	</c:forEach>
	
	${num1} 에서 ${num2} 까지 짝수합:
	   <fmt:formatNumber value="${evenSum}" 
	                     pattern="#,###"/><br>
    ${num1} 에서 ${num2} 까지 홀수합:
	   <fmt:formatNumber value="${oddSum}" 
	                     pattern="#,###"/><br>
	${num1} 에서 ${num2} 까지 총합계:
	   <fmt:formatNumber value="${totalSum}" 
	                     pattern="#,###"/><br>
	${num1} 에서 ${num2} 까지 5의배수합계:
	   <fmt:formatNumber value="${fiveTotalSum}" 
	                     pattern="#,###"/>                                        	                     
</body>
</html>


