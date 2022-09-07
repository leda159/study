package test;

import java.util.ArrayList;

public class ArrayListExample {
	public static void main(String[] args) {
//			< > :generic이라고 불리고 사이에는 객체 type이 들어가야한다 
		ArrayList<String> array = new ArrayList<String>();
		
		array.add("Java");
		array.add("Jsp");
		array.add("Spring");
		
//		ex)
//		Jsp를 다른문자열로 바꾸는 방법
//		index가 1번인 값을 Html로 변경
		array.set(1, "Html");
		
//		ex)
//		index가 2인 값을 삭제
		array.remove(2);
		
		
		
//		출력 방법1
		for(int i=0; i<array.size(); i++) {
			System.out.println(array.get(i));
		}
		
		
//		출력 방법2
//		향상된 for문 (배열에 대해서만 사용가능)
		for(String data : array) {
			System.out.println(data);
		}
	}
}
