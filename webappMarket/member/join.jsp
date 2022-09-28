<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<jsp:include page="../menu.jsp"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<script>
	function idCheck(){
		var id = document.newMember.id.value;
		var url = "confirmId.jsp?id=" + id;
		var openWin;
		
		openWin = window.open(
				url,
				"confirm",
				"toolbar=no,location=no,status=no,menubar=no,scrollbar=no,resizable=no,width=300,height=200"
			);
		
	}
</script>
<script>
	$(function(){
		$("#birthday").datepicker({
			changeMonth:true,
			changeYear:true,
			dateFormat:"yy-mm-dd",
			prevText:"이전 달",
			nextText:"다음 달",
			monthNames:['1월','2월','3월','4월',
						'5월','6월','7월','8월',
						'9월','10월','11월','12월'
				       ],
			monthNamesShort:['1월','2월','3월','4월',
							'5월','6월','7월','8월',
							'9월','10월','11월','12월'
					       ],
			dayNames:['일','월','화','수','목','금','토'],
			dayNamesShort:['일','월','화','수','목','금','토'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			showMonthAfterYear:true,
			yearSuffix:'년'
		});


	});
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                document.getElementById("postCd").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<%-- 타이틀 선언 --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
	
	<div class="container">
	
		<form name="newMember" action="./join_process.jsp" class="form-horizontal" 
		      method="post">
		    
		    <input type="hidden" name="retValue" id="retValue">
		    		      
			<div class="form-group row">
				<label class="col-sm-2 text-center">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id"  class="form-control">
				</div>
				<div class="col-sm-2">
					<input class="btn btn-primary" 
					       value="아이디중복체크"
					       onclick="idCheck();">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="passwd" name="passwd" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">연락처</label>
				<div class="col-sm-3">
					<input type="text" id="phone" name="phone" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">이메일</label>
				<div class="col-sm-3">
					<input type="text" id="email" name="email" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">생일</label>
				<div class="col-sm-3">
					<input type="text" id="birthday" name="birthday" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 text-center">우편번호</label>
				<div class="col-sm-6">
					<input id="postCd"
					       name="postCd" 
					       readonly="readonly"
					       class="col-sm-2" 
						   type="text" class="form-control">
					<i class="col-sm-5 fa fa-search" onclick="postSearch()" style="color:blue;font-size:30px;"></i>         
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">주소</label>
				<div class="col-sm-7">
					<input id="addr" name="addr" type="text" class="form-control" readonly="readonly"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-center">상세주소</label>
				<div class="col-sm-7">
					<input id="addr2" 
					       name="addr2" 
					       type="text" class="form-control"/>
				</div>
			</div>					

		    <div class="row">
				<div class="col-sm-5 offset-sm-5">
					<button class="btn btn-success" type="submit">가입 완료</button>
				</div>
			</div>	
		
		</form>
	</div>
</body>
</html>