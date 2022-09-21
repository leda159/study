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
	<%@ include file="dbconn.jsp"%>
	<%
	
		request.setCharacterEncoding("utf-8");
	
		// 성적 삭제
		int sno = Integer.parseInt(request.getParameter("sno"));
	
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from score" +   //삭제한다
			             "       where sno = ?"; //sno가 ? 인것을
			
			pstmt = conn.prepareStatement(sql);
			
 			pstmt.setInt(1,sno); //sno값을 ?에 대입하고
 	
			
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("alert('정상적으로 성적 삭제')");
			out.println("</script>");
 			
		}catch(SQLException e){
			out.println("<script>");
			out.println("alert('정상적으로 성적 삭제 실패')");
			out.println("</script>");
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>




