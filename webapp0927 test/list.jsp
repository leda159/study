<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="dbconn.jsp" %> 
<h2>스케줄 리스트</h2>
	<input type="button" value="스캐줄등록" onclick="location.href='schedule_Join.jsp'">
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	<input type="button" value="메인메뉴" onclick="location.href='menu.jsp'">
	<p>
	
	
	
	
	<table style="width:500px;" border="1">
		<tr>
			<td>일자</td>
			<td>제목</td>
			<td>내용</td>
			<td>장소</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<tr>
	<%
	
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
    
    String sql = "select * from schedule";
    
    pstmt = conn.prepareStatement(sql);
    
    rs = pstmt.executeQuery();
    
    
    
    while(rs.next()){ 
    	
	%>
	
			<td><input type="text" name="sdate" value="<%=rs.getString("sdate")%>"></td>
			<td><input type="text" name="sdate" value="<%=rs.getString("title")%>"></td>
			<td><input type="text" name="sdate" value="<%=rs.getString("content")%>"></td>
			<td><input type="text" name="sdate" value="<%=rs.getString("location")%>"></td>
			<td><input type="button" value="수정" onclick="location.href='schedule_update.jsp?sdate=<%=rs.getString("sdate")%>'"></td>
			<td><input type="button" value="삭제" onclick="location.href='schedule_delete.jsp?sdate=<%=rs.getString("sdate")%>'"></td>
		</tr>
	
	<%
    	}
	%>
		</table>

</body>
</html>