package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.Criteria;
import org.bigdata.domain.ReplyVO;
import org.bigdata.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
//@Service 선언해야지 bean 등록이 된다.
//ReplyServiceImpl : 구현객체 
public class ReplyServiceImpl implements ReplyService {

	//인터페이스에 자동 주입을 한다
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	
	
	@Override
	//ReplyMapper.java에 있는 insert 이동
	//최종적으로 xml에 있는 insert 태그가 동작한다.
	// 어디서 ReplyVO를 받아오는지? 
	public int register(ReplyVO vo) {
		log.info("register메서드" + vo);
		return mapper.insert(vo);
	}

	//특정 댓글 상세 보기
	@Override
	public ReplyVO get(Long rno) {
		log.info("get메서드" + rno);
		return mapper.read(rno);
	}

	//특정 댓글 수정 처리
	@Override
	public int modify(ReplyVO vo) {
		log.info("modify메서드" + vo);
		return mapper.update(vo);
	}

	//특정 댓글 삭제 처리
	@Override
	public int remove(Long rno) {
		log.info("remove메서드" + rno);
		return mapper.delete(rno);
	}

	//특정 댓글 상세 보기
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board" + bno);
		return mapper.getListWithPaging(cri, bno);
	
	}
}
