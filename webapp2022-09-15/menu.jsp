<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
		request.setCharacterEncoding("utf-8");
	
		String user_ID = request.getParameter("id");
		String user_PW = request.getParameter("passwd");
		String user_Name = request.getParameter("name");
		
		if(user_Name == "" || user_Name == null){
	%>
	
	<script>
		alert("이름을 입력하세요!");
		history.back(); //이전 페이지로 이동
	</script>
	
	<%
		}
	%>
	
	
<h3>상품 선택</h3>
<h4><%=user_Name %>님 환영합니다.</h4>	
<hr>
	
<form action="cartAdd.jsp" method="POST">
	상품: <select name="product">
			<option value="notebook">노트북</option>
			<option value="mouse">마우스</option>
			<option value="phone">휴대폰</option>
			<option value="tablet">태블릿</option>
		</select>
		
		<p><input type="submit" value="장바구니 담기">
		   <input type="button" value="장바구니 목록" onclick="location.href='cartList.jsp'">
</form>
</body>
</html>