<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jquery 최신버전을 가져온다. -->
<script 
  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function checkNum(){
		//첫번째수에 값이 입력되지 않으면
		if($('#num1').val() == ''){
			alert("첫번째수를 입력하세요!");
			return;
		}
		
		if($('#num2').val() == ''){
			alert("두번째수를 입력하세요!");
			return;
		}
		
		//서버로 입력한 값을 전송처리
		frm.submit();
		
	}
</script>  
</head>
<body>
	<form name="frm" action="cal_process.jsp" method="post">
		<p>첫번째수:<input type="text" name="num1" id="num1">
		<p>두번째수:<input type="text" name="num2" id="num2">
		<p><input type="button" value="계산" onclick="checkNum()">
		
	</form>
</body>
</html>