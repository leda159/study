package javaStudy;

public class Carexam {

	public static void main(String[] args) {
	
		Car car1 = new Car();
		System.out.println(car1.company);
		System.out.println(car1.model);
		System.out.println(car1.maxSpeed);
		
		Car car2 = new Car("자가용");
		
		System.out.println(car2.company);
		System.out.println(car2.model);
		System.out.println(car2.maxSpeed);
		
		Car car3 = new Car("자가용","빨강");
		System.out.println(car3.model);
		System.out.println(car3.color);
		
		Car car4 = new Car("자가용","빨강",350);
		
		System.out.println(car4.model);
		System.out.println(car4.color);
		System.out.println(car4.maxSpeed);

		
	}

}
