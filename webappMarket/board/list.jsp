<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");

    ArrayList boardList = null;
	boardList = (ArrayList) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue(); 
  
	if(sessionId == null){
		out.println("<script>");
		out.println("location.href = './member/loginMember.jsp'");
		out.println("</script>");
	}

    if (boardList == null || boardList.size() == 0){
		out.println("<script>");
		out.println("location.href = './BoardWriteForm.do'+sessionId");
		out.println("</script>");
	}
  
%>
<html>
<head>
<title>게시판 관리</title>
<script type="text/javascript">
	function checkForm() {	
		
		if (${sessionId == null}) {
			alert("로그인 해주세요.");
			location.href = './member/login.jsp';
		}else{
			location.href = "./BoardWriteForm.do?id=<%=sessionId%>";
		}
	}
</script>
<style>
	body {
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div align="left">
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp; 
						<select name="items" class="txt">
								<option value="subject">제목에서</option>
								<option value="content">본문에서</option>
								<option value="name">글쓴이에서</option>
						</select>
						<input name="text" type="text" />&nbsp;&nbsp;&nbsp;
						<input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
						</td>
						<td width="100%" align="right">
							<a href="#" onclick="checkForm(); return false;" class="btn btn-warning">글쓰기</a>
						</td>
					</tr>
			</div>		
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 <%=total_record%>건	</span>
				</div>
			</div>
			<div style="padding-top:20px">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성일</th>
						<th class="text-center">조회</th>
						<th class="text-center">글쓴이</th>
					</tr>
					<%
						if(boardList != null){	
					
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);
					%>
					<tr class="text-center">
						<td class="text-center"><%=notice.getNum()%></td>
						<td class="text-center"><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<%-- <td class="text-center"><%=notice.getRegdate()%></td> --%>
						<td>
          					<fmt:formatDate value="<%=notice.getRegDate()%>" pattern="yyyy-MM-dd E요일 a hh:mm:ss"/>
						</td>
						<td class="text-center"><%=notice.getHit()%></td>
						<td class="text-center"><%=notice.getName()%></td>
					</tr>
					<%
						 }
					}
					%>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>

							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>