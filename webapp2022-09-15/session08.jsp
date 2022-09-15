<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss E요일");
	
		//J세션 아이디값
		String session_id = session.getId();
	
		//세션 마지막 접근 시간
		long last_time = session.getLastAccessedTime();
		//세션을 처음으로 생성한 시간
		long start_time = session.getCreationTime();
		//세션을 사용 시간
		long used_time = (last_time - start_time)/60000;
		
		
		
		//날짜로 변환
		Date sdate = new Date(start_time);
		Date ldate = new Date(last_time);
		
		//날짜를 원하는 패턴으로 변환
		String sdate2 = sdf.format(sdate);
		String ldate2 = sdf.format(ldate);
		
		
		
		
		out.println("세션 아이디:" +session_id+"<br>");
		out.println("요청 시작 시간:" +sdate2+"<br>");
		out.println("요청 마지막 시간:" +ldate2+"<br>");
		out.println("웹 사이트 경과 시간:" +used_time+"<br>");
		
	%>
</body>
</html>