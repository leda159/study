package javaStudy;

public class Carex {

	public static void main(String[] args) {
		
		Car myCar = new Car();
		
		myCar.setGas(5);
		
		boolean gasState = myCar.isLefGas();
		if(gasState) {
			System.out.println("출발합니다.");
			myCar.run();
		}
		if(myCar.isLefGas()) {
			System.out.println("gas를 주입할 필요가 없습니다.");
		}else {
			System.out.println("gas를 주입하세요.");
		}
	}

}
