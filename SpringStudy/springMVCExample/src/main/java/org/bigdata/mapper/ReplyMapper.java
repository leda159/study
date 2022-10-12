package org.bigdata.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.ReplyVO;

public interface ReplyMapper {
	//넘어온 매개변수가 최종적으로 ReplyMapper.xml로 넘어간다.
	
	//신규 댓글 추가 처리
	public int insert(ReplyVO vo);
	
	//특정 댓글 내역 처리
	public ReplyVO read (Long rno);
	
	//삭제
	public int delete (Long rno);
	
	//수정
	public int update(ReplyVO reply);
	
	//페이징 처리 한 게시물 목록
	public List<ReplyVO>getListWithPaging(
			 //("cri")를 cir(변수에) 대입한다
			 //대입을 하면 #{} 형태로 사용 가능하다
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
}
