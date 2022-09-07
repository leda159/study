<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
				자바빈즈를 사용하겠다는 선언 
				
	 2자바빈즈를 이용하면 Calculator c = new Calculator 와 같은 의미 (접근가능함)
 	 id는 식별자임  아무거사 본인이 선언가능
 -->
<jsp:useBean id="calc" class="beans.Calculator" scope="request"/>



<%-- 입력화면에서 첫번째수 속성값을 자바클래스의 num1 필드에 대입
<jsp:setProperty name="calc" property="num1" value="${param.num1 }" />
<jsp:setProperty name="calc" property="op" value="${param.op }" />
<jsp:setProperty name="calc" property="num2" value="${param.num2 }" /> --%>


<!-- 입력받는 화면의 속성이름과 자바 클래스 필드 이름이 동일한 경우 사용 -->
<jsp:setProperty name="calc" property="*" />





<%
	if(request.getMethod().equals("POST")){
		calc.execute(); 
	}
%>

<form action="#" method="POST">
	<input type="text" name="num1">
	<select name="op">
		<optgroup label="사칙연산">
			<option selected>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</optgroup>
	</select>
	<input type="text" name="num2">=
	<input type="text" name="result" value="<%=calc.getResult() %>">
	<input type="submit" value="계산">
	<input type="reset" value="다시 입력">
</form>
</body>
</html>