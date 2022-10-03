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
	
		/* 문자열 배열 선언 */
		String hobbys[] = 
		       request.getParameterValues("hobby");
		
		out.println("선택하신 취미는 : ");
		
		/* 향상된 for문 */
		for(String value : hobbys){
			out.print(value + " ");
		}
		
	%>
</body>
</html>





