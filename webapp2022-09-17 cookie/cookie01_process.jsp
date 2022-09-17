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
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		
		if(user_id.equals("admin")&& user_pw.equals("1234")){
				//cookie_id,cookie_pw :참조변수 (클래스를 가르키고있어서 참조변수)
				//new Cookie(쿠키명,쿠키값)
				//쿠키생성
			Cookie cookie_id = new Cookie("userID",user_id);
			Cookie cookie_pw = new Cookie("userPW",user_pw);
			
			//서버가 클라이언트에게 응답처리시 http 헤더에 쿠키를 포함해서 클라이언트 브라우저에게 전송
			//쿠키정보를 매개변수(cookie_id)로 해서 클라이언트 브라우저에 전송
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			
			out.println("쿠키 생성이 성공했습니다.");
			out.println(user_id+"님 환영합니다");
		}else{
			out.println("쿠키 생성이 실패했습니다.");
		}
	%>
</body>
</html>