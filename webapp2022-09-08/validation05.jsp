<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkMember(){
		
		var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var regExpName = /^[가-힣]/;
		var regExpPasswd = /^[0-9]/;
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}/;
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}/i;
		
		var form = document.Member;
		
		var id = form.id.value;
		var name = form.name.value;
		var passwd = form.passwd.value;
		var phone = form.phone.value;
		var email = form.email.value;
		
		/* 정규표현식에 부합하는지 테스트를 해서 부합하면
		true 아니면 false 리턴 */
		if(!regExpId.test(id)){
			alert("아이디는 문자로 시작해주세요!");
			form.id.select();
			return;
		}
		
		if(!regExpPasswd.test(passwd)){
			alert("비밀번호는 숫자만 입력하세요!");
			form.passwd.select();
			return;
		}
		
		if(!regExpName.test(name)){
			alert("이름은 한글만 입력하세요!");
			form.name.select();
			return;
		}
		
		if(!regExpPhone.test(phone)){
			alert("연락처를 다시 입력하세요!");
			form.phone.select();
			return;
		}
		
		if(!regExpEmail.test(email)){
			alert("이메일을 다시 입력하세요!");
			form.email.select();
			return;
		}
		
		form.submit();
	}
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form action="validation05_process.jsp" name="Member" method="post">
		<p>아이디:<input type="text" name="id">
		<p>비밀번호:<input type="password" name="passwd">
		<p>이름:<input type="text" name="name">
		<p>연락처:<input type="text" name="phone">
		<p>이메일:<input type="text" name="email">
		<p><input type="button" value="가입하기" onclick="checkMember();">
	</form>
</body>
</html>



