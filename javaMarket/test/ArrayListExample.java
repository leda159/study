package test;

import java.util.ArrayList;

public class ArrayListExample {
	public static void main(String[] args) {
		
		ArrayList<String> array = 
				new ArrayList<String>();
		
		array.add("Java");
		array.add("Jsp");
		array.add("Spring");
		
		//인덱스가 1번인 Jsp를 Html로 변경
		array.set(1,"Html");
		
		/* 인덱스가 2인 값을 ArrayList에서 삭제 */
		array.remove(2);
		
		for(int i=0;i<array.size();i++) {
			System.out.println(array.get(i));
		}
		
		/* 향상된 for문(배열에 대해서만 사용가능) */
		for(String data : array) {
			System.out.println(data);
		}
		
		
	}
}







