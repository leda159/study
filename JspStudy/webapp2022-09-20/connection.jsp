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
	<%
		//Connection : 데이터베이스와 연결 하는 객체를 선언
		//conn : 연결을 관리하는 변수
		Connection conn = null;
		
		try {//예외가 발생했을때 
			
			String url = "jdbc:mysql://localhost:3306/webmarketdb?serverTimezone=Asia/Seoul"; //8버전 부터는 webmarketdb?serverTimezone=Asia/Seoul 추가해야 함 
			String user = "koreashop"; 				//사용자명
			String password = "koreashop1234";		//비밀번호
			
			Class.forName("com.mysql.cj.jdbc.Driver"); //드라이브를 로딩시켜줌
			
			conn = DriverManager.getConnection(url,user,password); //데이터베이스와 연결
																	//DriverManager 클래스의 getConnection()메서드로 데이터 베이스와 연결
			
			out.println("데이터베이스 연결 성공");
			
			
		}catch(SQLException e){//예외가 발생했을떄 처리
			
			out.println("데이터베이스 연결 실패<br>");
			out.println("SQLException:" + e.getMessage());
			
		}finally{//반드시 실행하는 문장서언
			
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>





