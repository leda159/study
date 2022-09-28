package dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dto.Product;

public class Cart {
	
	public void update(
			//http 프로토콜 클라이언트의 요청정보를
			//Servlet에 전달하기 위한 목적으로 사용
			HttpServletRequest request,
			//세션 정보를 관리하기 위해 사용
			HttpSession httpSession,
			String pcode,//상품코드
			//수량
			int qty) {
		
		HttpSession session = request.getSession(true);
		
		//장바구니 내역을 가지고 있는 세션 속성인 cartList 를
		//참조변수에 대입
		ArrayList<Product> product =
			(ArrayList<Product>)session.getAttribute("cartList");	
		
		//ArrayList에 있는 상품중에 수량변경 상품을 Search하여
		//상품 수량 변경 상품을 찾은 경우 ArrayList 수량을 변경
		//하고 반복문 탈출
		for(int i=0;i<product.size();i++) {
			if(product.get(i).getProductId().equals(pcode)) {
				product.get(i).setQuantity(qty);
				break;
			}
		}
		
		
	}
}




