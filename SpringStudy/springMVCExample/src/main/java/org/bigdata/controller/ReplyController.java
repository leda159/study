package org.bigdata.controller;

import org.bigdata.domain.Criteria;
import org.bigdata.domain.ReplyPageDTO;
import org.bigdata.domain.ReplyVO;
import org.bigdata.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
//http://localhost:8080/replies
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	//신규 댓글 등록 처리
	//http://localhost:8080/replies/new
	@PostMapping(value="/new",
				//클라이언트의 요청중에서 MIME이
				//application/json로 요청되는것만 처리
				 consumes = "application/json",
				 //서버가 클라이언트에게 응답시 문자열 형태로 응답	 
				 produces = {MediaType.TEXT_PLAIN_VALUE})
	//ResponseEntity? body + 상태코드값을 전송
	//@RequestBody : json 형태의 데이터를 객체로 변환처리
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
	
		log.info("ReplyVO:" + vo);
		
		int insertCount = service.register(vo);
		
		log.info("댓글 등록 건수:" + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success",HttpStatus.OK)//성공시 200
				                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);//500 리턴
	}
	
	//특정 게시물 댓글 목록
	//http://localhost:8080/replies/pages/게시물번호/페이지번호
	@GetMapping(value="/pages/{bno}/{page}",
				produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(
							@PathVariable("page") int page,
							@PathVariable("bno") Long bno){
		
		Criteria cri = new Criteria(page,10);
		log.info(cri);
		
		return new ResponseEntity<>(service.getListPage(cri,bno),HttpStatus.OK);
		
	}
	
	//특정 댓글 상세보기 처리
	//http://localhost:8080/replies/{rno}
	@GetMapping(value="/{rno}",produces= {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(
			@PathVariable("rno") Long rno){
		
		return new ResponseEntity<>(service.get(rno),HttpStatus.OK);
	}
	
	//특정 댓글 삭제 처리
	@DeleteMapping(value="/{rno}",produces= {
		MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		
		return service.remove(rno) == 1 ?
			   new ResponseEntity<>("success",HttpStatus.OK) :
			   new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
	//특정 댓글 수정 처리
	//http://localhost:8080/replies/12
	@RequestMapping(
			value="/{rno}",
			method= {RequestMethod.PUT,RequestMethod.PATCH},
			//서버가 클라이언트에게 응답시 자료형태 선언
			produces= {MediaType.TEXT_PLAIN_VALUE},
			//클라이언트 MIME 형태중에서 json 데이터 요청만 처리
			consumes="application/json")
		public ResponseEntity<String> modify(
				@RequestBody ReplyVO vo,
				@PathVariable("rno") Long rno){
			
			vo.setRno(rno);//매개변수로 전달된 댓글번호를 필드에 대입
		
			return service.modify(vo) == 1 ?
				   new ResponseEntity<>("success",HttpStatus.OK) :
				   new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
					
		}
	
}






