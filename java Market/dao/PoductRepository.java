package dao;
import java.util.ArrayList;
import dto.Product;
public class PoductRepository {

//	<>:제네릭 표기
//	   제네릭은 객체타입으로 선언되어야 한다.
//	   ArrayList에 Product 형태로 추가가 된다.
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
//	기본생성자
//	역할:클래스가 생성되면 초기화를 담당
	public PoductRepository() {
		
//		Product와 동일한 인스턴스를 생성하고 매개변수가 3개인 생성자(Product)를 생성함
		Product phone = new Product("P1234","iPhone 6s",800000);
		
		phone.setDescription("4.7-inch,1334X750 Renina HD display, 8-megapixel isight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		
		Product notebook = new Product("P12345","LG PC 그램",1500000);
		phone.setDescription("13.3inch,IPS LED display,5rd Generation Intel Core processors");
		phone.setCategory("NoteBook");
		phone.setManufacturer("LG");
		phone.setUnitsInStock(1000);
		phone.setCondition("Refurbished");
		
		Product tablet = new Product("P12345","Galaxy",1500000);
		phone.setDescription("212.8*125.6*6mm,Super AMOLED display,Octa-Core processors");
		phone.setCategory("Tablet");
		phone.setManufacturer("Samsung");
		phone.setUnitsInStock(1000);
		phone.setCondition("Old");
				
		
//		ArrayList에 3개의 상품을 추가처리
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		
		
	}
	
//	ArrayList에 있는 상품목록을 가져오는 메서드
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
}




