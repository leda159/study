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
	
	
	//약식으로 배열 초기값 선언
	//int [] a = new int[]{80L,34L,35L,36L,37L}; -> 정규식
	private Long[] bnoArr = {80L,34L,35L,36L,37L};

	
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;	
	
	@Ignore
	public void testMapper() {
		log.info(mapper);
	}
	
	@Ignore
	public void testCreate() {
		
		//i에 1~9까지 대입
		IntStream.rangeClosed(1, 10).forEach(i ->{
			ReplyVO vo = new ReplyVO();//인스턴스 생성
			
			//게시물의 번호
			vo.setBno(bnoArr[i % 5]); //i=1 이면 나머지 1
			vo.setReply("댓글 테스트" + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo); //ReplyMapper.xml 으로 이동
		});
	}
	
	@Ignore
	public void testRead() {
		Long targetRno = 5L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Ignore
	public void testDelete() {
		
		Long targetRno = 5L;
		
		mapper.delete(targetRno);
	}
	
	@Ignore
	public void testUpdate() {
		
		Long targetRno = 7L;
		
		//댓글 내역 존재 체크
		ReplyVO vo = mapper.read(targetRno); // 댓글내역을 가져와서 vo에 담는다
		
		vo.setReply("업데이트 수정"); //댓글내용을 "" 로 바꾼다
		
		int count = mapper.update(vo); //mapper의update메서드에 매개변수로 vo로 보낸다
		
		log.info("업데이트 수정" + count); 
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		//특정 게시물에 대한 댓글을 가져와서
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		//댓글 내역을 콘솔창에 출력
		replies.forEach(reply -> log.info(reply));
	}
}










