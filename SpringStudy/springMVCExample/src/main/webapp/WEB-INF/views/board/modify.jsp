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
			<h1 class="page-header">게시판 수정</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					게시판 수정하기
				</div>
				<div class="panel-body">
				<form role="form" action="/board/modify" method="post">
						<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}" />'>
						<input type="hidden" name="amount" value='<c:out value="${cri.amount}" />'>
						<input type="hidden" name="type" value='<c:out value="${cri.type}" />'>
						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}" />'>
						<div class="form-group">
							<label>번호</label>
							<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
						</div>  
						<div class="form-group">
							<label>제목</label>
							<input class="form-control" name="title" value='<c:out value="${board.title}"/>'>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="content"><c:out value="${board.content}"/></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label>
							<input class="form-control" name="writer" value='<c:out value="${board.writer}"/>'readonly="readonly">
						</div>
						<button type="submit" data-oper="modify" class="btn btn-primary">수정</button>
						<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
						<button type="submit" data-oper="list" class="btn btn-info">목록</button>
						</form>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../includes/footer.jsp" %>	
</body>

<script>
	$(document).ready(function(){
		
		//폼에 있는 모든값들을 변수에 대입
		var formObj = $("form");
		
		$('button').on("click",function(e){ //3개의 버든중 한개가 클릭되면 익명함수(이벤트)가 발생했을때
			
			e.preventDefault();//button클릭시 action 처리를 막는다
			
			var operation = $(this).data("oper");//클릭한 버튼을 알기위해 값을 변숭 ㅔ대입
			
			console.log(operation);
			
			if(operation === 'remove'){ //삭제를 클릭했으면
				formObj.attr("action","/board/remove"); //속성을 변경해서 "action","/board/remove"으로 간다
			}else if(operation === 'list'){//목록 버튼을 클릭하면
				//move to list
				//self.location = "/board/list"; //해당 위치로 이동한다
				
				//$("input[name='pageNum']") <  hidden으로 전달된값을  
				//.clone();   <  속성들을 복제한다  
				formObj.attr("action","/board/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				//empty() : 태그는 그대로 두고 값만 삭제 처리
				formObj.empty();
				//?뒤에 복제해준 속성값들을 추가한다.   < append
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			formObj.submit();
		});
	});
</script>


</html>











