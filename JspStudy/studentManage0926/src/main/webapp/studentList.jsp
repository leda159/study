<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		text-align:center;
	}
	
	.button {
		margin-bottom:20px;
		font:12px 맑은고딕;
		color:blue;
		width:100px;
		height:20px;
	}
	
th {
	background:lightblue;
}
	
.table-bordered > tbody > tr > td, 
.table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > td,
.table-bordered > tfoot > tr > th,
.table-bordered > thead > tr > td,
.table-bordered > thead > tr > th {
    border: 1px solid #1d1c1a;
}
</style>
</head>
<body>

	<%@ include file="dbconn2.jsp" %>
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">학생목록</h1>
		</div>
	</div>
	
	<sql:query var="rs" dataSource="${dataSource}">
		select s.sno as sno,
		       s.name as name,
		       d.departName as departName,
		       s.phone as phone,
		       s.email as email 
		  from student s,depart d 
		 where s.departCd = d.departCd
		order by s.sno
	</sql:query>
	
	<table class="table table-bordered w-75" style="margin-left: auto; margin-right: auto;">
	    <tr>
	    	<th width="10%">학생번호</th>
	    	<th width="10%">이름</th>
	    	<th width="10%">학과</th>
	    	<th width="10%">연락처</th>
	    	<th width="20%">이메일</th>
	    	<th colspan="2" width="10%">비고</th>
	    	<!-- <th width="10%">삭제</th> -->
	    </tr>

	    <c:forEach var="row" items="${rs.rows}">
	    	<tr>
	    		<td><c:out value="${row.sno}"/></td>
	    		<td><c:out value="${row.name}"/></td>
	    		<td><c:out value="${row.departName}"/></td>
	    		<td><c:out value="${row.phone}"/></td>
	    		<td><c:out value="${row.email}"/></td>
	    		<td colspan="2">
	    			<a href="studentUpdate.jsp?sno=<c:out value='${row.sno}'/>">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
	    			<a href="studentDelete.jsp?sno=<c:out value='${row.sno}'/>">삭제</a>
	    		</td>	    		
	    	</tr>	    
	    </c:forEach>   
	</table>
</body>
</html>