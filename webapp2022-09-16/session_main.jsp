<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies = null; //배열 형태로 가져올 쿠키가 없다면
	
		cookies = request.getCookies(); //getCookies()메소드로 cookies를 가져온다
		
		
		if(cookies != null && cookies.length > 0){//쿠키정보가 있다면 해당 id와 userid가 같으면 세션을 생성한다
			for(Cookie c : cookies){
				if(c.getName().equals("userid")){
					session.setAttribute("id", c.getValue()); 
				}
			}
		}
		
		String id = (String)session.getAttribute("id");  // id 세션을 불러온다
		
		if(id == null || id.equals("")){//아이디가 null이거나 비어있으면 session_login 화면으로 간다
			response.sendRedirect("session_login.jsp"); 
		}else{// null이 아니면 밑쪽에 logout버튼이 만들어진다
	%>
		<h2>메인화면</h2>
		<b><%=id %>님 로그인 되었습니다.</b>
		<input type="button" value="로그아웃" onclick="location.href='session_logout.jsp'">
	<% 		
		}
		
	
	%>
</body>
</html>



