<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	PreparedStatement pstmt = null;
	
	try{
		
		//실행하려는 sql문을 선언
		String sql = 
				"insert into guest(id,passwd,name)"+
				"	    values(?,?,?)";
		
		pstmt = conn.prepareStatement(sql); //prepare:준비하다  sql : 위의 sql문장을 실행하기 위해서 
		pstmt.setString(1, id); //삽입하는 값이 문자열이라서 setString 이다.
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.executeUpdate(); //sql문 처리
		out.println("guest 테이블 삽입이 성공했습니다.");
	}catch (SQLException ex){
		out.println("guest 테이블에 삽입이 실패했습니다");
		out.println("SQLException:"+ex.getMessage());
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
%>
</body>
</html>