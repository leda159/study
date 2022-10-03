<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function checkValue(){
		var id = document.getElementById("id").value;
		var passwd = document.getElementById("passwd").value;
		
		if(!id){// !는 공백,null,undefined등 체크함
			alert("아이디를 입력하세요!");
			return false;
		}
		if(!passwd){
			alert("비밀번호를 입력하세요!");
			return false;
		}
		//입력 받은 아이디 값을 검색하기 위해 정규식 선언
		var reg = new RegExp(id,'i');
		
		
		//입력받은 비밀번호 문자열에 아이디 문자열이 포함되어있으면 true 아니면 false
		if(reg.test(passwd)){
			alert("비밀번호는 아이디를 포함할 수 없습니다!");
			return false;
		}
		
		/* if(passwd.indexOf(id) > -1){
			alert("비밀번호는 아이디를 포함할 수 없습니다!");
			return false;
		} */
		
		document.frm.submit();
	}
</script>
<body>
	<form name="frm" action="validation_process.jsp" method="post">
		<p>아이디:<input type="text" id="id" name="id">
		<p>비밀번호:<input type="password" id="passwd" name="passwd">
		<input type="button" value="로그인" onclick="checkValue();">
	</form>
</body>
</html>