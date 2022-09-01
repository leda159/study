
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- Scanner클래스를 사용하기 위해 선언 -->
<%@page import="java.util.Scanner" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 선언문 -->
<%!
	/* 사각형 면적을 구하는 메서스 선언 */
	/* calcRectangle:함수  width,heigt:매개변수 */
	public int calcRectangle(int width,int height){
		return width * height;
	}
%>

<!-- 스크립틀릿 -->
<%
	Scanner s= new Scanner(System.in);

	System.out.print("가로:");
	int width = s.nextInt(); //숫자를 받을땐 s.nextInt();
							 //문자를 받을땐 s.next();
							
	System.out.print("세로:");
	int height = s.nextInt(); 
	
	out.println("가로"+width+"이고"+"세로"+height+"인 사각형의 면적은"+calcRectangle(width,height));
%>
</body>
</html>