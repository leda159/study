package org.bigdata.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

//페이징 처리를 위한 클래스
@Data
public class Criteria {

	//필드(=맴버변수=인스턴스변수)
	private int pageNum;//현재 페이지 번호
	private int amount;//한 페이지당 보여지는 행수
	
	private String type;//검색 조건
	private String keyword;//검색 문자열
	
	
	
	//생성자
	public Criteria() {
		this(1,10); //매개변수가 2개인 생성자 호출
	}
	
	//메소드
	public Criteria(int pageNum, int amount) { //현재 페이지번호가 1페이지 이고 한페이지당 10개를 보여줌
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	//검색기능 10.11 추가
	public String[] getTypeArr() {
		//검색 조건에 따라서 배열에 값을 대입한다.
		//type이 null이면 new String[] {} 아니면 공백을준다
		return type == null? new String[] {} : type.split("");
	}
	
	
	//10.11 추가 UriComponentsBuilder
	//http://localhost:8080/board/get?bno=2 뒤에 queryParam의 매개값들이 붙는다
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum" , this.pageNum)
				.queryParam("amount" , this.getAmount())
				.queryParam("type", getType())
				.queryParam("keyword", getKeyword());
		
		return builder.toUriString();
	}
}





