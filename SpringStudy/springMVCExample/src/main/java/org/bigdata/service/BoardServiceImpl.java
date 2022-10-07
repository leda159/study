package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.BoardVO;
import org.bigdata.domain.Criteria;
import org.bigdata.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service //해당 클래스가 serivice 역할을 한다는 선언
@AllArgsConstructor //모든 매개변수를 가지는 생성자를 생성  
public class BoardServiceImpl implements BoardService{
	//스프링 프레임워크 4.3이상부터는 생략 가능
	//@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;	
	
	@Override
	public void register(BoardVO board) {
		
		log.info("register 메서드 실행" + board);
		
		mapper.insertSelectKey(board);
	}

	//특정 게시물 내역 리턴
	@Override
	public BoardVO get(Long bno) {
		log.info("get() 메서드 실행");
		
		return mapper.read(bno);
	}

	//특정 게시물 수정처리
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify() 메서드 실행");
		
		return mapper.update(board) == 1;
	}

	//특정 게시물 삭제 처리
	@Override
	public boolean remove(Long bno) {
		log.info("modify() 메서드 실행");
		
		return mapper.delete(bno) == 1;
	}

	//전체 게시물 목록 가져오기
	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("Criteria:" + cri);
		
		return mapper.getListWithPaging(cri);
	}

}
