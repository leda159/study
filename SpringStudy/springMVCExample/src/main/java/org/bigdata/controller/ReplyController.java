package org.bigdata.controller;

import java.util.List;

import org.bigdata.domain.Criteria;
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

//hppt://localhost:8080/replies/
//기본URL 지정
@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
//@AllArgsConstructor을 선언하므로 자동주입이된다
//@Setter(noMethod_ = @Autowired) 생략 가능
public class ReplyController {

	//ReplyService인터페이스를 사용하는 service 필드를 선언
	private ReplyService service;
	
	//신규 댓글 등록 처리
	//post방식
	//hppt://localhost:8080/replies/new
	@PostMapping(value = "/new",
			//consumes : 서버기준으로 서버가 소비한다.
			//클라이언트 요청중에서 MIME이 
			//"application/json"로 요청되는것만 처리한다 
				consumes = "application/json",
			
			//consumes: 서버가 생산을 한다.
			//서버가 클라이언트에게 응답 처리를 해줄때 자료형태를 선언한다.
			//TEXT_PLAIN_VALUE : 문자열 형태로 응답 처리를 한다.
				produces = {MediaType.TEXT_PLAIN_VALUE})
	
	//ResponseEntity : body의 값과 Http상태 코드값을 전송한다
	//<String> : body 내용은 String타입으로 넘어간다 
	//@RequestBody : JSON 형태의 데이터를 객체로 변환처리(매핑)를 한다 
	
	
	//@RequestBody을 사용하면 ReplyVO vo에 값이 들어온다
	//ReplyVO 형태의 vo 참조 변수에 매핑을 한다
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		
		log.info("ReplyVO" + vo);
		
		//(vo) 로직 순서
		
		//이 페이지 위에 선언 되어있음 ReplyService 인터페이스에 이동
		//ReplyService를 상속받은 ReplyServiceImpl으로 이동
		//ReplyMapper 에있는 insert(ReplyVO vo)
		//최종적으로 xml에 insert가 작동
		int insertCount = service.register(vo);
		
		log.info("Reply INSERT COUNT:" + insertCount);
		
		//리턴되는 값이 1 이면 삼항연산자를 통해서 1? 참 : 거짓
		return insertCount == 1?
				new ResponseEntity<>("success",HttpStatus.OK)//성공시 200
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);//실패시 500
	}
	
	
	
	
	
	
	
	
	//특정 게시물 댓글 목록
	//http://localhost:8080/replies/pages/게시물번호/페이지번호
	@GetMapping(value = "/pages/{bno}/{page}",
				produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE })
	
	//<List<ReplyVO>> : 리턴타입
	//ReplyVO형태의 리스트구조 
	//@PathVariable을 사용해서 {bno},{page} 값을 가져온다
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("page") int page,
			@PathVariable("bno") Long bno){
		
		log.info("getList......" );
		//몇페이지에서 , 댓글을 몇개까지 보여준다 (10개)
		Criteria cri = new Criteria(page,10);
		
		log.info(cri);
		return new ResponseEntity<>(service.getList(cri, bno),HttpStatus.OK);
	}
	
	
	
	
	
	
	//특정 댓글 상세 보기처리
	//http://localhost:8080/replies/{rno}
	@GetMapping(value = "/{rno}",
			//xml 형태  json 형태로 볼수있다.
			produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE	})
	
	//rno 값을 가져오기위해서 @PathVariable를 사용
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		
		log.info("get:" + rno);
		
		return new ResponseEntity<>(service.get(rno),HttpStatus.OK);
	}
	
	
	
	
	
	
	//특정 댓글 삭제 처리
	@DeleteMapping(value = "/{rno}",
			//문자열 형태로 본다
			produces = {MediaType.TEXT_PLAIN_VALUE})
	
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		
		log.info("remove" + rno);
		
		
		return service.remove(rno) == 1
				? new ResponseEntity<>("success" , HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	
	
	//특정 댓글 수정 처리
	//http://localhost:8080/replies/{rno}
	//http://localhost:8080/replies/12
	@RequestMapping (
			method = {RequestMethod.PUT,RequestMethod.PATCH},
			value = "/{rno}",
			//클라이언트 MIME 형태중에서 jsno 테이더 요청만 처리
			consumes = "application/json",
			//서버가 클라이언트에게 응답시 자료형태 선언
			produces = {MediaType.TEXT_PLAIN_VALUE})
	
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
			
			//매개변수로 전달된 댓글번호를 필드에 대입
			vo.setRno(rno);
			log.info("rno:" + rno);
			log.info("modify:" + vo);
		
		
			return service.modify(vo) == 1
				? new ResponseEntity<>("success" , HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
















