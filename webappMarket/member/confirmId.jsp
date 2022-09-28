<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.SignUpDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function idCheckResult(){
		opener.document.getElementById("retValue").value = 
		document.getElementById("gubun").value;		
	}
</script>
</head>
<body>
	<%
		//join.jsp에서 전달한 아이디
		String id = request.getParameter("id");
	
		SignUpDAO s = new SignUpDAO();
		
		//아이디 중복체크
		boolean result = s.confirmId(id);
		
		if(result){
			out.println("이미 사용중인 아이디 입니다.");
			out.println("<input type='hidden' id='gubun' name='gubun' value='N'>");
		}else{
			out.println("사용 가능한 아이디 입니다.");
			out.println("<input type='hidden' id='gubun' name='gubun' value='Y'>");
		}
		
	%>
	
	<input type="button"
	       onclick="idCheckResult();window.close()"
	       value="닫기">
</body>
</html>







