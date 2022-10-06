<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                		<td class="text-center"><c:out value="${board.title}"/></td>
                                		<td class="text-center"><c:out value="${board.writer}"/></td>
                                		<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                		<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>
                                	</tr>	                 		               
                                </c:forEach>
                            </table>
                            
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
 	});
 </script>
 
 
 
 
 
 
 
 
    