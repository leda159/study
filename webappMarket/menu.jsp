<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	//정상적인 로그인 사용자인 경우 세션 정보를 가져온다
	String sessionId = (String) session.getAttribute("sessionId");
%>

<%-- 데이터베이스 연결 설정 --%>
<%@include file="dbconn2.jsp" %>

<%-- 로그인 사용자의 정보를 검색 
dataSource : 데이터베이스 연결 설정
--%>
<sql:query dataSource="${dataSource}" var="result">
   select * from member where id = ?
   <sql:param value="${sessionId}"/>         
</sql:query>

<!DOCTYPE html>
<html>
<head>
  <title>상품관리</title>
  <meta charset="utf-8">
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

<nav class="navbar navbar-expand-md navbar-light bg-primary sticky-top">
  <a style="padding-top:8px; color:yellow;font-size:18px" class="navbar-brand" href="welcome.jsp">한국쇼핑몰</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenuList" aria-controls="navbarMenuList" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- 메뉴를 반응형으로 해상도에 따라 표시 -->
  <div class="collapse navbar-collapse" id="navbarMenuList">
    <ul class="navbar-nav">
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="/BoardListAction.do?pageNum=1" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          게시판
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          쇼핑몰
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<c:url value="/products.jsp"/>">상품리스트</a>
	        </div>
	      </li>
      </ul>
   </div>
      
   <div class="collapse navbar-collapse justify-content-end" id="navbarMenuList">
	      <!-- 메뉴 설정 -->
	      <ul class="navbar-nav">
	          <li>
	            <ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" style="padding-top:8px;padding-right:60px; color:#F1FD0C;font-size:18px" class="dropdown-item" href="<c:url value="/cart.jsp"/>"><i class="fa fa-shopping-cart fa-2x align-middle"></i></a></li>
				</ul>
	          </li>
	          <!-- 대메뉴를 클릭시 서브메뉴를 작성 -->
		      <li class="nav-item dropdown">
			   	 <c:choose>
			   	 	<%-- 사용자가 로그인을 안한 경우 --%>
					<c:when test="${empty sessionId}">
					  <ul class="navbar-nav">
					      <li class="nav-item"><a class="nav-link" style="padding-top:8px; color:#F1FD0C;font-size:18px" class="dropdown-item" href="<c:url value="/member/login.jsp"/>"><i class="fa fa-sign-in fa-2x align-middle"></i> 로그인</a></li>
					      <li class="nav-item"><a class="nav-link" style="padding-top:8px; color:#F1FD0C;font-size:18px" class="dropdown-item" href="<c:url value="/member/join.jsp"/>"><i class="fa fa-user-circle fa-2x align-middle"></i> 회원가입</a></li>
				      </ul>
					</c:when>
					<%-- 관리자 아이디로 로그인시 처리 --%>
					<c:when test="${sessionId == 'admin'}">
					      <li style="padding-top:8px;color:white;font-size:20px;padding-right:60px;">
					         <c:if test="${not empty result.rows}">
					         	<c:forEach
								var="row" items="${result.rows}"><c:out value="${row.name}" />
								<c:set var="loginName" scope="session" value="${row.name}"/>
							 </c:forEach>님 반갑습니다.
					         </c:if>
						  </li>
						  <%-- 관리자용 전용 메뉴 출력 --%>
					      <li class="nav-item dropdown">
					      	<a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          					관리자용
	        				</a>
					        <ul class="dropdown-menu dropdown-menu-right">
					          <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="/addProduct.jsp"/>">상품정보 등록</a></li>
					          <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="/editProduct.jsp?edit=update"/>">상품정보 수정</a></li>
					          <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="/editProduct.jsp?edit=delete"/>">상품정보 삭제</a></li>
					          <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="/member/logout.jsp"/>">로그아웃 </a></li>
						      <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="/member/memberUpdate.jsp?id=${sessionId}"/>">회원 수정</a></li>
					        </ul>
					      </li>  
					</c:when>
					
					<%-- 일반 사용자가 로그인시 처리 --%>
					<c:when test="${sessionId != 'admin'}">
					<ul class="navbar-nav">
						<li style="padding-top:8px;color:white;font-size:20px;padding-right:60px;">
					         <c:if test="${not empty result.rows}">
					         	<c:forEach
								var="row" items="${result.rows}"><c:out value="${row.name}" />
								<c:set var="loginName" scope="session" value="${row.name}"/>
							 </c:forEach>님 반갑습니다.
					         </c:if>
						  </li>
						<li class="nav-item"><a style="padding-top:9px; color:white;font-size:17px" class="btn btn-lg nav-link" href="<c:url value="/member/logout.jsp"/>">로그아웃</a></li>
						<li class="nav-item"><a style="padding-top:9px; color:white;font-size:17px" class="btn btn-lg nav-link" href="<c:url value="/member/memberUpdate.jsp?id=${sessionId}"/>">회원 수정</a></li>
						<li class="nav-item"><a style="padding-top:9px; color:white;font-size:17px" class="btn btn-lg nav-link" href="<c:url value="/member/memberDelete.jsp?id=${sessionId}"/>">회원 삭제</a></li>
					</ul>
					</c:when>	
				 </c:choose>
			 </li>
	   	</ul>
	</div>     	
</nav>
<hr>
</body>
</html>