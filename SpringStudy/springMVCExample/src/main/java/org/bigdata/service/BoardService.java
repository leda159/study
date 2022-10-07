package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.BoardVO;
import org.bigdata.domain.Criteria;


//인터페이스 사용 목적?
//인터페이스를 가지고 여러가지 구현객체를 생성-> 다형성
public interface BoardService {

	//신규 게시물 등록
	public void register(BoardVO board);
	
	//특정 게시물 상세보기
	public BoardVO get(Long bno);
	
	//특정 게시물 수정
	public boolean modify(BoardVO board);
	
	//특정 게시물 삭제
	public boolean remove(Long bno);
	
	//전체 게시물 목록
	public List<BoardVO> getList(Criteria cri);
	
}





