<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//product.jsp에서 매개변수로 전달된 상품코드
		String id = request.getParameter("id");
	
		//상품코드가 없으면 상품 리스트로 이동
		if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		//getInstance() : SingleTon Pattern
		//getInstance() 메서드가 static으로 선언되었으므로
		//클래스명.getinstance()로 메서드에 접근가능
		//ProductRepository dao = ProductRepository.getInstance();
		
		//product.jsp에서 매개변수로 전달된 상품을 검색
		//Product product = dao.getProductById(id);
				
		//검색한 상품내역이 없으면 경고창 페이지를 실행
		//if(product == null){
		//	response.sendRedirect("exceptionNoProductId.jsp");
		//}
		
		//ArrayList에 있는 모든 상품내역을 가져와서
		//변수에 대입
		//ArrayList<Product> goodList = dao.getAllProducts();
		
		//Product goods = new Product();
		
		//주문하려는 상품이 ArrayList에 존재하는지 체크하여
		//검색이 성공하면 반복문 탈출
		//for(int i=0;i<goodList.size();i++){
		//	goods = goodList.get(i);
			
		//	if(goods.getProductId().equals(id)){
		//		break;
		//	}
		//}
		
		//cartList라는 세션 속성값을 가져온다.
		//cartList에는 주문처리한 모든 상품내역이 존재
		ArrayList<Product> list 
		   = (ArrayList<Product>)session.getAttribute("cartList");
		
		//장바구니 내역이 없으면 ArrayList를 생성
		if(list == null){
			list = new ArrayList<Product>();
			session.setAttribute("cartList",list);
		}
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cnt = 0;
		Product goodsQnt = new Product();
		
		//ArrayList를 반복하면서 장바구니에 있는 상품이면
		//수량만 변경하고 없는 상품이면 ArrayList에 추가처리
		for(int i=0;i<list.size();i++){
			goodsQnt = list.get(i);
			
			if(goodsQnt.getProductId().equals(id)){
				//장바구니 있는 상품을 주문한 경우 상품수량만 증가
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				//1증가된 상품수량을 필드에 대입
				goodsQnt.setQuantity(orderQuantity);
			}
		}
		
		//장바구니에 없는 상품을 신규로 주문한 경우
		if(cnt == 0){
			try{
				
				Product goods = new Product();
				String sql = "select * from product where p_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				
				//장바구니에 추가하기 위해서 상품내역을 select해서 변수대입
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					goods.setPname(rs.getString("p_name"));
					goods.setProductId(rs.getString("p_id"));
					goods.setUnitPrice(rs.getInt("p_unitPrice"));
					goods.setQuantity(1);
					
					//ArrayList에 추가
					list.add(goods);
				}
				
			}catch(SQLException e){
				out.println("addCart.jsp 오류 발생<br>");
				out.println("SQLException:" + e.getMessage());
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		
		response.sendRedirect("product.jsp?id=" + id);
	%>
</body>
</html>





