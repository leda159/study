package org.bigdata.controller;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
//Controller및 웹 환경에서 사용되는 객체들을 자동으로
//Bean등록해주는 어노테이션
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	                 })
@Log4j
public class BoardControllerTests {

	//자동주입
	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	
	//WebApplication 을 톰캣서버를 이용하여 URL을 
	//처리하는게 아니라 프로그램에서 URL을 처리하도록
	//하는 객체
	private MockMvc mockMvc;
	
	//테스트 전 MockMvc를 준비
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Ignore
	public void testList() throws Exception {
		log.info(
			//url 처리	
			//get(실행URL) :전송방식이 get임을 선언	
			mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				   //테스트한 결과를 객체형태로 리턴	
				   .andReturn()
				   //요청을 전송하는 view값과 Model객체에
				   //저장된 값을 리턴
				   .getModelAndView()
				   //리턴되는 값을 Map형태로 리턴
				   .getModelMap());
		
	}
	
	//신규 게시물 등록 처리
	@Ignore
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(
			MockMvcRequestBuilders.post("/board/register")
					             .param("title","테스트 새글 제목")
					             .param("content","테스트 새글 내용")
					             .param("writer","이순신"))
				                 .andReturn()
				                 .getModelAndView()
				                 .getViewName();
		
		log.info(resultPage);
				
	}
	
	@Ignore
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(
					MockMvcRequestBuilders.get("/board/get")
										  .param("bno","8"))
										  .andReturn()
										  .getModelAndView()
										  .getModelMap());
	}
	
	
	@Ignore
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(
								MockMvcRequestBuilders.post("/board/modify")
													  .param("bno","8")
													  .param("title","8번 게시물 제목 수정")
													  .param("content","8번 게시물 내용 수정")
													  .param("writer","신사임당"))
								   					  .andReturn()
								   					  .getModelAndView()
								   					  .getViewName();
		log.info("resultPage:" + resultPage);
		
	}
	
	@Ignore
	public void testRemove() throws Exception {
		
		String resultPage = mockMvc.perform(
								MockMvcRequestBuilders.post("/board/remove")
													  .param("bno","8"))
								   					  .andReturn()
								   					  .getModelAndView()
								   					  .getViewName();
		log.info("resultPage:" + resultPage);
		
	}
	
	@Test
	public void testListPaging() throws Exception {
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/list")
					.param("pageNum","2")
					.param("amount","10"))
					.andReturn()
					.getModelAndView()
					.getModelMap());
	}
	
}






