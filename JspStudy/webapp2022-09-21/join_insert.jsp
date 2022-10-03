<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<%@ include file="dbconn.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email1= request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String emailList = request.getParameter("emailList");
	String birthdate = request.getParameter("birthdate");
	String postCd = request.getParameter("postCd");
	String addr = request.getParameter("addr");
	String addr2 = request.getParameter("addr2");
	
	PreparedStatement pstmt = null;
	
	try{
		
		String sql = "insert into member" +
					 "       values(?,?,?,?,?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setString(4,phone);
		pstmt.setString(5,email1);
		pstmt.setString(6,email2);
		pstmt.setString(7,birthdate);
		pstmt.setString(8,postCd);
		pstmt.setString(9,addr);
		pstmt.setString(10,addr2);
		pstmt.setString(11,emailList);
		
		pstmt.executeUpdate();
		out.println("member 테이블 삽입이 성공했습니다");
	%>
		<script>
			alert("회원가입 성공!");
			location.href="main.jsp"
		</script>	
	<% 
		
	}catch(SQLException e){
		out.println("member 테이블 삽입이 실패했습니다<br>");
		out.println("SQLException:"+e.getMessage());
	}finally{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
	}
		
		
		
	
%>
</body>
</html>