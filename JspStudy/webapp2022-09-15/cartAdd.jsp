<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	
	//cartList 세션 속성값을 가져와서 ArrayList 변수에 대입을 한다    //없어도 일단 세션을 가져온다 없는 경우엔 밑에 if문으로 감
	ArrayList<String>list = (ArrayList<String>)session.getAttribute("cartList");
	
	if(list == null){ //cartList 속성값이 없다는것은 제품을 하나도 선택 안한상태이므로 ArrayList 생성
		list = new ArrayList<String>();
	
	
	}
	//cartList가 null이 아니면 생성된 ArrayList에 선택한 상품의 옵션 리스트를 추가한다 
	String product = request.getParameter("product");
	
	list.add(product);
	
	//최종 Array를 세션 속성값에 대입
	session.setAttribute("cartList", list);
	
	%>
	<script>
		alert("<%=product%> 추가완료");
		history.back();
	</script>
</body>
</html>