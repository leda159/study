package org.bigdata.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.ReplyVO;

public interface ReplyMapper {
	
	//신규 댓글 추가 처리
	public int insert(ReplyVO vo);
	
	//특정 댓글 내역 처리
	public ReplyVO read(Long rno);
	
	//특정 댓글 삭제 처리
	public int delete(Long rno);
	
	//특정 댓글 수정 처리
	public int update(ReplyVO reply);
	
	//페이징 처리 한 게시물 목록 
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	//p432 특정 게시물에 대한 댓글 행수 구하기
	public int getCountByBno(Long bno);
	

}




