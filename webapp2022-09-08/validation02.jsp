<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	//page 266
	function checkKey(){
		//ASCII 코드표에 있는 숫자 입력 체크
		if(!(event.keyCode >= 48 && 
			 event.keyCode <= 57)){
			alert("숫자만 입력 가능합니다.");
			event.returnValue = false;
		}
	}


	function checkLogin(){
		var form = document.loginForm;
		
		//기본 유효성 검사
		if(!form.id.value){
			alert("아이디를 입력하세요!");
			form.id.focus();
			return false;
		}else if(!form.passwd.value){
			alert("비밀번호를 입력하세요!");
			form.passwd.focus();
			return false;
		}
		
		//page 263
		
		if(form.id.value.length < 4 || 
		   form.id.value.length > 12){
		   alert("아이디는 4~12자 이내로 입력 가능합니다.");
		   return;
		}
		
		if(form.passwd.value.length < 4){
			alert("비밀번호는 4자 이상으로 입력해야 합니다.");
			form.passwd.select();
			return;
		}
		
		//page 265
		if(!isNaN(form.id.value.substring(0,1))){
			alert("아이디 첫째자리는 숫자로 시작할 수 없습니다!");
			form.id.select();
			form.id.focus();
			return;
		}
		
		//page 267
		for(i=0;i<form.id.value.length;i++){
			var ch = form.id.value.charAt(i);
			
			if((ch <'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9')){
				alert("아이디는 영문 소문자만 입력가능합니다!");
				form.id.select();
				return;
			}
			
		}
		
		
		form.submit();
	}
</script>
</head>
<body>
	<form name="loginForm" 
		  action="validation02_process.jsp" 
		  method="post">
		<p>아이디:<input type="text" name="id">
		<p>비밀번호:<input type="password" name="passwd">
		<p>나이:<input type="text" name="age"
		              onkeypress="checkKey();">
		<p><input type="button" value="로그인" 
		          onclick="checkLogin();"> 
	</form>
</body>
</html>




