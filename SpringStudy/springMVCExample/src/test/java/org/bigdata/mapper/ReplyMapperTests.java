package org.bigdata.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.bigdata.domain.Criteria;
import org.bigdata.domain.ReplyVO;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	//게시물 번호 배열
	private Long[] bnoArr = {2L,3L,4L,5L,9L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;	
	
	@Ignore
	public void testMapper() {
		log.info(mapper);
	}
	
	@Ignore
	public void testCreate() {
		
		IntStream.rangeClosed(1,10)
				 .forEach(i -> {
					 ReplyVO vo = new ReplyVO();
					 
					 vo.setBno(bnoArr[i % 5]);
					 vo.setReply("댓글테스트 " +i);
					 vo.setReplyer("replyer" + i);
					 
					 mapper.insert(vo);
				 });
	}
	
	
	@Ignore
	public void testRead() {
		
		Long targetRno = 5L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
		
	}
	
	//특정 댓글 삭제 
	@Ignore
	public void testDelete() {
		
		Long targetRno = 5L;
		
		mapper.delete(targetRno);
		
	}
	
	@Ignore
	public void testUpdate() {
		
		Long targetRno = 7L;
		
		//댓글내역 존재 체크
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("수정 댓글");
		
		int count = mapper.update(vo);
		
		log.info("수정 건수:" + count);
		
	}
	
	@Ignore
	public void testList() {
		
		Criteria cri = new Criteria();
		//특정 게시물에 대한 댓글을 리턴
		List<ReplyVO> replies = mapper.getListWithPaging(cri,bnoArr[0]);
		
		//댓글내역을 콘솔창에 출력
		replies.forEach(reply -> log.info(reply));
		
	}
	
	
	//p431
	@Test
	public void testList2() {
		
		Criteria cri = new Criteria(1,10);
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri,3L);
		
		replies.forEach(reply -> log.info(reply));
		
	}
	
}







