package model;

public class LoginBean {
	private String id;			//클래스의 필드(속성) 
	private String password;	
	
	
	
	//접근제한자
	  //public : 전체 클래스에게 접근허용
	  //default : 같은 패키지 내에 있는 클래스만 접근 허용
	  //private : 값을 가져올 경우 get메서드에 값을 대입하려면 set메서드를 사용
	  //protected : 같은 패키지 내에 있는 클래스와 상속을 받은 다른 패키지에 있는 클래스도 접근을 허용
	  //private 사용하는 이유? 정보은닉(=캡슐화)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean validate() {
		if(password.equals("admin"))
			return true;
		else
			return false;
	}
	
}
