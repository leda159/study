<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function checkValue(){
		//공백 ,null , nudefined(선언이 안되있는값)등 값을 체크
		if(!document.member.id.value){
			alert("아이디를 입력하세요.")
			//잘못된 값이 들어왔으므로 retrun 시킨다
			return false;
		}
		if(!document.member.name.value){
			alert("이름을 입력하세요.")
			return false;
		}
		if(!document.member.phone.value){
			alert("연락처를 입력하세요.")
			return false;
		}
		if($("input:radio[name='gender']").is(":checked")==false){
			alert("성별을 반드시 선택하세요!");
			return false;
		}
		/* input 태그중에서 타입이 체크박스중에서 이름이 hobby인거중에 체크가 하나도 안되어있으면 */
		if($("input:checkbox[name='hobby']").is(":checked")==false){
			alert("취미는 반드시 1개이상 선택하세요!");
			return false;
		}
		if(!document.member.greeting.value){
			alert("가입인사를 입력하세요.")
			//잘못된 값이 들어왔으므로 retrun 시킨다
			return false;
		}
		/* 최종적으로 서버로 입력값을 전송처리 */
		document.member.submit();
	}
</script>
</head>
<body>
<h3>회원가입</h3>
<form name="member" action="memberJoin_process.jsp" method="post">
	<div>
		<p>아이디:<input type="text" name="id" placeholder="아이디를 입력하세요.">
		<input type="button" value="아이디 중복검사">
		<p>비밀번호:<input type="password" name="pass">
		<p>이름:<input type="text" name="name">
		<p>연락처:<input type="text" name="phone">
		<p>성별:
			<input type="radio" name="gender" value="남자">남자
			<input type="radio" name="gender" value="여자">여자
		<p>취미:
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="영화">영화
			<p><textarea  name="greeting" rows="3" cols="30"></textarea>
			<p><input type="button" value="가입하기" onclick="checkValue();">
			<input type="reset" value="다시쓰기">	
	</div>
</form>
</body>
</html>