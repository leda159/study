package org.bigdata.domain;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage;//화면 하단 페이지 시작번호
	private int endPage;//화면 하단 페이지 종료변호
	private boolean prev,next;//이전,이후 버튼 표시 여부
	
	private int total;//총 게시물 건수
	
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//getPageNum():현재 작업중인 하단 페이지
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10; //ceil 소수점 뒷자리를 앞으로 올린다
		this.startPage = this.endPage -9;
		
		//실제 마지막 페이지 계산
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		
		//실제 페이지수가 만약 마지막 페이지보다 작으면 실제 페이지수를 마지막 페이지로
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		//이전 존재여부 체크
		this.prev = this.startPage > 1;
		//다음 페이지가 있는 지체크
		this.next = this.endPage < realEnd;
	}
}
