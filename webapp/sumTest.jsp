<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 선언문 -->
<%!
	public int totalSum(){ //totalSum()이라는 메서드
		int total = 0; //변수값 초기화
		
		for(int i=1; i<=100; i++){
			if(i % 2 == 0){ //i를2로 나누었을때 나머지가 0이면 --짝수
				total +=i;  //total = total + i (복합 대입연산자)
			}
		}
		return total; //total을 return한다
	}


%>


<!--  표현문  -->
1부터 100까지 짝수합 : <%=totalSum() %>
</body>
</html>