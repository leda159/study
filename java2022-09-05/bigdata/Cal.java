package bigdata;

public class Cal {

	public int add(int num1, int num2) {
		return num1+num2;
	}
	public int minus(int num1, int num2) {
		return num1-num2;
	}
	public int mul(int num1, int num2) {
		return num1*num2;
	}
	public double div(int num1, int num2) {
		return (double)num1/num2;
		
	}
}
//ex)
//num1 : 10
//num2 :4

//return  num1/num2; = 2
//return (double)num1/num2; = 2.5
//		  (형변환)캐스팅