package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

//	<>:제네릭 표기
//	제네릭은 객체타입으로 선언되어야 한다.
	//ArrayList에 Product 형태로 추가가 된다.
	private ArrayList<Product> listOfProducts = 
			new ArrayList<Product>();
	
	//필드를 static으로 선언시 매번 new명령문으로
	//접근하지 않고 클래스이름을 통해 바로 접속 가능
	private static ProductRepository instance = 
			new ProductRepository();
	
//	싱글톤 패턴(SingleTon Pattern)?
//	최초 한번만 인스턴스를 생성하고 이후에 다른 클래스에서는
//	공유하여 재사용하는 개념으로 new 명령을 사용하면 Heap
//	메모리에 동일한 인스턴스가 계속 생성되므로 메모리 효율이
//	떨어짐
	public static ProductRepository getInstance() {
		return instance;
	}
	
//	기본생성자
//	역할:클래스가 실행되면 초기화 담당
	public ProductRepository() {
		
		/*
		 * Product와 동일한 인스턴스를 생성하고 매개변수 3개 짜리 생성자를 호출한다.
		 */
		Product phone = 
			new Product("P1234","iPhone 6s",800000);

		phone.setDescription("4.7-inch,133X750 Renina HD display,8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook = 
		   new Product("P1235","LG PC 그램",1500000);
		
		notebook.setDescription("13.3-inch,IPS LED display,5rd Generation Intel Core processors");
		notebook.setCategory("NoteBook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = 
			new Product("P1236","Galaxy Tab S",900000);
		
		tablet.setDescription("212.8*125.6mm,Super AMOLED display,Octa-Core Processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		/* ArrayList에 3개의 상품을 추가처리 */
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		
	}
	
	//ArrayList에 있는 상품목록을 가져오는 메서드
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//page173
	//상품목록에서 특정 상품을 클릭시 상세보기 처리를 위한 메서드
	public Product getProductById(String productId) {
		Product productById = null;
		
//		ArrayList에서 특정 상품 정보를 찾아서 Product
//		형태의 변수에 대입후 리턴해준다.
		for(int i=0;i<listOfProducts.size();i++) {
			Product product = listOfProducts.get(i);
			
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		
		return productById;
	}
	
	//page 206
	/* 신규 상품 등록 처리를 하는 메서드 */
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
}






