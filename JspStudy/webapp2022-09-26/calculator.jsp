<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkValue(){
		if(!document.frm.num1.value){
			alert("첫번째 수를 입력하세요.");
			document.frm.num1.select();
			document.frm.num1.focus();
			return false;
		}
		if(!document.frm.num2.value){
			alert("두번째 수를 입력하세요.");
			document.frm.num2.select();
			document.frm.num2.focus();
			return false;
		}
		if(document.frm.op.value == "/" && 
			document.frm.num2.value == 0){
			alert("분모는 0로 나눌수 없습니다 다시 입력하세요");
			document.frm.num2.select();
			document.frm.num2.focus();
			return false;
				}
		document.frm.submit();
	}
</script>
</head>
<body>
<form name="frm" action="calc" method="post">
	<p>값1:<input type="text" name="num1">
	<select name="op">
		<option selected>+</option>
		<option>-</option>
		<option>*</option>
		<option>/</option>
	</select>
	<p>값2:<input type="text" name="num2">
	<input type="button" value="계산" onclick="checkValue();"  >
	<input type="reset" value="초기화" >
</form>
</body>
</html>