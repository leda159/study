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
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String greeting = request.getParameter("greeting");
		
		String hobbys[] = request.getParameterValues("hobby");
		
		
		out.println("아이디:"+id+"<br>");
		out.println("비밀번호:"+pass+"<br>");
		out.println("이름:"+name+"<br>");
		out.println("연락처:"+phone+"<br>");
		out.println("성별:"+gender+"<br>");
		
		
		if(hobbys!=null){ //취미를 선택했으면
			for(String data : hobbys){
				out.print(data);
			}
		}
		
		out.println("가입인사:"+greeting+"<br>");
		
		
		
		
	%>
	

	
</body>
</html>