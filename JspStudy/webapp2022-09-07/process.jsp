<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");	 %>


	<p>독서 : <%=request.getParameter("reading") %>
	<p>운동 : <%=request.getParameter("exercise") %>
	<p>영화 : <%=request.getParameter("movie") %>
	
	<h2>체크박스 선택 내용 출력</h2>
	
	<% 
	/* request.getParameterValues : 취미속성에서 선택한 값을 문자열 배열에 대입 */
	
	String[] hobbys = request.getParameterValues("hobby");
		out.println("선택한 취미:");
	
		for(String data : hobbys){
			out.println(data + " ");
		}
	%>
	
</body>
</html>