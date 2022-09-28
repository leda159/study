<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
	//특정 게시물 번호에 대한 게시물 내역
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	//상세보기를 하려는 게시물 번호
	int num = ((Integer) request.getAttribute("num")).intValue();
	//현재 페이지 번호
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<title>게시판 관리</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form name="newUpdate"
			<%-- 수정 버튼을 클릭하면 수정하려는 게시물 번호와 
				 현재 페이지를 번호를 매개변수로 해서  
				 BoardUpdateAction.do url로 이동
			--%>
			action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
			class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" class="form-control"	value="<%=notice.getName()%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control"	value="<%=notice.getSubject()%>" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5"><%=notice.getContent()%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				 	<%-- 테이블에 있는 아이디 값 --%>	
					<c:set var="userId" value="<%=notice.getId()%>" />
					<%-- 게시물을 작성한 아이디와 로그인 아이디가 동일하면 --%>
					<c:if test="${sessionId==userId}">
						<p>
							<a	href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"	class="btn btn-danger">삭제</a> 
							<input type="submit" class="btn btn-success" value="수정">
					</c:if>
					<a href="./BoardListAction.do?pageNum=<%=nowpage%>"  class="btn btn-primary"> 목록</a>
				</div>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>