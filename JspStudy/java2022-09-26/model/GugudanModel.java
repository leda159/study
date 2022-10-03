package model;

public class GugudanModel {

	//입력받은 숫자에 대한 구구단을 처리하는 메서드
	public String getResult(int num) {
		
		String result="";
		
		for(int i=1; i<=9; i++) {
			result += num + "*" + i + "=" + (num*i) + "<br>";
		}
		
		return result;
	}
}
