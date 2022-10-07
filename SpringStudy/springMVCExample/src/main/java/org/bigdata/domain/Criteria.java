package org.bigdata.domain;

import lombok.Data;

//페이징 처리를 위한 클래스
@Data
public class Criteria {

	//필드(=멤버변수=인스턴스변수)
	private int pageNum;//현재 페이지 번호
	private int amount;//한 페이지당 보여지는 행수
	
	public Criteria() {//기본생성자
		this(1,10);//매개변수 2개 생성자호출
	}
	
	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
