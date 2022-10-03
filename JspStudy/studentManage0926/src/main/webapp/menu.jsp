<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- 아이콘 표시 -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 

<%-- datepicker 관련 설정 --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>
<body>

<%
	//세션 아이디 값을 가져온다.
	String sessionId = 
	   (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand-md navbar-light bg-primary sticky-top">
	<div class="container">
			<ul class="navbar-nav justify-content-start">
				<li class="nav-item"><a class="nav-link" href="<c:url value="#"/>">한국대학교</a></li>
			</ul>
			<ul class="navbar-nav justify-content-end">	
				<c:choose>
					<%-- 로그인 하기전 --%> 
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link" href="<c:url value="login.jsp"/>">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="empJoin.jsp"/>'>사원등록</a></li>
					</c:when>
					<%-- 로그인 한 경우 --%>
					<c:otherwise>
					    <li class="nav-item"><a class="nav-link" href="<c:url value="/depart.jsp"/>">학과등록</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/student.jsp"/>">학생등록</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/studentList.jsp"/>">학생목록</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/departList.jsp"/>">학과목록</a></li>
						<li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/logout.jsp"/>">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	
</nav>

</body>
</html>