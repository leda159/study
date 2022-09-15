<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>-----세션을 삭제하기 전-----</h4>
	<%
		//세션 속성값을 지정
		session.setAttribute("userID", "test");
		session.setAttribute("userPW", "test1234");
	
		//세션 속성값을 가져온다.	
		String user_id = (String)session.getAttribute("userID");
		String user_pw = (String)session.getAttribute("userPW");
		
		out.println("설정된 세션 이름 userID:" + user_id + "<br>");
		out.println("설정된 세션 이름 userPW:" + user_pw + "<br>");
		
		//isRequestedSessionIdValid() : 현재 세션이 유효한지 확인하는 메소드 
		// 유효하면 true 유효하지않으면 false
		if(request.isRequestedSessionIdValid() == true){
			out.print("세션이 유효합니다.");
		}else{
			out.print("세션이 유효하지 않습니다.");
		}
		
		session.invalidate();
	%>
	<h4>-----세션을 삭제한 후-----</h4>
	<%
		if(request.isRequestedSessionIdValid() == true){
			out.print("세션이 유효합니다.");
		}else{
			out.print("세션이 유효하지 않습니다.");
		}
	%>
	
</body>
</html>








