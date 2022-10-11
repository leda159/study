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
	
<%@ include file="../includes/footer.jsp" %>	
</body>

<script>
	$(document).ready(function(){
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











