package org.bigdata.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno;//댓글번호
	private Long bno;//게시물번호
	private String reply;//댓글내용
	private String replyer;//댓글작성자
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",
			    timezone="Asia/Seoul")
	private Date replyDate;//등록일자
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",
		    timezone="Asia/Seoul")
	private Date updateDate;//수정일자
}




