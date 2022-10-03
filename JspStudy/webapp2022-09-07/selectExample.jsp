<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="#" method="get">
		<p><select name="city" size="3">
			<option value="서울시">서울특별시</option>
			<option value="경기도">경기도</option>
			<option value="인천시" selected>인청광역시</option>
			<option value="충청도">충청도</option>
			<option value="전라도">전라도</option>
			<option value="경상도">경상도</option>
		</select>
	
	
		<p>
		<select name="city">
			<optgroup label="서울특별시">
				<option value="seocho-gu">서초구</option>
				<option value="gangnam-gu">강남구</option>
				<option value="songpa-gu">송파구</option>
			</optgroup>
			
			
			<optgroup label="경기도">
				<option value="seingnam-si">성남시</option>
				<option value="suwon-si">수원시</option>
				<option value="yongin-si">용인시</option>
			</optgroup>
		</select>
		
		
		<p><input type="submit" value="전송">
	</form>
</body>
</html>