package beans;

public class Calculator {
	
	//필드(=맴버변수)선언 자바빈즈를 사용할려면 접근자를 private 사용
	private int num1;
	private String op;
	private int num2;
	private int result;
	
	
	
	//기본 생성자 , 이름은 클래스명이랑 같아야한다.
	public Calculator() {}

	
	
	
	
	//Getter/Setter()메서드 생성 
	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}
	
	
	
	
	//사칙연산을 수행하는 메서드 생성
	//메서드가 return할 값이 없는경우 void로 선언한다.
	public void execute() {
		switch(this.op) { //자기자신의 op맴버 변수의 값  연산자 +-*/ 중 하나를 선택한것
		case"+":         //+를 선택한다면
			this.result = this.num1 + this.num2;
			break;
			
		case"-":        
			this.result = this.num1 - this.num2;
			break;
			
		case"*":         
			this.result = this.num1 * this.num2;
			break;
			
		case"/":         
			this.result = this.num1 / this.num2;
			break;
		}
	}
}








