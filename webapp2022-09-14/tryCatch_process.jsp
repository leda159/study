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
		try{
			String num1 = request.getParameter("num1");
			String num2 = request.getParameter("num2");
			int a= Integer.parseInt(num1);
			int b= Integer.parseInt(num2);
			int c= a/b;
			out.print(num1 + "/" + num2 + "=" +c);
			
		} catch(NumberFormatException e){ //NumberFormatException ? 숫자가 입력되어야 하는데 문자같은 값이 입력되는 경우 발생하는 예외
			RequestDispatcher dispatcher = request.getRequestDispatcher("tryCatch_error.jsp");  //RequestDispatcher? 클라이언트의 요청에 대해서 특정 페이지로 제어권을 넘기는 역할을 한다
			dispatcher.forward(request,response);
		
		}catch(ArithmeticException e){ //분모를 0으로 나눈 경우 예외 발생
			RequestDispatcher dispatcher = request.getRequestDispatcher("ExceptionArithmetic.jsp");  //RequestDispatcher? 클라이언트의 요청에 대해서 특정 페이지로 제어권을 넘기는 역할을 한다
			dispatcher.forward(request,response);
		}
	%>
</body>
</html>