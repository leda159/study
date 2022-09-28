<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../dbconn.jsp"%>
	
	<%
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		//로그인 사용자가 테이블에 존재하는지 체크
		String sql = "select * from member where id = ? and passwd = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {//테이블에 존재하는 사용자인 경우
			//아이디 세션 지정
			session.setAttribute("sessionId",id);
			response.sendRedirect("../menu.jsp");
		}else{//사용자가 없는 경우 로그인 화면으로 이동
			out.println("<script>");
			out.println("location.href='../login.jsp'");
			out.println("</script>");
		}
		
		
	%>
</body>
</html>






