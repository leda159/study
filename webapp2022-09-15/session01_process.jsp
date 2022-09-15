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
		
		if(user_id.equals("admin") && user_pw.equals("1234")){
			//session속성을 생성한다
			//브라우저가 변경되기 전까지 혹은 session정보를 삭제하기 전까지는 유지된다
			session.setAttribute("userID", user_id);
			session.setAttribute("userPW", user_pw);
			
			out.println("세션 설정이 성공했습니다.<br>");
			out.println(user_id+"님 환영합니다.<br><br>");
			
			
			
			
			//생성된 세션값을 가져온다
			user_id = (String)session.getAttribute("userID");
			user_pw = (String)session.getAttribute("userPW");
			
			out.println("설정된 세션의 속성 값[1]:" + user_id +"<br>");
			out.println("설정된 세션의 속성 값[2]:" + user_pw +"<br>");
			
		
		}else{
			out.println("세션 설정이 실패했습니다");
		}
		
		
		
	%>
</body>
</html>