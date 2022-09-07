<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import = "java.io.*,java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</tr>
		<%
			request.setCharacterEncoding("utf-8");
		
			/* 열거형 인터페이스 */
			Enumeration paramNames = request.getParameterNames();
			
			/* hasMoreElements : 다음에 가져올 데이터가 있으면 true 없으면 false */
			while(paramNames.hasMoreElements()){
				/* 변수에 있는 다음값을 가져온다 */
				String name = (String) paramNames.nextElement();
				out.print("<tr><td>" +name+ "</td)\n");
				
				String paramValue = request.getParameter(name);
				out.println("<td>" +paramValue+ "</td></tr>\n");
			}
		%>
	</table>
</body>
</html>