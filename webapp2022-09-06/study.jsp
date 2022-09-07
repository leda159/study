<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		float:left;
	}
</style>
<script scr="http://code.jquery.com/jquery-latest.min.js">

</script>
</head>
<body>
<% 
String hobbys[] = request.getParameterValues("hobby");

if(hobbys!=null){
	for(String data : hobbys){
		out.print(data);
	}
}

%>

</body>
</html>