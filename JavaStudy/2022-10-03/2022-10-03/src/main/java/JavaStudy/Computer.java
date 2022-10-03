package javaStudy;

public class Computer {

	//배열 타입의 매개변수
	int sum1(int[] values ){
		int sum = 0;
		for(int i=0; i<values.length; i++) {
			sum = sum + values[i];
		}
		return sum;
	}
	
	//값의 몫만 넘겨주는 방식
	int sum2(int ... values) {
		int sum = 0;
		for(int i=0; i<values.length; i++) {
			sum = sum + values[i];
		}
		return sum;
	}
}
