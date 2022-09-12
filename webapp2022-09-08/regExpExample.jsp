<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkForm(){
		
		/* 정규표현식 : /표현식/flag */
		var regExp = /Java/i;
		var str = document.frm.title.value;
		
		/* 매개변수로 전달되는 문자열이 정규표현식에 부합되면
		해당 문자열을 리턴 */
		var result = regExp.exec(str);
		//alert(result[0]);	

		/* 입력받은 문자열이 정규표현식에 부합하면 true
		아니면 false 리턴 */
		var test = regExp.test(str);
		
		alert(test);	
		
		//입력받은 이름 값
		var name = document.frm.name.value;
		var regExp2 = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(!regExp2.test(name)){
			alert("이름은 숫자로 시작할 수 없습니다.");
			return;
		}
		
		
		
		
		document.frm.submit();
	}
</script>
</head>
<body>
	<form name="frm">
		<p>제목:<input type="text" name="title">
		<p>이름:<input type="text" name="name">
		<input type="button" value="전송" 
		       onclick="checkForm();">
	</form>
</body>
</html>


