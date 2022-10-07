package org.bigdata.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Long bno;//게시판번호
	private String title;//제목
	private String content;//내용
	private String writer;//작성자
	private Date regdate;//등록일자
	private Date updatedate;//수정일자
	
}
