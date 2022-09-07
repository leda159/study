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
		String[] fruits = 
		       request.getParameterValues("fruit");
	
		if(fruits != null){//과일을 선택한 경우
	%>
		<p>선택한 과일 <br>
	<%
		   for(String f : fruits){
			   out.println(f + " ");
		   }
		}else {//과일을 선택하지 않은 경우
			out.println("<script>");
			out.println("alert('과일을 선택하세요!')");
			out.println("location.href='form03.jsp'");
			out.println("</script>");
		}
	%>	
</body>
</html>





