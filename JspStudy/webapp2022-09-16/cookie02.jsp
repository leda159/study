<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	//getCookies(): 설정된 모든 쿠키정보를 배열형태로 리턴하는 메서드();
		//cookies.length: 생성된 cookies의 갯수
		Cookie[] cookies = request.getCookies();
	
			out.println("현재 설정된 쿠키의 개수 =>" + cookies.length + "<br>");
			out.println("=========================<br>");
			
			//getName(): 쿠키 이름을 가져온다.
			//getValue(): 쿠키 값을 가져온다.
			for(int i=0; i<cookies.length; i++){
				out.println("설정된 쿠키의 속성 이름["+i+"]:" + cookies[i].getName()+"<br>");
				out.println("설정된 쿠키의 속성 이름["+i+"]:" + cookies[i].getValue()+"<br>");
				out.println("=====================<br>");
			}
	%>
</body>
</html>