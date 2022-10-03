<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 아이콘 사용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- bootstrap.min/css:부트스트랩 css파일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">


<!-- datePicker선언 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<!-- 이메일 선택 -->
<script>
	function checkEmail(){
		if(document.frm.emailList.value !=""){
			document.frm.email2.value = document.frm.emailList.value;
		}else{
			document.frm.email2.value="";
			document.frm.email2.focus();
		}
	}
</script>


<!-- 유효성 검사 -->
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
		if(!document.frm.name.value){
			alert("이름을 입력하세요.");
			document.frm.name.select();
			document.frm.name.focus();
			return false;
		}
		if(!document.frm.phone.value){
			alert("연락처를 입력하세요.");
			document.frm.phone.select();
			document.frm.phone.focus();
			return false;
		}
		if(!document.frm.email1.value){
			alert("이메일 입력하세요.");
			document.frm.email1.select();
			document.frm.email1.focus();
			return false;
		}
		
		document.frm.submit();
	}
</script>

<script>
<!-- datePicker 선언 -->
	$(function(){
		$("#birthdate").datepicker({ //클릭을하면 달력이 나온다
			changeMonth:true,
			changeYear:true,
			dateFormat:"yy-mm-dd",
			prevText:"이전 달",
			nextText:"다음 달",
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			minDate: new Date('1930-01-01'),
			maxDate: new Date('2030-12-31'),
			
			dayNames:['일','월','화','수','목','금','토'],
			dayNamesShort:['일','월','화','수','목','금','토'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			showMonthAfterYear:true,
			yearSuffix:"년"
		});
	});
</script>



<!-- 우편번호 API를 사용 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function postSearch() {
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr2").value = extraAddr;
                
                } else {
                    document.getElementById("addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCd').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
        
    }
</script>
</head>
<body>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">회원가입</h1>
	</div>
</div>

<form name="frm" action ="join_insert.jsp" method="post">
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
		<label class="col-sm-1">이름</label>
		<div class="col-sm-0">
			<input type="text" name="name" class="form-control">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-1">연락처</label>
		<div class="col-sm-0">
			<input type="text"name="phone" class="form-control">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-1">이메일</label>
		<div class="col-sm-11 form-group row ">
			<input class="col-sm-2 form-control" type="text" id="email1" name="email1" value="" placeholder="메일을 입력해주세요."> @
			<input class="col-sm-2 form-control" type="text" id="email2" name="email2" value="" >
			
			<select class="col-sm-2 form-control" id="emailList" name="emailList" onchange="return  checkEmail()">
				<option value="">==선택==</option>
				<option value="">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="nate.com">nate.com</option>
				<option value="google.com">google.com</option>
			</select>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-1">생일</label>
		<div class="col-sm-0">
			<input type="text" id="birthdate" name="birthdate" class="form-control">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-1">우편번호</label>
		<div class="col-sm-3 row">
			<input type="text" id="postCd" name="postCd" class="col-sm-6 form-control" readonly="readonly">
			<i class="col-sm-4 fa fa-search" onclick="postSearch();" style="color:blue; font-size:30px;"></i>       
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-1" >주소</label>
		<div class="col-sm-0">
			<input style="width:350px" type="text" id="addr" name="addr" class="form-control"/>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-1">상세 주소</label>
		<div class="col-sm-0">
			<input style="width:350px"  type="text" id="addr2" name="addr2" class="form-control"/>
		</div>
	</div>
	<input type="button" value="회원가입" onclick="check();">
 </div>	
</form>

</body>
</html>