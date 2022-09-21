<%@page import="org.apache.catalina.tribes.util.ExceptionUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");

	int sno = Integer.parseInt(request.getParameter("sno"));
	String sname = request.getParameter("sname");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	
	int total = kor + eng + math; //총합계
	double avg  = (double)total / 3; //평균
	
	String grade ;//학점
	
	
	if(avg>=90){
		grade = "A";
	}else if(avg>=80){
		grade = "B";
	}else if(avg>=70){
		grade = "C";
	}else if(avg>=60){
		grade = "D";
	}else if(avg>=50){
		grade = "E";
	}else{
		grade = "F";
	}
	
		
		
		
	PreparedStatement pstmt = null;
	
	
	
	try{
	
	String sql = 
			"insert into score" +
			"			values(?,?,?,?,?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql); //sql 문장을 준비시켜라
	
	pstmt.setInt(1,sno);
	pstmt.setString(2,sname);
	pstmt.setInt(3,kor);
	pstmt.setInt(4,eng);
	pstmt.setInt(5,math);
	pstmt.setInt(6,total);
	pstmt.setDouble(7,avg);
	pstmt.setString(8,grade);
	
	pstmt.executeUpdate();
	
	out.println("<script>");
	out.println("alert('정상적으로 성적 등록')");
	out.println("</script>");
	
	}catch (SQLException e){
		out.println("<script>");
		out.println("alert('정상적으로 성적 등록 실패')");
		out.println("</script>");
	}finally{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	
	

	
%>
</body>
</html>