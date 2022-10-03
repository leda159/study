package org.bigdata.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//Junit 프레임워크의 테스트를 수행하기 위해서 반드시 선언
@RunWith(SpringJUnit4ClassRunner.class)
//root-context.xml 파일 위치
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//콘솔창에 로그 출력
@Log4j
public class SampleTests {

	//Restaurant 클래스 자동 주입
	@Setter(onMethod_ = {@Autowired})
	private Restaurant restaurant;
	
	
	 @Ignore 
	 public void test2() {
	 
	 }
	 
	
	@Test
	public void testExist() {
		//객체가 생성되어 있는지 체크
		assertNotNull(restaurant);
		//콘솔창에 로그를 출력
		log.info(restaurant);
		log.info("---------------------");
		log.info(restaurant.getChef());
	}
}
