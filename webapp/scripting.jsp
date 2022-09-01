<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	
	<!-- 선언문: 자바 변수,메서드 선언시 사용 -->
	<%! int count = 3;
	
		/* 메서드 선언 */
		String makeItLower(String data){
			return data.toLowerCase();
		}
	%>
	
	
	<!-- 스크립틀릿태그 (자바소스가 들어감) 
		out.println: 화면에 출력할때 사용되는데 줄바꿈은 안된다. -->
	<%
		for(int i=1; i<= count; i++){
			out.println("Java Server Pages"+i+".<br>");
		}
	%>
	
	
	<!-- 표현문: 변수값을 출력하거나 메서드 호출시 사용 -->
	<%=makeItLower("Hello World")%>
	

</body>
</html>