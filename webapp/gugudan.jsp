<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	*{
		text-align:center;
	}
	table{
		border-collapse:collapse;
		border:1px solid blue;
	}
	tr,td{
		border:1px solid blue;
	}
</style>
</head>
<body>
	<%-- 구구단 --%>
	<!-- 구구단 -->
<table>
	<tr>
		<td colspan="9" style="color:red">구구단</td>
	</tr>
		<%
			for(int i=1;i<=9;i++){
		%>
	<tr>
		<%
				for(int j=2;j<=9;j++){	
		%>
		<td>
			<%=j+"x"+i+"="+(j*i)%>
		</td>
		<%
				}
		%>
	</tr>
		<%
			}
		%>
</table>

</body>
</html>





