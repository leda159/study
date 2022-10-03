<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="dbconn.jsp" %>  

<%
	
	String sdate = request.getParameter("sdate");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
    
    String sql = "select * from schedule where sdate = ?";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,sdate);
    rs = pstmt.executeQuery();
    
    if(rs.next()){ 
    	
	%>

<form action="schedule_update_insert.jsp" method="post">
<table border="1">
	<tr>
		<td colspan="2" align="center">스케줄수정 페이지</td>
	</tr>
	<tr>
		<td>회의일자:</td>
		<td><input type="text" name="sdate" value="<%=rs.getString("sdate")%>"></td>

	</tr>
	<tr>
		<td>제목:</td>
		<td><input type="text" name="title" value="<%=rs.getString("title")%>"></td>
	</tr>
	<tr>
		<td>내용:</td>
		<td><input type="text" name="content" value="<%=rs.getString("content")%>"></td>
	</tr>
	<tr>
		<td>장소:</td>
		<td><input type="text" name="location" value="<%=rs.getString("location")%>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="수정" >
		<input type="button" value="목록" onclick="location.href='list.jsp'">
		</td>
	</tr>
</table>
</form>

<%
    }
%>

</body>
</html>