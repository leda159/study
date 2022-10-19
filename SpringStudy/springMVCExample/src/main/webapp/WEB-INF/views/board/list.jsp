<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//bf cache 중지 처리
	response.setHeader("Cache-Control",
			           "no-cache,no-store");
    response.setHeader("Pragma","no-cache");//캐시 저장 안함
    //캐시 유효시간 없애기
    response.setDateHeader("Expires",-1);

%>


<%@ include file="../includes/header.jsp" %>
	
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판 리스트</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시판 목록
                            <button id="regBtn" type="button" class="btn btn-success btn-xs pull-right">게시물등록</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataList">
                                <thead>
                                    <tr>
                                        <th class="text-center">게시물번호</th>
                                        <th class="text-center">제목</th>
                                        <th class="text-center">작성자</th>
                                        <th class="text-center">작성일</th>
                                        <th class="text-center">수정일</th>
                                    </tr>
                                </thead>
                                
                                <c:forEach var="board" items="${list}">
                                	<tr>
                                		<td class="text-center"><c:out value="${board.bno}"/></td>
                                		<td class="text-center"><a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/>&nbsp;&nbsp;<b>[<c:out value="${board.replyCnt}"/>]</b></a></td>
                                		<td class="text-center"><c:out value="${board.writer}"/></td>
                                		<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                		<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>
                                	</tr>	                 		               
                                </c:forEach>
                            </table>
                            
                            <!-- page 340 검색처리 추가 -->
                            <div class="row">
                            	<div class="col-lg-12">
                            		<form id="searchForm" action="/board/list" method="get">
                            			<select name="type">
                            				<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected': ''}"/>>--</option>
                            				<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected': ''}"/>>제목
                            				<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected': ''}"/>>내용</option>
                            				<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected': ''}"/>>작성자</option>
                            				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected': ''}"/>>제목 or 내용</option>
                            				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected': ''}"/>>제목 or 작성자</option>
                            				<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected': ''}"/>>제목 or 내용 or 작성자</option>
                            			</select>
                            			<input type="text" name="keyword" value='${pageMaker.cri.keyword}'/>
                            			<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
                            			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                            			<button class="btn btn-primary">조회</button>
                            		</form>
                            	</div>
                            </div>
                            
                        	<!-- page308 페이징 처리 시작 -->
                        	<div class="pull-right">
                        		<ul class="pagination">
                        			<c:if test="${pageMaker.prev}">
                        				<li class="paginate_button previous">
                        					<a href="${pageMaker.startPage - 1}">이전</a>
                        				</li>
                        			</c:if>
                        			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        				<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}">
                        					<a href="${num}">${num}</a>
                        				</li>
                        			</c:forEach>
                        			<c:if test="${pageMaker.next}">
                        				<li class="paginate_button next">
                        					<a href="${pageMaker.endPage + 1}">다음</a>
                        				</li>
                        			</c:if>
                        		</ul>
                        	</div>
                        	<!-- page308 페이징 처리 종료 -->
                        	
                        	<!-- page311 현재페이지번호와 보여지는 행수를 hidden 처리 -->
                        	<form id="actionForm" 
                        		  action="/board/list"
                        		  method="get">
                        		  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                        		  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                        		  <!-- 
                        		  	p344 페이지번호 클릭시 검색조건,문자열 전달 
                        		  -->
                        		  <input type="hidden" name="type" value="${pageMaker.cri.type}">
                        		  <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                        		  
                        	</form>
                        	
                        
                    <!-- modal(모달)창 시작 10.07 -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    	<div class="modal-dialog">
                    		<div class="modal-content">
                    			<div class="modal-header">
                    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    					&times;
                    				</button>
                    				<h4 class="modal-title" id="myModalLabel">Modal Title</h4>
                    			</div>
                    			<div class="modal-body">
                    				처리가 완료되었습니다.
                    			</div>
                    			<!--  data-dismiss="modal" : 모달창을 close -->
                    			<div class="modal-footer">
                    				<button type="button" class="btn btn-default" data-dismiss="modal">
                    					Close
                    				</button>
                    				<button type="button" class="btn btn-primary" data-dismiss="modal">
                    					Save Changes
                    				</button>
                    			</div>
                    		</div>
                    	</div>
                    </div>    
                    <!-- modal(모달)창 종료 10.07 -->
                        
                        
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
 
<%@ include file="../includes/footer.jsp" %>
 
 <script>
 	$(document).ready(function(){
 		$("#dataList").DataTable({
 			"paging":false,
 			"ordering":false,
 			"info":false,
 			"searching":false,
 			responsive: true
 		});
 		
 		$(".sidebar-nav").attr("class","sidebar-nav navbar-collapse collapse")
		 .attr("aria-expanded","false")
		 .attr("style","height:1px");
 		
 		//신규 게시물 등록시 입력되는 게시물번호 가져오기
 		var result = '<c:out value="${result}"/>';
 		
 		checkModal(result);
 		//history.replaceState?
		//history 객체의 이전 주소값을 새로운 url로 지정
		//첫번째 매개변수:history state에 저장할 데이터
		//두번째 매개변수:제목
		//세번째 매개변수:새로운 url 주소
 		history.replaceState({},null,null);
 		
 		function checkModal(result){

 			//history.state?
 			//history 객체의 stack의 top에 있는 상태값
 			//을 리턴
 			//게시물번호가 없으면
 			if(result === '' || history.state){
 				return;
 			}
 			
 			//현재 입력되는 게시물 번호를 모달창에 표시
 			if(parseInt(result) > 0){
 				$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");		
 			}
 			
 			//모달창 보여주기
 			$("#myModal").modal("show");
 			
 		}
 		
 		//게시물 등록 버튼 클릭 처리 10.07
 		$("#regBtn").on("click",function(){
 			self.location = "/board/register";	
 		});
 		
 		//page312
 		var actionForm = $("#actionForm");
 		
 		$(".paginate_button a").on("click",function(e){
 			e.preventDefault();//a태그 원래 처리부분을 막는다.
 			
 			//pageNum 속성값에 클릭한 현재 페이지번호를 대입
 			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
 			actionForm.submit();
 		});
 		
 		//page 315 a태그 클릭 처리
 		$(".move").on("click",function(e){
 			e.preventDefault();
 			
 			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
 			actionForm.attr("action","/board/get").submit();
 			
 		});
 		
 		//p342 검색화면 유효성 검사
 		var searchForm = $("#searchForm");
 		
 		$("#searchForm button").on("click",function(e){
 			
 			if(!searchForm.find("option:selected").val()){
 				alert("검색종류를 선택하세요!");
 				return false;
 			}
 			
 			if(!searchForm.find("input[name='keyword']").val()){
 				alert("키워드를 입력하세요!");
 				return false;
 			}
 			
 			searchForm.find("input[name='pageNum']").val("1");
 			
 			e.preventDefault();
 			
 			searchForm.submit();
 		});
 		
 	});
 </script>
 
 
 
 
 
 
 
 
    