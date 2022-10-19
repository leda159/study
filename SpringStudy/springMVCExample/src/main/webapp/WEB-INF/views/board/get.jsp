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
							<input class="form-control" name="title" value='<c:out value="${board.bno}"/>' readonly="readonly">
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
						<button data-oper="modify" 
								class="btn btn-primary">
							수정
						</button>
						<button data-oper="list" 
								class="btn btn-danger">
							목록
						</button>
						
						<form id="operForm" action="/board/modify" method="get">
							<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
							<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>							
							<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
							<!-- page345 -->							
							<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
							<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
						</form>
												
				</div>
			</div>
		</div>
	</div>
	
	<!-- page 414 댓글 리스트 출력 시작 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>댓글
					<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글등록</button>
				</div>
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix" data-rno='12'>
							<div>
								<div class="header">
									<strong class="primary-font">user00</strong>
									<small class="pull-right text-muted">2022-10-12 16:20</small>
								</div>
								<p>Good Job!</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 리스트 출력 종료 -->
	<!-- p439  -->
	<div class="panel-footer">
	
	</div>
	
	<!-- p420 댓글입력 모달창 시작 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="muModalLabel">댓글 입력</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>댓글내용</label>
						<input class="form-control" name="reply" value="reply">
					</div>
					<div class="form-group">
						<label>댓글작성자</label>
						<input class="form-control" name="replyer" value="replyer">
					</div>
					<div class="form-group">
						<label>댓글작성일</label>
						<input class="form-control" name="replyDate" value="">
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalModBtn" type="button" class="btn btn-warning">댓글수정</button>
					<button id="modalRemoveBtn" type="button" class="btn btn-danger">댓글삭제</button>
					<button id="modalRegisterBtn" type="button" class="btn btn-success">댓글등록</button>
					<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>	
	</div>
	<!-- p420 댓글입력 모달창 종료 -->
	
	
<%@ include file="../includes/footer.jsp" %>	
</body>

<script src="/resources/js/reply.js"></script>

<script>

	//게시물 번호
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");//댓글 리스트 
	
	showList(1);//댓글 목록을 보여주는 함수
	
	function showList(page){
		
		replyService.getList({bno:bnoValue,page:page||1},function(replyCnt,list){
			
			var str = "";
			
			//댓글 목록이 없으면
			if(list == null || list.length == 0){
				replyUL.html("");
				
				return;
			}
			
			//댓글이 존재하면 
			for(var i=0;i<list.length;i++){
				str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str += "<div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
				str += "<small class='pull-right text-muted'>" + list[i].replyDate + "</small></div>";
				str += "<p>" + list[i].reply + "</p</div></li>";
			}
			
			//댓글내역 문자열을 댓글영역에 표시
			replyUL.html(str);
			
			//p441 댓글 페이징 표시 추가
			showReplyPage("",replyCnt);
			
		});
	}//
	
	//page422
	//모달창의 모든 정보를 변수에 대입
	var modal = $(".modal");
	
	//input 태그의 값을 변수에 각각 대입
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	//수정버튼 정보를 변수에 대입
	var modalModBtn = $("#modalModBtn");
	//삭제버튼 정보를 변수에 대입
	var modalRemoveBtn = $("#modalRemoveBtn");
	//등록버튼 정보를 변수에 대입
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	//댓글버튼 클릭 처리
	$("#addReplyBtn").on("click",function(e){
		
		//모든 input 태그 값을 초기화
		modal.find("input").val("");
		//댓글작성일 input 태그와 가장 가까운 div 안보이게 처리
		modalInputReplyDate.closest("div").hide();
		//닫기 버튼만 보여준다.
		modal.find("button[id != 'modalCloseBtn']").hide();
		//댓글 등록 버튼을 보여준다.
		modalRegisterBtn.show();
		
		//모달창을 보여준다.
		$(".modal").modal("show");
		
	});//
	
	//page440 댓글 페이징 처리
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	//댓글 페이징 처리
	function showReplyPage(flag,replyCnt){
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		//다음 페이지 존재하면
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		//이전 페이지 처리
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>이전</a></li>";
		}
		
		var active;
		
		for(var i=startNum;i<=endNum;i++){
			//현재 페이지 여부 체크하여 active 표시
			active = pageNum == i ? "active":"";
			
			if(flag == "inputFlag" && i == 1){
				active = "active";
				str += "<li class='page-item " + active + "'><a class='page-link' href='"+1+"'>" + 1 + "</a><li>"; 
			}else{
				str += "<li class='page-item " + active + "'><a class='page-link' href='"+i+"'>" + i + "</a><li>";
			}	
		}
		
		//다음 페이지 처리
		if(next){
			str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>다음</a></li>";
		}
		
		str += "</ul></div>";
		
		replyPageFooter.html(str);
		
	}//

	/* replyService.add(
			{reply:"자바스크립트이용 댓글처리",
			 replyer:"홍길동",
			 bno:bnoValue
			},
			function(result){
				alert("결과:" + result);
			}
	); */
	
	/* replyService.getList({bno:bnoValue,page:1},
			function(list){
				for(var i=0;i<list.length;i++){
					console.log(list[i]);
				}
	}); */
	
/* 	replyService.remove(13,function(count){
		
		console.log(count);
		
		if(count === "success"){
			alert("정상적으로 삭제");
		}
	},function(err){
		alert("에러 발생");
	}); */
	
	/* replyService.update({
		rno:2,
		bno:bnoValue,
		reply:"(수정)댓글"
	},function(result){
		alert("수정완료");
	}); */
	
/* 	replyService.get(11,function(data){
		console.log(data);
	}) */
	
	
</script>

<script>
	$(document).ready(function(){
		
		console.log(replyService);
		
		//p265
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click",function(){
			operForm.attr("action","/board/modify").submit();
		});
		
		//http://localhost:8080/board/list/get.jsp?bno=XX
		$("button[data-oper='list']").on("click",function(){
			//remove()?
			//태그와 값을 모두 삭제처리		
			//empty()?
			//태그는 그대로 두고 값만 삭제처리		
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list").submit();
		});
		
		//page423 신규 댓글 등록 버튼 처리
		modalRegisterBtn.on("click",function(e){
			
			//객체타입으로 입력값을 대입
			var reply = {
					reply:modalInputReply.val(),
					replyer:modalInputReplyer.val(),
					bno:bnoValue
			};
			
			replyService.add(reply,function(result){
				
				alert(result);
				
				//댓글 등록후 화면 클리어
				modal.find("input").val("");
				modal.modal("hide");
				
				//댓글 목록 첫페이지로 이동
				showList(1);
						
				showReplyPage("inputFlag",1);
				
			});
		});
		
		//p425 특정 댓글 클릭시 댓글 내용을 모달창에 출력
		$(".chat").on("click","li",function(e){
			//클릭한 댓글번호를 변수에 대입
			var rno = $(this).data("rno");
			//reply.js 파일을 이용하여
			//특정 댓글 내역을 가져와서 모달창에 출력
			replyService.get(rno,function(reply){
				
				modalInputReply.val(reply.reply);//모달창 댓글내용
				modalInputReplyer.val(reply.replyer);//모달창 댓글작성자
				modalInputReplyDate.val(reply.replyDate).attr("readonly","readonly");//모달창 댓글입력일자
				modal.data("rno",reply.rno);//모달창 댓글번호
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();//수정버튼 보여주기
				modalRemoveBtn.show();//삭제버튼 보여주기
				
				$(".modal").modal("show");//모달창 보여주기

			});
		});
		
		//p427 특정 댓글 수정 버튼 클릭 처리
		modalModBtn.on("click",function(e){
			
			//reply 객체 타입으로 선언
			var reply = {rno:modal.data("rno"),
						 reply:modalInputReply.val()
						};
			
			replyService.update(reply,function(result){
				alert(result);
				//수정처리후 모달창 닫기
				modal.modal("hide");
				//댓글리스트로 이동
				showList(pageNum);
			})
		});//
		
		//특정댓글 삭제버튼 클릭 처리
		modalRemoveBtn.on("click",function(e){
			
			//모달창의 댓글번호를 변수에 대입
			var rno = modal.data("rno");
			
			replyService.remove(rno,function(result){
				alert(result);
				modal.modal("hide");
				
				showList(pageNum);
			});
		});//
		
		//p441 댓글 페이징 번호 클릭시 처리
		replyPageFooter.on("click","li a",function(e){
			
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			
			pageNum = targetPageNum;
			
			showList(pageNum);
			
		});
		
		

	});	
</script>

</html>











