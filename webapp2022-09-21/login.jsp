<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- bootstrap.min/css:부트스트랩 css파일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">


<!-- 유효성검사 -->
<script>
	function check(){
		if(!document.frm.id.value){
			alert("아이디를 입력하세요.");
			document.frm.id.focus();
			return false;
		}
		if(!document.frm.passwd.value){
			alert("비밀번호를 입력하세요.");
			document.frm.passwd.select();
			document.frm.passwd.focus();
			return false;
		}
		document.frm.submit();
	}
</script>

</head>
<body>
<div class="jumbotron">
	<div class="container">
		<h3 class="display-3">로그인</h3>
	</div>
</div>	

<form name="frm" action ="login_ok" method="post">
 <div style="text-align:left; margin-left:50px;">
	<div class="form-group row">
		<label class="col-sm-1">아이디</label>
		<div class="col-sm-0">
			<input type="text" name="id" class="form-control">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-1">비밀번호</label>
		<div class="col-sm-0">
			<input type="password"name="passwd" class="form-control">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2"></label>
		<div class="col-sm-6">
			<input type="button" value="로그인" onclick="check();">
		</div>
	</div>
 </div>
 
 


</form>
</body>
</html>