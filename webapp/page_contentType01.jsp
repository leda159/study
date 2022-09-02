<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 표현문:변수,수식값을 화면에 출력 -->
	
	<!-- Date:현재 날짜를 리턴하는 클래스 -->
	<!-- java.util:패키지 -->
	Today is:<%=new java.util.Date() %>
	<br>
	
	
	
	<!-- 스크립틀릿 태그:자바소스를 코딩 -->
	<%
		 /* Date 클래스와 동일한 인스턴스(instance)를 Heap 동적 메모리에 생성한다
		 1.객체(object):현실세계에 존재하는 사물 
		 2.클래스(class):객체를 프로그램화한 설계도 
			  -필드(field),생성자(constructor),메서드(method)
		 3.인스턴스(instance):원본 클래스와 동일한 형태를 Heap메모리에 생성 */	
		 
		Date now = new Date();
	%>
	
	
	오늘 날짜:<%=now %>
	<br>
	
	
	<%
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 a HH시mm분ss초 E요일");
	
		String today = sf.format(now);
	%>
	
	변환된 오늘날짜:<%=today %>
	
</body>
</html>