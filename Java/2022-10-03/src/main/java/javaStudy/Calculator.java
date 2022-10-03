package javaStudy;

public class Calculator {
	
	//매개변수가 없는 메소드
	void powerOn() {
		System.out.println("전원을 켭니다.");
	}
	
	//더하기 메소드
	int plus(int x, int y){
		int result = x + y;
		return result;  
		//최종적으로 result라는 결과값을 얻어서 
		//메소드를 호출한 쪽으로 값을 보내줌
	}
	
	// 나누기 메소드
	double divide(int x , int y) {
		double result = (double)x / y;
		return result;
	}
	
	//결과값 없는 메소드 외부에서 받을 값도 없는 메서드
	void powerOff(){
		System.out.println("전원을 끕니다.");
	}
} 
