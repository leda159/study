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
		/*  클라이언트의 요청에 대해서 서버의 응답처리까지 속성값을 언제까지 유지시킬건지 결정한다.
			이것을 Scope(유효범위)라고 한다.
			1.page:속성값이 현재 페이지에서만 유효
			2.request:클라이언트의 요청에 대해 서버가 응답할때까지 유효
			3.session:웹 브라우저가 변경되지 않거나 세션 삭제전까지 유효
			4.application:프로그램 종료전까지 유효 */
			
		/*  1.setAttribute(속성이름,속성값)-특정 속성값을 지정할때 사용
			2.getAttribute(속성이름)-특정 속성에 대한 값을 가져올때 사용
				ex)getAttribute("name")-"홍길동"이란 값을 가져온다
			3.removeAttribute(속성이름)-속성값을 삭제할때 사용
				ex)removeAttribue("name")-"홍길동"이란 값을 삭제한다 */


		request.setAttribute("name", "홍길동");
	%>
		<!-- requestScope:유효범위 -->
		<!-- EL(Expression Language):표현언어라고 한다 -->
		
		${requestScope.name}
</body>
</html>




