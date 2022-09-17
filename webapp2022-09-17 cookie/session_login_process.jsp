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
		request.setCharacterEncoding("utf-8");	
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String loginChk = request.getParameter("loginChk");
		
		if(id.equals("test") && passwd.equals("test1234")){ //id,pass 만족시키면 세션을 만든다  
			session.setAttribute("id", id);                     
			
			if(loginChk != null){//체크박스가 클릭됐다면 쿠키를 생성해서 유효시간 5분을 주고 클라이언트로 전송						
	
				Cookie cookie = new Cookie("userid",id);
				cookie.setMaxAge(5*60); 
				response.addCookie(cookie);
			}
			%>
			<script>
				alert("로그인 되었습니다.\n메인 페이지로 이동");
				location.href="session_main.jsp";
			</script>
	<% 
		}

	%>

</html>