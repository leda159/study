<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("id");
		String password = request.getParameter("passwd");
		
		/* String 객체의 값을 비교시 반드시 equals 메서드를 사용한다 */
		/* ==는 주소값을 비교한다 */
		if(userid.equals("관리자") && password.equals("1234")){
			//강제로 다른 jsp로 이동시킨다
			response.sendRedirect("response01_success.jsp");
		}else{
			response.sendRedirect("response01_failed.jsp");
		}
	%>
</body>
</html>