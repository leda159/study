<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		String id = request.getParameter("empno");
		String pass = request.getParameter("pass");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Context init = new InitialContext();
			
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			
			conn = ds.getConnection();
			
			String sql = "select * from member where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){//아이디가 테이블에 존재하면
				if(pass.equals(rs.getString("password"))){
					//정상적인 로그인 사용자에 대해
					//아이디 세션 속성을 생성
					session.setAttribute("id",id);
					
					out.println("<script>");
					out.println("location.href='main.jsp'");
					out.println("</script>");
					
				}
			}
			
			/* 로그인시 아이디가 존재하지 않으면 다시 로그인 화면으로 이동 */
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
</body>
</html>