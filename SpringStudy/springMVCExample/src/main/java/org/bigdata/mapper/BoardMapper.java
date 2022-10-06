package org.bigdata.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.bigdata.domain.BoardVO;

public interface BoardMapper {

	//getList() 추상메서드가 호출되면 select문을 처리하여 
	//처리결과를 List<BoardVO>에 대입한다. 
	/* @Select("select * from tbl_board where bno > 0 order by bno desc") */
	public List<BoardVO> getList();
	
	
	//신규 게시물 추가
	public void insert(BoardVO board);
	
	
	//신규 게시물 추가(현재 추가되는 게시물번호를 리턴)
	public void insertSelectkey(BoardVO board);
	
	//특정 게시물 내역 상세보기
	public BoardVO read(Long bno);
	
	//특정 게시물 삭제
	public int delete(Long bno);
}
