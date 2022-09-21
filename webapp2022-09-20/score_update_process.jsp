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
	<%@ include file="dbconn.jsp"%>
	<%
	
		request.setCharacterEncoding("utf-8");
	
		int sno = Integer.parseInt(request.getParameter("sno"));
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		int total = kor + eng + math;//총합계
		int avg = total / 3;
		
		String grade;//학점
		
		if(avg >= 90){
			grade = "A";
		}else if(avg >= 80){
			grade = "B";
		}else if(avg >= 70){
			grade = "C";
		}else if(avg >= 60){
			grade = "D";
		}else{
			grade = "F";
		}
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update  score" +		//업데이트 쿼리문
						 "	 set  kor=?,"+		//병경 할 컬럼
						 "	 	  eng=?,"+		//병경 할 컬럼
						 "		  math=?,"+		//병경 할 컬럼 
			             "  	  total=?,"+   	//병경 할 컬럼
						 "		  avg=?,"+		//병경 할 컬럼	
						 "		  grade=?"+		//병경 할 컬럼
						 " where  sno=?";      	//학생번호로 찾는다
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,kor);
 			pstmt.setInt(2,eng);
 			pstmt.setInt(3,math);
 			pstmt.setInt(4,total);
 			pstmt.setInt(5,avg);
 			pstmt.setString(6,grade);
 			pstmt.setInt(7,sno);
 			
			
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("alert('정상적으로 성적 등록')");
			out.println("</script>");
 			
		}catch(SQLException e){
			out.println("<script>");
			out.println("alert('정상적으로 성적 등록 실패')");
			out.println("</script>");
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>




