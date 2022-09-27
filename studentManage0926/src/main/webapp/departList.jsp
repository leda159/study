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
		
	/* .table-bordered > tbody > tr > td, 
	.table-bordered > tbody > tr > th,
	.table-bordered > tfoot > tr > td,
	.table-bordered > tfoot > tr > th,
	.table-bordered > thead > tr > td,
	.table-bordered > thead > tr > th {
	    border: 1px solid #1d1c1a;
	}	 */
</style>
</head>
<body>
	<%@ include file="dbconn2.jsp" %>
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">학과목록</h1>
		</div>
	</div>
	<sql:query var="rs" dataSource="${dataSource}">
		select * from depart order by departCd
	</sql:query>
	<div class="container">
	<%--  w-75 : 가로길이의 75% 지정 --%>
	<table class="table table-bordered w-75" 
	       style="margin-left: auto; margin-right: auto;">
	    <tr>
	    	<th class="w-10">학과코드</th>
	    	<th class="w-10">학과명</th>
	    	<th class="w-10" colspan="2">비고</th>
	    </tr>

	    <c:forEach var="row" items="${rs.rows}">
	    	<tr>
	    		<td><c:out value="${row.departCd}"/></td>
	    		<td><c:out value="${row.departName}"/></td>
	    		<td colspan="2">
	    			<a href="departUpdate.jsp?departCd=<c:out value='${row.departCd}'/>">
	    				수정
	    			</a>
	    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    			<a href="departDelete.jsp?departCd=<c:out value='${row.departCd}'/>">
	    				삭제
	    			</a>
	    		</td>	    		
	    	</tr>	    
	    </c:forEach>   
	</table>
	</div>
</body>
</html>