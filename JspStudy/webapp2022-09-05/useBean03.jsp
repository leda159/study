<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	jsp:useBean?
	자바빈즈를 사용하겠다는 action tag
	id : 식별자로 중복되면 안됨
	Class : 자바 클래스의 위치
	scope : request 요청시 속성값 -->
	
	<jsp:useBean id="person" class="bigdata.Person" scope="request" />
	<p> 아이디 : <%=person.getId() %>
	<p> 이름 : <%=person.getName() %>
	
	
	
	
	<% 
	/* 아이디를 바꾸고싶을떄 */
	person.setId(1111);
	person.setName("이순신");
	%>
	
	<p> 아이디 : <%=person.getId() %>
	<p> 이름 : <%=person.getName() %>
	
	
</body>
</html>