package model;

public class Calc {
	
	//필드 선언
	public int num1,num2,result;
	public String op;
	
	
	//기본 생성자
	public Calc() {}
	
	//매개변수 3개짜리 생성자
	public Calc(int num1, int num2, String op) {
		this.num1 = num1; // 매개변수로 값을 받아서 위의 필드에 값을 넣는다. 그래서 this를 사용함
		this.num2 = num2;
		this.op = op;
	}
	
	public int getResult() {
		if(op.equals("+")) {  		//op는 위에있는 필드 변수가 아니다
			result = num1 + num2;	//result num1 num2 은 위에있는 필드 변수가 아니다
		}else if(op.equals("-")) {
			result = num1 - num2;
		}else if(op.equals("*")) {
			result = num1 * num2;
		}else if(op.equals("/")) {
			result = num1 / num2;
		}
		return result;
	}
}
