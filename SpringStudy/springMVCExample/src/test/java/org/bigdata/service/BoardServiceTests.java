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

	
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	
	
	@Ignore
	public void testExist() {
		
		log.info(service);
		assertNotNull(service); 
		// assertNotNull : 객체가 생성되어 있으면 객체를 리턴하고
		//				   생성되어 있지 않으면 Null을 리턴한다.	
	}
	
	@Ignore
	public void testRegister() {
		
		
		//new를 하게되면 BoardVO 인스턴스가 Heap 메모리에 생성
		//기본생성자를 호출
		BoardVO board = new BoardVO();
		
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		service.register(board);
		
		log.info("생성된 게시물의 번호:" + board.getBno());
	}
	
	@Test
	public void testGetList() {
		//service.getList().forEach(board -> log.info(board));
		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
	}
	
	
	
	@Ignore
	public void testGet() {
		
		log.info(service.get(2L));
	}
	
	@Ignore
	public void testDelete() {
		
		log.info("remove result:"+service.remove(2L));
	}
	
	
	@Ignore
	public void testUpdate() {
		BoardVO board = service.get(4L);
		
		if(board == null) {// 수정하려는 게시물이 없는 경우
			return;
		}
		
		board.setTitle("제목을 수정합니다.");
		log.info("modify result:" + service.modify(board));
	}
}







