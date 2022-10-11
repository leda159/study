package org.bigdata.service;

import java.util.List;

import org.bigdata.domain.BoardVO;
import org.bigdata.domain.Criteria;

public interface BoardService {

	//인터페이스 사용목적 : 인터페이스를 가지고 여러가지 구현객체 생성 -> 다형성
	
	// 5개의 추상메서드
	public void register(BoardVO board);//신규 게시물 등록
	public BoardVO get(Long bno);//특정 게시물 상세보기
	public boolean modify(BoardVO board);//특정 게시물 수정
	public boolean remove(Long bno);//특정 게시물 삭제
	//public List<BoardVO> getList();//게시판 전체 목록
	public List<BoardVO> getList(Criteria cri);
	//게시판 전체 행수10.11
	public int getTotal(Criteria cri);
}
