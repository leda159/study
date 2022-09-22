<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	//정상적인 로그인 사용자인경우 세션 정보를 가져온다
	String sessionId = (String) session.getAttribute("sessionId");
%>


<%-- 데이터베이스 연결 설정 --%>
<%@include file="dbconn2.jsp" %> 



<%-- 로그인 사용자의 정보를 검색 --%> 
<!-- jstl을 사용했기 때문에 jstl로 만든 dbconn2.jsp를 불러와야한다 -->
<!-- dataSource:데이터 베이스 연결 설정 -->
<!-- ?에 값은 sql:param을 이용해서 value값이다 -->
<!-- 세션 아이디값(String sessionId)을 ?에 대입한다 -->
<sql:query dataSource="${dataSource}" var="result"> <!-- result에 id=? 값을 담는다 -->
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

<%-- datepicker (날짜 달력) 관련 설정 --%>
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

	<!-- 메뉴를 반응형으로 해상도에 따라 표시 --> <!-- collapse: 화면을 작게하면 가로였던 메뉴가 세로로 펴시된다 -->
  <div class="collapse navbar-collapse" id="navbarMenuList"> 
    <ul class="navbar-nav"><!-- 메뉴를 설정한다 -->
	      <li class="nav-item dropdown"><!-- 소 메뉴를 설정한다 -->
	        <a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
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
	          <a class="dropdown-item" href="<c:url value="/products.jsp"/>">상품리스트</a> <%-- href="<c:url value="/products.jsp"/>"> : 아이콘을 클릭하면 해당jsp로 이동한다 --%>
	        </div>
	      </li>
      </ul>
   </div>
      
   <div class="collapse navbar-collapse justify-content-end" id="navbarMenuList">
	      <ul class="navbar-nav">
	          <li>
	            <ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" style="padding-top:8px;padding-right:60px; color:#F1FD0C;font-size:18px" class="dropdown-item" href="<c:url value="/cart.jsp"/>"><i class="fa fa-shopping-cart fa-2x align-middle"></i></a></li>
				</ul>
	          </li>
		      <li class="nav-item dropdown"><%-- 대매뉴를 클릭시 서브메뉴를 작성 --%>
			   	 <c:choose>
					<c:when test="${empty sessionId}"> <%-- empty: 없다면 즉, sessionId가 없다면이니깐  사용자가 로그인을 안한경우 --%>
					  <ul class="navbar-nav">
					      <li class="nav-item"><a class="nav-link" style="padding-top:8px; color:#F1FD0C;font-size:18px" class="dropdown-item" href="<c:url value="login.jsp"/>"><i class="fa fa-sign-in fa-2x align-middle"></i> 로그인</a></li>
					      <li class="nav-item"><a class="nav-link" style="padding-top:8px; color:#F1FD0C;font-size:18px" class="dropdown-item" href="<c:url value="join.jsp"/>"><i class="fa fa-user-circle fa-2x align-middle"></i> 회원가입</a></li>
				      </ul>
					</c:when>
					<c:when test="${sessionId == 'admin'}"> <%-- 로그인을 했는데 sessionId 가 aimin 이면 --%>
					      <li style="padding-top:8px;color:white;font-size:20px;padding-right:60px;">
					         <c:if test="${not empty result.rows}"><!-- result.rows:리턴되는 행이 있다면 forEach안에 있는 문장이 실행된다. -->
					         	<c:forEach
								var="row" items="${result.rows}"><c:out value="${row.name}" /> <!-- row에 회원정보다 다 들어있다 -->
								<c:set var="loginName" scope="session" value="${row.name}"/><%-- value="${row.name}"를loginName에 답는다 --%>
							 </c:forEach>님 반갑습니다.
					         </c:if>
						  </li>
					      <li class="nav-item dropdown"><%-- 관리자용 전용 메뉴를 출력한다 --%>
					      	<a style="padding-top:8px; color:white;font-size:18px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
	          					관리자용
	        				</a>
					        <ul class="dropdown-menu dropdown-menu-right">
					          <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="/addProduct.jsp"/>">상품정보 등록</a></li>
					          <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="/editProduct.jsp?edit=update"/>">상품정보 수정</a></li>
					          <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="/editProduct.jsp?edit=delete"/>">상품정보 삭제</a></li>
					          <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="logout.jsp"/>">로그아웃 </a></li>
						      <li class="dropdown-item"><a class="dropdown-item" href="<c:url value="memberUpdate.jsp?id=${sessionId}"/>">회원 수정</a></li>
					        </ul>
					      </li>  
					</c:when>
					<c:when test="${sessionId != 'admin'}"> <%-- sessionId가 admin이 아닐떄 (일반사용자 일때) --%>
					<ul class="navbar-nav">
						<li style="padding-top:8px;color:white;font-size:20px;padding-right:60px;">
					         <c:if test="${not empty result.rows}">
					         	<c:forEach
								var="row" items="${result.rows}"><c:out value="${row.name}" />
								<c:set var="loginName" scope="session" value="${row.name}"/>
							 </c:forEach>님 반갑습니다.
					         </c:if>
						  </li>
						<li class="nav-item"><a style="padding-top:9px; color:white;font-size:17px" class="btn btn-lg nav-link" href="<c:url value="logout.jsp"/>">로그아웃 </a></li>
						<li class="nav-item"><a style="padding-top:9px; color:white;font-size:17px" class="btn btn-lg nav-link" href="<c:url value="memberUpdate.jsp?id=${sessionId}"/>">회원 수정</a></li> <%-- memberUpdate.jsp?id=${sessionId}" : id값을 가지고 jsp로 넘어간다 --%>     
						<li class="nav-item"><a style="padding-top:9px; color:white;font-size:17px" class="btn btn-lg nav-link" href="<c:url value="memberDelete.jsp?id=${sessionId}"/>">회원 삭제</a></li>
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