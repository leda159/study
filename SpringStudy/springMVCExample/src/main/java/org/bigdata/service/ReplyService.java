package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.Criteria;
import org.bigdata.domain.ReplyPageDTO;
import org.bigdata.domain.ReplyVO;

public interface ReplyService {

	//신규 댓글 등록 처리
	public int register(ReplyVO vo);
	
	//특정 댓글 상세내역 처리
	public ReplyVO get(Long rno);
	
	//특정 댓글 수정 처리
	public int modify(ReplyVO vo);
	
	//특정 댓글 삭제 처리
	public int remove(Long rno);
	
	//특정 게시물번호에 대한 댓글 리스트
	public List<ReplyVO> getList(Criteria cri,Long bno);
	
	//페이징 처리를 한 댓글 리스트 
	public ReplyPageDTO getListPage(Criteria cri,Long bno);
	
}



