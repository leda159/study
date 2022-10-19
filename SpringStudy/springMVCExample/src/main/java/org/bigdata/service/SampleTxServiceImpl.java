package org.bigdata.service;

import org.bigdata.mapper.Sample1Mapper;
import org.bigdata.mapper.Sample2Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service //서비스 기능 수행 & 빈등록
@Log4j
public class SampleTxServiceImpl implements SampleTxService {
	
	@Setter(onMethod_ = @Autowired)
	private Sample1Mapper mapper1;
	
	@Setter(onMethod_ = @Autowired)
	private Sample2Mapper mapper2;

	//트랜잭션 처리시 여러개의 Task중 한개라도
	//실패시 rollback처리하고 모두 성공하면 commit
	@Transactional
	@Override
	public void addData(String value) {
		
		log.info("mapper1.......");
		mapper1.insertCol1(value);
		
		log.info("mapper2.......");
		mapper2.insertCol2(value);
		
		log.info("end.....");
	}

}
