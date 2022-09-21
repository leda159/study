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
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	
	//데이터베이스 정보를 select 하는 객체
	Statement stmt = null;
	
	try{
		String sql = "insert into guest(id,passwd,name) values('"+id+"','"+passwd+"','"+name+"')";
		
		//sql문장을 실행하도록 준비
		stmt = conn.createStatement();
		
		
		//sql문장중에서 insert , update , delete를 사용하는 경우에는 executeUpdate();를 사용해야 하고
		//select 구문을 사용하는 경우에는 executeQuery()를 사용해야 한다.
		stmt.executeUpdate(sql);
		out.println("guest 테이블 삽입이 성공했습니다");
		
		
	}catch (SQLException ex){ //데이터 베이스와 연동을할때 예외가 발생하는 Exception 
		out.println("guest 테이블 삽입이 실패했습니다<br>");
		out.println("SQLException:"+ex.getMessage()); //에러가 발생하면 에러에 메세지를 출력해주는 메소드
	}finally{
		if(stmt != null)
			stmt.close();  //열었으면 닫아줘야한다. close를 안해주면 heap메모리에 둥둥 떠다녀서 안된다.
		
		if(conn != null)
			conn.close();	
	}		
		
%>
</body>
</html>