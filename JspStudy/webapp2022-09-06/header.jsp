<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		font-size:20px;
		font-text:"맑은고딕";
	}
	
	ul{
		background-color:red;
		list-style-type:none;
		margin:0;
		padding:0;
	}
	
	li{
		/* (float:left;) : 왼쪽에서 오른쪽으로 오브젝트를 배열시킴 */
		float:left;
	}
	
	a{  
		
		/* a태그는 원래 inline level 요쇼인데  block level 요소로	바꿔줌
		바꾸면 패딩이나 마진등 블럭레벨에서 사용할수있는 속성을 사용가능하다 */
		display:block;
		/* a태그의 언더라인 제거 */
		text-decoration:none;
		text-align:center;
		padding:10px;
	}
	
	/* body.jsp에 스타일 지정 */
	
	.content{
		padding-top:60px;
		/* body 높이 사이즈 고정시켜줌 */
		min-height:calc(100vh - 100px);
	}
</style>
</head>
<body>
	<ul>
		<li><a href="#">한국쇼핑몰</a></li>
		<li><a href="#">상품관리</a></li>
		<li><a href="#">게시판관리</a></li>
		<li><a href="#" style="margin-right:200px">고객관리</a></li>
		
		<%
			//정상적으로 로그인 되었으면
			if(session.getAttribute("id")!=null){
		%>
			<li><a href="logout.jsp">로그아웃</a></li>
		<%
			}else{
		%>
			<li><a href="login.jsp">로그인</a></li>
		<%
			}
		%>
		<li><a href="#">회원가입</a></li>
	</ul>
</body>
</html>