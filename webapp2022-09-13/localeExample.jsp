<%@page import="java.util.spi.LocaleServiceProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Locale" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ page import = "java.text.DateFormat" %>
<%
	Locale locale = request.getLocale();
	String disPlayLanguage = locale.getDisplayLanguage();
	String language = locale.getLanguage();
	String displayCountry = locale.getDisplayCountry();
	String country = locale.getCountry();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.println("로케일 언어:"+disPlayLanguage+"<br>");
		out.println("로케일언어 코드:"+language+"<br>");
		out.println("로케일 국가:"+displayCountry+"<br>");
		out.println("로케일 국가 코드:"+country+"<br>");
	
		
		//현재 날짜를 리턴
		Date currentDate = new Date();
		//날짜를 원하는 패턴으로 출력한다
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL,locale);
		//숫자를 원하는 형태로 출력하는 클래스
		NumberFormat numberFormat = NumberFormat.getNumberInstance(locale);
	%>
	<p>국가 : <%=locale.getDisplayCountry() %>
	<p>날짜 : <%=dateFormat.format(currentDate) %>
	<p>숫자(12345.67) : <%=numberFormat.format(12345.67) %>
</body>
</html>