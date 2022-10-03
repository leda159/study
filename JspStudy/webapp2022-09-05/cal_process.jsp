<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자바빈즈를 선언 -->
	<!-- 	id: 식별자 -->
	<!-- class: 식별자가 있는 위치 -->
	<!-- scope: 유효범휘 서버가 (request): respeons하기전까진 값이 유효하다 -->
	<jsp:useBean id="cal" class="bigdata.Cal" scope="request"/>
	
	<%
		/* 문자를 숫자로 변환 */
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		
		 PrintWriter out2 = response.getWriter();
		
		 /* jsp에서 화면에 출력하는 out 객체가 미리 존재하기 때문에 이름을 out2라고 선언함 */
		 /* printf를 사용하기위해서 선언함 */
		 /* cal.add(매개변수1,매개변수2): java클래스에있는cal이 실행되서 값을 받아서
		    cal.add(num1,num2)으로 받아와서 %,d에 대입된다 */
		out2.printf("%,d + %,d = %,d <br>",num1,num2,cal.add(num1,num2));
		out2.printf("%,d - %,d = %,d <br>",num1,num2,cal.minus(num1,num2));
		out2.printf("%,d * %,d = %,d <br>",num1,num2,cal.mul(num1,num2));
		out2.printf("%,d / %,d = %.1f <br>",num1,num2,cal.div(num1,num2));
					//%.1f : 소수점1이 나오도록 설정하는것
		/* %d : 숫자 변수값을 출력시 사용 */
		/* %s : 문자열 변수값을 출력시 사용 */
		/* %f : 소수점이 있는 실수 변수값을 줄력시 사용 */
		/* %,d : 천단위 콤마로 표시 */
	%>
	
</body>
</html>