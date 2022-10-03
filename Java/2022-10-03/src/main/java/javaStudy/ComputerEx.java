package javaStudy;

public class ComputerEx {

	public static void main(String[] args) {
	
		Computer myCom = new Computer();
		int[] values1 = {1,2,3,};

		//방법1
		int result1 = myCom.sum1(values1);
		System.out.println(result1);
		
		
		
		//방법2
		int result2 = myCom.sum1(new int[] {1,2,3,4});
		System.out.println(result2);
		
		
		//값의 몫만 넘겨주는 방식
		int result3 = myCom.sum2(1,2,3);
		System.out.println(result3);

	}

}
