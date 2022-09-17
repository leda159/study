<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 
//session_login.jsp
//session_login_process.jsp
//session_main.jsp
//session_logout.jsp

-------------쿠키문제-------------------------------------
빅데이터_B > jsp > 수업자료 폴더에 있는
쿠키문제.jpg 

session_login.jsp
session_login_process.jsp
-아이디가 test가 아니면 아이디가 없습니다 경고창
-비밀번호가 test1234가 아니면 비밀번호 오류 경고창
-아이디가 test이고 비밀번호가 test1234이면
 로그인 되었습니다. 경고창 표시후 session_main.jsp로
 이동


-로그인상태유지 버튼 클릭시 
 쿠키를 생성(userid) 하고 쿠키 유효시간 5분 적용

session_main.jsp
출력화면
메인페이지
XXX님이 로그인 했습니다. 로그아웃 버튼 표시
- 로그아웃 버튼 클릭시 session_logout.jsp로 이동
- 로그인 상태유지 체크박스를 클릭한 경우에는
  session id 속성을 쿠키정보(userid)로 생성하고
  로그인 상태유지 체크박스를 클릭하지 않은 경우에는
  session id 속성을 입력한 id값으로 지정


session_logout.jsp
-쿠키의 유효시간을 0로 지정
-로그아웃 되었다는 경고창 표시후 session_login.jsp로 이동 -->



<script>
	function checkValue(){
		if(!document.frm.id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if(!document.frm.passwd.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if(document.frm.id.value!="test"){ //  !=  :  아니면
			alert("아이디가 존재하지 않습니다!");
			return false;
		}
		
		if(document.frm.passwd.value!="test1234"){
			alert("비밀번호 오류!");
			return false;
		}
		document.frm.submit();
	}
</script>
</head>
<body>


	<%
		//쿠키정보(userid)가 존재하면 session_main.jsp로 바로 이동된다.
		Cookie[] cookies = request.getCookies(); //설정 되어있는 쿠키값을 모두 가져온다
		
		//향상된for문으로 배열에서 하나하나 가져와서 왼쪽에 있는 c변수에 담는다
		for(Cookie c : cookies){
			if(c.getName().equals("userid")){ //userid이면
				response.sendRedirect("session_main.jsp"); //주소로 바로 이동
			}
		}
		
	%>
	

	<form name="frm" action="session_login_process.jsp" method="post">
		<p>아이디:<input type="text" name="id">
		<p>비밀번호:<input type="password" name="passwd">
		<p><input type="checkbox" name="loginChk">로그인 상태유지<br>
		<input type="button" value="로그인" onclick="checkValue();"> 
		<!-- 유효성 검사를 해야하기때문에 button을 한다 -->
	</form>
</body>
</html>





















