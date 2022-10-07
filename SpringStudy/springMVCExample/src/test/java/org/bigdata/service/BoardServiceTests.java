package org.bigdata.service;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.bigdata.domain.BoardVO;
import org.bigdata.domain.Criteria;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Ignore
	public void testExist() {
		
		log.info(service);
		//assertNotNull? 객체생성되어있는면 객체를 리턴하고
		//생성되어 있지 않으면 NULl을 리턴
		assertNotNull(service);
	}
	
	@Ignore
	public void testRegister() {
		
		//BoardVO 인스턴스가 Heap 메모리에 생성
		//기본생성자를 호출
		BoardVO board = new BoardVO();
		
		board.setTitle("스프링교육");
		board.setContent("Mybatis");
		board.setWriter("이순신");
		
		service.register(board);

		log.info("생성된 게시물 번호:" + board.getBno());
		
	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
	}
	
	@Ignore
	public void testGet() {
		log.info(service.get(7L));
	}
	
	@Ignore
	public void testDelete() {
		log.info("삭제건수:" + service.remove(7L));
	}
	
	@Ignore
	public void testUpdate() {
		
		BoardVO board = service.get(5L);
		
		if(board == null) {//수정하려는 게시물이 없는 경우
			return;
		}
		
		board.setTitle("제목 수정합니다.");
		
		log.info("수정건수:" + service.modify(board));
	}
	
	
}




