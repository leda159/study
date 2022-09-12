<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkForm(){
		
		/* 유효성 검사:입력된 값이 조건에 맞게 잘 입력되었는지
		검사 */
		if(!document.frm.name.value){
			alert("이름을 반드시 입력하세요");
			return false;
		}
				
		document.frm.submit();
		
		//alert("이름은 " + document.frm.name.value + "입니다.");
	}
</script>
</head>
<body>
	<form name="frm">
		<p>이름:<input type="text" name="name">
		<input type="button" value="전송" 
		       onclick="checkForm();">
	</form>
</body>
</html>




