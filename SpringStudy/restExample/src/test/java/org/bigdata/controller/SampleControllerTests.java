package org.bigdata.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.bigdata.domain.Ticket;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
//테스트를 할때 사용 4버전
@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration : Controller및 Web환경에 필요한 Bean들을 자동으로
//생성하여 빈등록을 자동으로 처리해주는 어노테이션
@WebAppConfiguration
//root-context.xml ,servlet-context.xml을 불러온다
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class SampleControllerTests {

	@Setter(onMethod_ = {@Autowired})
	
	//WebApplicationContext을 확장한 인터페이스로
	//웹 애플리케이션에 필요한 기능을 추가한 인터페이스
	private WebApplicationContext ctx;
	
	
	//톰캣 서버를 이용하지 않고 클래스에서 URL 처리를 
	//하는 가상 서버 기법 (가짜 서버)
	private MockMvc mockMvc;
	
	//MockMvc를 사용할수 있도록 준비
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();	
	}
	
	@Test
	public void testConvert() throws Exception{
		
		Ticket ticket = new Ticket();
		ticket.setTno(123);
		ticket.setOwner("Admin");
		ticket.setGrade("AAA");
		
		//new Gson().toJson(ticket); : Ticket.java 객체를 json 형테의 데이터로 변환처리
		String jsonStr = new Gson().toJson(ticket);
		
		//{"key":"value"}
		log.info(jsonStr);
		
		//("/sample/ticket")를 post매핑 한다 
		mockMvc.perform(post("/sample/ticket")
				
		//MIME 형태는 json 형태		
		.contentType(MediaType.APPLICATION_JSON)
		.content (jsonStr))
		//http 상태 예상코드 값을 선언하는 메서드
		//is(200) : 정상인지 확인
		.andExpect(status().is(200));
	}
}

















