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
					게시판 수정
				</div>
				<div class="panel-body">
					<form role="form" action="/board/modify" method="post">
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
							<input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
						</div>
						<button type="submit" 
								data-oper="modify" 
								class="btn btn-primary">
							수정
						</button>
						<button type="submit" 
								data-oper="remove" 
								class="btn btn-danger">
							삭제
						</button>
						<button type="submit" 
								data-oper="list" 
								class="btn btn-info">
							목록
						</button>
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
		
		//3개의 버튼중 한개가 클릭되면
		$("button").on("click",function(e){
			
			//button클릭시 action 처리를 못하게 방지
			e.preventDefault();
			
			//클릭한 버튼의 값을 변수에 대입 
			var operation = $(this).data("oper");
			
			if(operation === "remove"){//삭제버튼클릭시
				formObj.attr("action","/board/remove");
			}else if(operation === "list"){//목록버튼클릭시
				formObj.attr("action","/board/list")
					   .attr("method","get");
				formObj.empty();
			}
			
			formObj.submit();
			
		});
	});	
</script>

</html>











