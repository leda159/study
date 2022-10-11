package org.bigdata.Mapper;

import java.util.List;

import org.bigdata.domain.BoardVO;
import org.bigdata.domain.Criteria;
import org.bigdata.mapper.BoardMapper;
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
public class BoardMapperTests {

	//@Autowired : 자동주입한다
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Ignore
	public void testGetList() { //board는 변수에 List<BoardVO>를 대입해서 콘솔창에 띄운다 (계속 반복)
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Ignore
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("주문배송");
		board.setContent("빠르게 배송처리 요망");
		board.setWriter("홍길동");
		
		mapper.insert(board);
		
		log.info(board);
	}
	@Ignore
	public void testInsertSelectKey() {
		
		BoardVO board = new BoardVO();
		board.setTitle("반품요청");
		board.setContent("상품 오배송으로 반품");
		board.setWriter("이순신");
		
		mapper.insertSelectkey(board);
		
		log.info(board);
	}
	@Ignore
	public void testRead() {
		
		// 존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(5L);
		
		log.info(board);
	}
	@Ignore
	public void testDelete() {
		log.info("DELETE COUNT"+ mapper.delete(3L));
	}
	
	@Ignore
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		
		board.setBno(2L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");
		
		int count = mapper.update(board);
		log.info("update count:" + count);
	}
	
	@Ignore
	public void testPaging() {
		Criteria cri = new Criteria(); //인스턴스 생성
		
		//10개씩 3페이지
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	
	//검색처리 테스트 page334
	@Test
	public void testSearch() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("제목");
		cri.setType("TC");//제목+내용으로 검색
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
}














