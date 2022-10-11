
package org.bigdata.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //Getter() + Setter() + toString()기능이 합쳐져 있다.
//모든필드를 매개변수로 하는 생성자를 생성
@AllArgsConstructor
//기본생성자를 생성
@NoArgsConstructor
public class SampleVO {
	
	//보통 int 라고 설정을 하는데 wrapperClass
	private Integer mno; 
	private String firstName;
	private String lastName;
}




//Class

//1.Object
//2.String - 기본자료형이 아니라 객체(class)이다
//3.wrapperClass -기본자료형을 객체타입으로 선언함
//char,int를 제외한 6개의 타입은 첫글자를 대문자로 표기함
//int ->Integer , char -> charecter
//ex) long -> Long
  //3-1 boxing
  //3-2 unboxing
//4.Class 클래스







