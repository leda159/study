package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.Criteria;
import org.bigdata.domain.ReplyPageDTO;
import org.bigdata.domain.ReplyVO;
import org.bigdata.mapper.BoardMapper;
import org.bigdata.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	//인터페이스 자동 주입
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	//댓글수 업데이트를 위해 선언
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;

	@Transactional//댓글 추가시 tbl_board 테이블 댓글수 컬럼 + 1
	//신규 댓글 등록 처리
	@Override
	public int register(ReplyVO vo) {
	
		return mapper.insert(vo);
	}

	//특정 댓글 상세내역 처리
	@Override
	public ReplyVO get(Long rno) {
		
		return mapper.read(rno);
	}

	//특정 댓글 수정 처리
	@Override
	public int modify(ReplyVO vo) {

		return mapper.update(vo);
	}

	//댓글 추가시 tbl_board 테이블 댓글수 컬럼 - 1
	@Transactional
	//특정 댓글 삭제 처리
	@Override
	public int remove(Long rno) {
		
		return mapper.delete(rno);
	}

	//특정 게시물 번호에 대한 댓글 리스트
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		
		return mapper.getListWithPaging(cri,bno);
	}

	//페이징 처리를 한 댓글 리스트 
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(mapper.getCountByBno(bno),mapper.getListWithPaging(cri,bno));
	}

}




