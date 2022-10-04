package org.bigdata.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	//@Select : select문을 실행하는 어노테이션
	//sysdate : oracle 서버 시간
	//now()   : mysql 서버 시간
	//dual    : dummy table(없는 테이블) 
	@Select("select sysdate from dual")
	public String getTime(); // 서버의 시간을 가져온다
	
	public String getTime2();
}
