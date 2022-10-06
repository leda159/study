package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.BoardVO;
import org.bigdata.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service //해당 클레스가 service 역할을 한다는선언
@AllArgsConstructor //모든 매개변수를 가지는 생성자를 생성
public class BoardServiceImpl implements BoardService {
	
	//스프링 프레임워크 4.3부터는 생략 가능
	//@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	
	@Override
	public void register(BoardVO board) {
		
		log.info("register...." + board);
		mapper.insertSelectkey(board);
		
	}

	//특정 게시물 내역 가져오기
	@Override
	public BoardVO get(Long bno) {
		
		log.info("get....." + bno);
		return mapper.read(bno);
	}

	//특정 게시물 수정하기
	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify....." +board);
		return mapper.update(board) == 1; 
		//수정이 제대로 되었으면 1이 리턴되므로 true여서 메서드가 작동함
	}

	//특정 게시물 삭제하기
	@Override
	public boolean remove(Long bno) {
		
		log.info("remove...."+bno);
		return mapper.delete(bno) == 1;
	}

	//전체 게시물 목록 가져오기
	@Override
	public List<BoardVO> getList() {
		
		log.info("getList.....");
		return mapper.getList();
	}



	
}
