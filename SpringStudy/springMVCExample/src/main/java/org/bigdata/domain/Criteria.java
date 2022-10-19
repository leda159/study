package org.bigdata.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

//페이징 처리를 위한 클래스
@Data
public class Criteria {

	//필드(=멤버변수=인스턴스변수)
	private int pageNum;//현재 페이지 번호
	private int amount;//한 페이지당 보여지는 행수
	
	//page334 검색관련 필드 추가
	private String type;//검색조건
	private String keyword;//검색문자열
	
	public Criteria() {//기본생성자
		this(1,10);//매개변수 2개 생성자호출
	}
	
	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		//검색조건에 따라 배열에 값을 대입
		return type == null ? new String[] {} : type.split(""); 
	}
	
	//http://localhost:8080/board/get?bno=2&pageNum=XX&amount=XX&type=XX&keyword=XX
	public String getListLink() {
		//page349
		UriComponentsBuilder builder = 
				UriComponentsBuilder.fromPath("")
				.queryParam("pageNum",this.pageNum)
				.queryParam("amount",this.getAmount())
				.queryParam("type",this.getType())
				.queryParam("keyword",this.getKeyword());
		
		return builder.toUriString();
		
	}
	
	
	
	
}






