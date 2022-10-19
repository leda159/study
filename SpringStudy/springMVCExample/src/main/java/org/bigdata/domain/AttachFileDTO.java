package org.bigdata.domain;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String fileName;//원본파일 이름
	private String uploadPath;//업로드 경로
	private String uuid;//uuid값
	private boolean image;//업로드 파일 이미지인지 여부
}





