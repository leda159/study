package org.bigdata.sample;

import org.springframework.stereotype.Component;

import lombok.Data;


//해당 클래스를 자동으로 빈(Bean)등록 처리 
//@Bean :스프링에서 제공하는 변경 불가한 클래스를 빈(Bean)동록시 사용
//@Component :개발자가 작성한 클래스를 빈(Bean                                    )동록시 사용
@Component

//getter 메서드, setter 메서드, toStirng()메서드등을 자동으로 셋팅
@Data
public class Chef {

	private String name;
	private int age;
	private String phone;
	
	
}
