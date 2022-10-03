<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.Product" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//person p = new Person();
		
		// new Person(); : 인스턴스 생성 → heap 메모리에 생성
		// new 라는 연산자를 사용해서 Person()이라는 메소드에 접근한다
		//ProductRepository.java 파일에 보면 static으로 선언되었음
		//static을 선언하면 new 연산자를 사용하지않고 Person() 메소드에 접근 가능하다
		
		
		
	
	
		//trim : 공백제거 ...문자열 사이의 공백은 처리가 안되고 왼쪽이나 오른쪽 공백이 처리가능함
		//예시) ㅁabcㅁdefㅁiㅁ    ㅁ=공백
		//select trim()from dual;
	
	
	
	
		String id = request.getParameter("id"); //product.jsp에서 매개변수로 전달된 상품코드(id)
		if(id == null || id.trim().equals("id")){//상품코드가 없거나 공백이면 
			response.sendRedirect("products.jsp"); //상품 리스트로 이동함
			return;
		}
		
		//getInstance(): 싱글톤(SingleTon Pattern) 
		//getInstance()가 static으로 선언되었으므로 클래스명.getInstance()로 접근가능하다
		ProductRepository dao = ProductRepository.getInstance(); 
		
		Product product = dao.getProductById(id); //product.jsp에서 매개변수로 전달된 상품을 검색한다
		if(product == null){//검색한 상품내역이 없으면 exceptionNoProductId.jsp를 실행한다(예외처리)
			response.sendRedirect("exceptionNoProductId.jsp");
		}
		
		ArrayList<Product> goodsList = dao.getAllProducts(); //ArrayList에 있는 모든 상품 내역을 가져와서 변수(goodsList)에 대입
		Product goods = new Product();
		for(int i =0; i<goodsList.size(); i++){//주문하려는 상품이 ArrayList에 존재하는지 체크를 한다
			goods = goodsList.get(i);//검색이 성공하면 반복문 탈출... goods에 담겨있다
			if(goods.getProductId().equals(id)){
				break;
			}
		}
		
		ArrayList<Product> list =    					//<Product>형태로 cartList가 담겨져있다
				(ArrayList<Product>)session.getAttribute("cartList");//cartList라는 세션 속성값을 가져온다
		if(list == null){//장바구니 내역이 없으면				//cartList에는 주문 처리한 모든 상품내역이 존재한다
			list = new ArrayList<Product>();//ArrayList를 생성한다
			session.setAttribute("cartList", list);//cartList라는 속성에 담는다  list: 속성 값
		}
		
				
		int cnt = 0;
		Product goodsQnt = new Product();
		
		
		for(int i=0; i<list.size(); i++){//ArrayList를 반복하면서 장바구니에 있는 상품이면 수량만 변경하고 없는 상품이면 ArrayList에 추가처리
			goodsQnt = list.get(i);	//모든 list 정보를 가져와서 goodsQnt 에 대입
			if(goodsQnt.getProductId().equals(id)){//장바구니에 있는 상품을 주문한 경우 
				cnt++;					//수량만 증가시킴 ... 
				int orderQuantity = goodsQnt.getQuantity()+1; //같은 재품이면 1씩 증가
				goodsQnt.setQuantity(orderQuantity);//1 증가된 상품 수량을 필드에 대입한다
			}
		}
		
		if(cnt ==0){ //cnt ==0 는 장바구니에 상품이 없다는 의미이므로 상품을 신규로 주문한 경우
			goods.setQuantity(1);
			list.add(goods); //ArryaList에 추가를 한다
		}
		response.sendRedirect("product.jsp?id="+id); //다시 상세보기 화면으로 이동처리를 한다
	%>
</body>
</html>



