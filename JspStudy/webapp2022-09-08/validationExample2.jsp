<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm() {
		//var form = document.getElementById("frm");
		var name = document.getElementById("name").value;
		alert("이름은 " + name + "입니다.");
	}
</script>
</head>
<body>
	<form id ="frm">
		<p>이름:<input type="text" name="name" id="name">
		<input type="submit" value="전송" 
			   onclick="checkForm();">
	</form>
</body>
</html>



