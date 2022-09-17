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
		//모든 세션 정보 삭제 처리
		session.invalidate();
	
	
	
		//로그아웃시 쿠키정보를 삭제처리
		Cookie[] cookies = request.getCookies();
	
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("userid")){ //유저 아이디를 찾아서
					c.setMaxAge(0);        //0으로 한다
					response.addCookie(c);
				}
			}
		}
	%>
	<script>
		alert("로그아웃 되었습니다.");
		location.href="session_login.jsp";
	</script>
</body>
</html>



