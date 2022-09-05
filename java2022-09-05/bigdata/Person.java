package bigdata;

public class Person {
// 	Person 클래스의 속성(필드=멤버변수)지정 
//	  Private : 접근제한자
//	    1)default  : 접근제한자를 선언하지 않을 경우 default로 선언되고 같은 패키지에 있는  클래스에게만 접근 가능
//	    2)public   : 모든 클래스에게 접근 허용가능
//	    3)private  : getter , setter 메서드를 이요하여 접근가능
//	    4)protected: 같은 패키지내에 있는 클래스와 다른 패키지에 있는 상속받은 클래스는 접근 허용
 
	private int id = 20181004;
	private String name = "홍길순";
	
//	매개변수가 한개도 없는 기본생성자
	public Person() {
		
	}
//	getId() : private로 선언된 id필드값을 가져오는 메서드
//	int는 return 되는 값의 자료형	
	public int getId() {
		return id;
	}	
//	setId() : private로 선언된 id필드에 값을 대입하는 메서드
	public void setId(int id) {
		this.id = id;
	}
//	매개변수를 받아온다
	public String getName() {
		return name;
	} 
//  매개변수값(String name)을 필드(this.name)에 대입한다
	public void setName(String name) {
		this.name = name;
	}
}
