<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse:collapse; /* 선을붙힌다 */
		border:1px solid #000;
		width:300px;
	}
	tr,th,td{
		border:1px solid #000;
	}
</style>
</head>
<body>
	<%@ include file ="dbconn.jsp" %>
	
	<table width="300" border="1">
		<caption>고객 리스트</caption>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<%
			//ResultSet : select문을 실행할 값들을 가지고 있는 객체
			//rs : 참조 변수
		
		
			ResultSet rs = null;    //테이블에서 가져온 데이터를 ResultSet에 담는다
			PreparedStatement pstmt = null;
			
			
			try{
				String sql = "select * from guest ";
				pstmt = conn.prepareStatement(sql);
				
				//select문을 수행시 executeQuery를 사용한다
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String id = rs.getString("id");  //getString : 변수의 자료형태에 따라서 선언한다
					String pw = rs.getString("passwd");// ("passwd")  테이블의 컬럼명 이다
					String name = rs.getString("name");//("name") 테이블의 컬럼명 이다
		%>
		<tr>
			<td><%=id%></td>
			<td><%=pw%></td>
			<td><%=name%></td>
		</tr>
		<%
				}
			}catch(SQLException e){
				out.println("guest 테이블 호출이 실패했습니다.");
				out.println("SQLException:" + e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		%>
		
	</table>
</body>
</html>