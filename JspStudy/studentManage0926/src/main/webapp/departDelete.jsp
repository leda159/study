<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String departCd = request.getParameter("departCd");
	
		String sql = "select * from depart";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){//삭제하려는 사용자가 테이블에 존재
			sql = "delete from depart where departCd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,departCd);
			pstmt.executeUpdate();
		}else{
			out.println("일치하는 학과가 없습니다.");
		}
		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		//학과목록으로 이동
		response.sendRedirect("departList.jsp");
	%>
</body>
</html>