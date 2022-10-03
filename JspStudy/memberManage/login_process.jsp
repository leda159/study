<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	
	<%
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		//로그인 사용자가 테이블에 존재하는지 체크 select : 검색 
		String sql = "select * from member where id = ? and passwd = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {  //true값이 리턴되면 테이블에 id가 있다는 의미
			session.setAttribute("sessionId",id);	//id존재 하면 세션을 생성한다.
			response.sendRedirect("menu.jsp");		//세션을 menu.jsp로 이동 시킨다.
		}else{			//false값이 리턴되면 테이블에 id가 없다는 의미	
			out.println("<script>");
			out.println("location.href='login.jsp'");//id가 없으면  login.jsp로 이동 시킨다.
			out.println("</script>");
		}
		
		
	%>
</body>
</html>






