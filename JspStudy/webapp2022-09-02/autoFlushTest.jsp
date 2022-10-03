<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- buffer의 기본값: 8kb -->
    <!-- autoFlush:버퍼가 꽉 차지않더라도 출력처리 여부 --> 
    <!-- true로 지정하면 버퍼가 꽉 차지않더라도 바로 버퍼를 출력후 버퍼를 비운다. -->
<%@ page buffer="1kb" autoFlush="true" %>    
<!-- info는 이 페이지를 설명하는 기능 , 프로그램 실행하는데에 아무런 영향이 없다 -->
<%@ page info="이 프로그램은 버퍼 테스트를 하기위한JSP" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for(int i=1; i<=1000; i++){
	%>
		1234
	<%
		}
	%>	
</body>
</html>