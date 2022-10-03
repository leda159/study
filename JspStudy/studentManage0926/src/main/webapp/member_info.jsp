<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세보기</title>
<style>
	table {
		margin:auto;
		width:400px;
		border:1px solid gray;
		text-align:center;
	}
	
	.td_title {
		font-weight:bold;
		font-size:x-large;
	}
</style>
</head>
<body>
	<%
		String id = null;
	
		if((session.getAttribute("id") == null) ||
		   (!((String)session.getAttribute("id")).equals("admin"))){
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		}
		
		//member_list.jsp에서 선택된 아이디값을 변수에 대입
		String info_id = request.getParameter("id");
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		//select 문을 실행후 리턴되는 모든 행들을 가지고 있는 객체
		ResultSet rs = null;
		String sql;
		
		try {
			
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			
			conn = ds.getConnection();
			
			sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,info_id);
			rs = pstmt.executeQuery();
			
			rs.next();
					
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	<table>
		<tr>
			<td>아이디:</td>
			<td><%=rs.getString("id")%></td>
		</tr>
		<tr>
			<td>이름:</td>
			<td><%=rs.getString("name")%></td>
		</tr>
		<tr>
			<td>나이:</td>
			<td><%=rs.getString("age")%></td>
		</tr>
		<tr>
			<td>성별:</td>
			<td><%=rs.getString("gender")%></td>
		</tr>
		<tr>
			<td>이메일:</td>
			<td><%=rs.getString("email")%></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="member_list.jsp">리스트로 돌아가기</a>
			</td>
		</tr>						
		
	</table>
</body>
</html>