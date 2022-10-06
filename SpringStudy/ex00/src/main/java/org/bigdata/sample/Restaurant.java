package org.bigdata.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import lombok.Data;
import lombok.Setter;


@Component //빈(Bean)등록 자동 처리
@Data
public class Restaurant {
	
	
	//Restaurant 클래스가 컴파일시 Chef 클래스를 @Setter 어노테이션을 사용하면
	//setChef()와 getChef()메서드가 컴파일 시점에 자동 주입된다.
	@Setter(onMethod_ = @Autowired)
	private Chef Chef; //클래스 안에있는 필드
}
