<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* Enumeration?
		순환 인터페이스로 스레드에 안전한 구조로 사용되며
		Iterator 인터페이스의 하위 버전으로 데이터를 삭제
		하는 기능은 없다. */
		
		/* getHeaderNames ?
		F12 개발자모드에서 볼 수 있는 모든 헤더정보를 가져와서
		변수에 대입 */
		Enumeration en = request.getHeaderNames();
	
		//다음에 가져올 데이터가 있으면 true 없으면 false
		while(en.hasMoreElements()){
			//다음 헤더 속성을 가져온다.
			String headerName = (String)en.nextElement();
			//헤더에 대한 값을 가져온다.
			String headerValue = request.getHeader(headerName);
	%>
	<%=headerName%> : <%=headerValue%><br>
	<%
		}
	%>	
</body>
</html>


