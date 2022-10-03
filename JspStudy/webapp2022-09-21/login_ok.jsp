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
<%@ include file = "dbconn.jsp" %>


<%
	String id= request.getParameter("id");
	String passwd= request.getParameter("passwd");
	
	ResultSet rs =null;
	Statement pstmt = null;
	
	String session_id = "";
	String session_name = "";
	
	 
	
	
	 try{
		 String sql = "select * from member where id ='"+id+"' and passwd='"+passwd+"'";
		 pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery(sql);
		
		 
		 while(rs.next()){
		 	 session_id = rs.getString("id");
		 	 session_name = rs.getString("name");
		 
		
		 }
		 
		 if(!session_id.equals("")){ //세션 생성
				session.setAttribute("session_ID", session_id);
				session.setAttribute("session_NAME", session_name);
		 }
		 %>
		 <script>
		 	location.href="main.jsp"
		 </script>
		 
		 <% 
		 
	 }catch(SQLException e){
		 out.println("member 테이블 호출이 실패했습니다.");
		 out.println("SQLException:" + e.getMessage());
	 }finally{
		 if(rs != null) rs.close();
		 if(pstmt != null) pstmt.close();
		 if(conn != null) conn.close();
		 
	 }
	
%>
</body>
</html>