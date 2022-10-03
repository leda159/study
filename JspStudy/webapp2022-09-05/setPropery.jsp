<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="bigdata.Person" scope="request" />
	
	
	<!-- 자바 클래스에 있는 필드의 값을 변경할때 사용 -->
	<jsp:setProperty name="person" property="id" value="20181005"/>
	<jsp:setProperty name="person" property="name" value="홍길동"/>
	
	
	
	
	<p>아이디	: <%out.println(person.getId()); %>
	<p>이름	: <%out.println(person.getName()); %> 
	
	<!-- name은 useBean의 id값을 지정 -->
	 <p>아이디	:	<jsp:getProperty name="person" property="id"/>
	<p>이름	: 	<jsp:getProperty  name="person" property="name"/>
</body>
</html>