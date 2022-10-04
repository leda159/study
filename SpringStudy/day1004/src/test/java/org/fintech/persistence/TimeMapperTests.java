package org.fintech.persistence;


import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.bigdata.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TimeMapperTests {
	
	//TimeMapperTests 컴파일 시점에
	//TimeMapperTests 인터페이스가 자동주입 된다.
	@Setter(onMethod_ = @Autowired)
	private TimeMapper timeMapper;
	
	@Ignore
	public void testGetTime() {
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
	}
		
	@Test
	public void testGetTime2() {
		log.info("getTime2");
		log.info(timeMapper.getTime());
	}
}
