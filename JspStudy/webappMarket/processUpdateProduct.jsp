<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>    
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String realFolder = "D:\\jspStudy\\WebMarket\\src\\main\\webapp\\resources\\images";
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = 
				new MultipartRequest(
						request,//내장객체
						realFolder,//업로드위치
						maxSize,//업로드 파일 최대크기(5M)
						encType,//인코딩 방식
						//동일한 미디어 파일명 처리
						new DefaultFileRenamePolicy());
		
		//입력화면 값을 변수에 대입
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String condition = multi.getParameter("condition");
		
		Integer price;
		
		//가격을 입력하지 않으면 0으로 처리
		if(unitPrice.isEmpty()){
			price = 0;
		}else{
			//문자열을 정수로 변환
			price = Integer.valueOf(unitPrice);
		}
		
		long stock;
		
		if(unitsInStock.isEmpty()){
			stock = 0;
		}else{
			//문자열을 long 타입으로 변환
			stock = Long.valueOf(unitsInStock);
		}
		
		//입력화면에서 업로드한 파일명 가져온다.
		Enumeration files = multi.getFileNames();
		String fname = (String)files.nextElement();
		//getFilesystemName?
		//실제로 서버에 업로드된 파일명		
		String fileName = multi.getFilesystemName(fname);
		
		//sql문을 처리하는 객체 선언
		PreparedStatement pstmt = null;
		//select문을 실행한후 리턴되는 값들을 가지는 객체
		ResultSet rs = null;
		
		//특정 상품을 수정하기 위해 상품이 존재하는지 체크
		String sql = "select * from product where p_id = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,productId);
		
		//검색된 상품정보를 참조변수에 대입
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			//수정시 첨부파일을 지정한 경우
			if(fileName != null){
				sql = "update product" +
			          "   set p_name = ?," +
			          "       p_unitPrice = ?," +
			          "       p_description = ?," +
			          "       p_manufacturer = ?," +
			          "       p_category = ?," +
			          "       p_unitsInStock = ?," +
			          "       p_condition = ?," +
			          "       p_fileName = ?" +
			          " where p_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				
				//?에 값을 대입
				pstmt.setString(1,name);
				pstmt.setInt(2,price);
				pstmt.setString(3,description);
				pstmt.setString(4,manufacturer);
				pstmt.setString(5,category);
				pstmt.setLong(6,stock);
				pstmt.setString(7,condition);
				pstmt.setString(8,fileName);
				pstmt.setString(9,productId);
				
				pstmt.executeUpdate();
				
			}else{//수정시 첨부파일을 지정안한 경우
				sql = "update product" +
				          "   set p_name = ?," +
				          "       p_unitPrice = ?," +
				          "       p_description = ?," +
				          "       p_manufacturer = ?," +
				          "       p_category = ?," +
				          "       p_unitsInStock = ?," +
				          "       p_condition = ?" +
				          " where p_id = ?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1,name);
					pstmt.setInt(2,price);
					pstmt.setString(3,description);
					pstmt.setString(4,manufacturer);
					pstmt.setString(5,category);
					pstmt.setLong(6,stock);
					pstmt.setString(7,condition);
					pstmt.setString(8,productId);
					
					pstmt.executeUpdate();
			}
		}
		
		//객체 소멸시키기 위해 close()
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();

		//수정화면으로 이동	
		response.sendRedirect("editProduct.jsp?edit=update");
	%>
</body>
</html>





