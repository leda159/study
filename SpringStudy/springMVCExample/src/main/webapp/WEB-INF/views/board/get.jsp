<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게시판 내역</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					게시판 상세보기
				</div>
				<div class="panel-body">
						<div class="form-group">
							<label>번호</label>
							<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
						</div>  
						<div class="form-group">
							<label>제목</label>
							<input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content}"/></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label>
							<input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
						</div>
						<button data-oper="modify" class="btn btn-primary">수정</button>
						<button data-oper="list" class="btn btn-danger">목록</button>
						
						<form id="operForm" action="/board/modify" method="get">
							<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>
							<input type="hidden"  name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
							<input type="hidden"  name="amount" value='<c:out value="${cri.amount }"/>'>
							<input type="hidden"  name="keyword" value='<c:out value="${cri.keyword }"/>'>
							<input type="hidden"  name="type" value='<c:out value="${cri.type }"/>'>
						</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글기능 시작 -->
	<div class="row">
		<div class="col-lg-12">
			
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>댓글
				</div>
				
				<!-- /.panel-heading -->
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix data-rno='12'">
							<div>
								<div class="header">
									<strong class="primary-font">user00</strong>
									<small class="pull-right text-muted">2022-10-12</small>
								</div>
								<p>Good job!</p>
							</div>
						</li>
						<!-- end reply -->
					</ul>
					<!-- /.paner .chat-paner -->
				</div>
			</div>
		</div>
		<!-- /. end row -->
	</div>
	
<%@ include file="../includes/footer.jsp" %>	
</body>

<script type="text/javascript" src="/resources/js/reply.js"></script>

 
<!-- 자바스크립트를 이용한 등록처리 시작
<script>
	console.log("=========");
	console.log("JS TEST");
	
	//게시물 번호
	var bnoValue = '<c:out value="${board.bno}" />';
	
	replyService.add( //add:함수호출
		{reply:"자바스크립트이용 댓글처리",
		 replyer:"홍길동",
		 bno:bnoValue},
		 
		 function(result){
			 alert("RESULT:" + result);
		 }
	);
</script>
자바스크립트를 이용한 등록처리 끝 -->


<!-- 자바스크립트를 이용한 댓글 내역 시작
<script>
	console.log("=========");
	console.log("JS TEST");
	
	//게시물 번호
	var bnoValue = '<c:out value="${board.bno}" />';
	
		replyService.getList({bno:bnoValue, page:1}, function(list){
	
			for(var i = 0, len = list.length||0; i < len; i++){
				console.log(list[i]);	
			}	
		});
</script>
 자바스크립트를 이용한 댓글 내역 끝-->



<!-- 자바스크립트를 이용한 댓글 삭제 시작
<script>
	console.log("=========");
	console.log("JS TEST");
	
	//게시물 번호
	var bnoValue = '<c:out value="${board.bno}" />';
	
		//13번 댓글 삭제 테스트
		replyService.remove(13, function(count){
	
			console.log(count);
			if(count === "success"){
				alert("삭제");	
			}
		}, function(err){
			alert("에러");
		});
</script>
 자바스크립트를 이용한 댓글 삭제 끝-->
 
 
 
 
 <!-- 자바스크립트를 이용한 댓글 수정 시작 
<script>
	console.log("=========");
	console.log("JS TEST");
	
	//게시물 번호
	var bnoValue = '<c:out value="${board.bno}" />';
	
		
		replyService.update({
			rno: 13,
			bno: bnoValue,
			reply: "(수정)댓글"
		 },function(result){
			 alert("수정 완료");
		 });
</script>


<script>
	replyService.get(13,function(data){
		console.log(data);
	});
</script> 

  자바스크립트를 이용한 댓글 수정 끝-->
   

<script>
	$(document).ready(function(){
		
		//콘솔창에 객체를 보여준다 
		//replyService는 reply.js에 있다
		console.log(replyService);
		
		
		//p265
		var operForm = $("#operForm");
		
		
		
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/board/modify").submit();
		});
	
	
	
		//http://localhost:8080/board/list
		$("button[data-oper='list']").on("click",function(e){
			//remove() : 태그와 값을 모두 삭제처리
			//empty() : 태그는 그대로 두고 값만 삭제 처리
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list").submit();
		});
		
	});
</script>


</html>











