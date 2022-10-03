package javaStudy;

public class CalculatorEcample {

	public static void main(String[] args) {
		//기본 생성자
		Calculator myCalc = new Calculator();
		
		
		// myCalc가 참조하는 객체로가서 PowerOn()메소드를 호출함
		myCalc.powerOn(); 
		
		//더하기
		int result1 = myCalc.plus(1, 2);
		System.out.println("result1:"+result1);
		
		//나누기
		double result2 = myCalc.divide(10, 5);
		System.out.println("result2:"+result2);
		
		//매개변수가 없는 메소드 호출
		myCalc.powerOff();
	}

}
