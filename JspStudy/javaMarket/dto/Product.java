package dto;

import java.io.Serializable;

/*Serializable?
인터페이스(interface)이고
자바 시스템 내부에서 객체 또는 데이터를 외부의 자바 시스템에서도
사용가능하도록 바이트 형태의 데이터로 변환하는 기술(직렬화)와
바이트로 변환된 데이터를 다시 객체로 변환하는 기술(역직렬화)를 
말함*/
/*implements? 인터페이스를 가지고 구현하다*/
public class Product implements Serializable  {
//	상수선언(변하지 않는 값을 선언)
//	serialVersionUID :클래스의 버전관리
	private static final long serialVersionUID = 1L;
		
	/* 필드 선언(=멤버변수=속성) */
	private String productId; //상품아이디
	private String pname; //상품명
	private Integer unitPrice;//상품단가
	private String description;//상품설명
	private String manufacturer;//제조사
	private String category;//분류
	private long unitsInStock;//재고
	private String condition;//상품상태
	
	//page239
	//상품이미지 필드 추가 2022.09.08
	private String filename;
	
	//p438 장바구니 수량 필드 선언
	private int quantity;
	
//	기본생성자로 생성자의 역할은 클래스가 실행될때 
//	초기화 작업(필드값 대입)을 담당	
	
//	오버로딩(Overloading)?
//	생성자나 메서드를 이름은 동일하게 하고 매개변수의 갯수,
//	자료형,순서를 달리하여 여러개를 선언하는 기법
//	
//	오버라이딩(Overriding)?
//	부모클래스를 자식클래스가 상속받아 부모클래스에 있는 메서드에
//	대하여 재정의 하는 기법
	
	public Product() {
		/*부모클래스(object)의 기본생성자를 호출한다*/
		super();
	}

	/* 매개변수가 3개인 생성자 */
	public Product(String productId,
			       String pname,Integer unitPrice) {
		/* this? 자기자신을 말한다(Product) */
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
	
}






