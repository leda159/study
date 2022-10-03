<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %> <!-- impor:사용하겠다고 선언함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%   
	/* request:내장객체 getParameter:메서스 */
	/* Integer.parseInt:메서드(문자를 숫자로 변환처리 기능) */

	int width = Integer.parseInt(request.getParameter("width"));
	int height = Integer.parseInt(request.getParameter("height"));
	
	
	 /* 출력방법1 */
	 PrintWriter out2 = response.getWriter();
	 out2.printf("가로%,d , 세로%,d인 사각형 면적은%,d입니다.<br>",width,height,width*height);
	 
	 
	 /* 출력방법2 */
	 out.println("가로"+width+"이고"+"세로"+height+"인 사각형의 면적은"+width*height+"입니다.");
%>
</body>
</html>