package org.bigdata.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.bigdata.domain.SampleVO;
import org.bigdata.domain.Ticket;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;


//@RestController + @RequestBody
//RestController의 주된 기능은
//Json 형태로 객체 데이터를 변환하는 기능이다.
@RestController
//주소를 지정한다.
//http://localhost:8080/sample < 기본 URL
@RequestMapping("/sample")
//콘솔에 로그를 출력한다.
@Log4j
public class SampleController {

	//http://localhost:8080/sample/getText 라고 주소창에 입력하면
	//return값인 "안녕하세요" 나타남
	
	//전송방식이다(get)
	//produce : 생산하다. consumes: 소비하다. >> 서버가 클라이언트에게 문자열을 응답처리 한다는 선언

	@GetMapping(value="/getText", //클라이언트의 요청이 /getText"라는 URL이면
				produces="text/plain;charset=UTF-8") //"text/plain(문자열);charset=UTF-8"로 처리하겠다 라는 의미
	public String getText() {
		log.info("MIME TYPE:" + MediaType.TEXT_PLAIN_VALUE);
		
		return "안녕하세요";
	}
	
	//http://localhost:8080/sample/getSample
	//http://localhost:8080/sample/getSample.json -> 제이슨 형태로 나타남
	@GetMapping(value="/getSample",
			    produces= {
			    	MediaType.APPLICATION_JSON_UTF8_VALUE,
			    	MediaType.APPLICATION_XML_VALUE
			    })
	public SampleVO getSample() {
		
		return new SampleVO(112,"홍","길동");
	}
	
	
	//http://localhost:8080/sample/getList
	@GetMapping(value = "/getList")
	public List<SampleVO> getList(){
		
		//IntStream
		//정수형 스트림 선언
		return IntStream.range(1, 10)
				//1~9까지 반복을하면서 값을 i에 대입
				//3개의 매개변수를 가지고 생성자를 호출함
				.mapToObj(i -> new SampleVO(i,i + "First",i + "Last"))
				//결과값을 toList()함
				.collect(Collectors.toList());
	}
	
	
	//http://localhost:8080/sample/getMap
	@GetMapping(value = "/getMap")
	//key값이 String , value값이 SampleVO형태로 return을 하겠다 라는 의미
	public Map<String,SampleVO> getMap(){
		
		//Map : 인터페이스
		//HashMap : Map이라는 인터페이스를 가지고 구현된 구현객체(클레스)
		//HashMap(구현객체)가 Map(인터페이스)에 대입됨 - > 업캐스팅 된다.
		//업캐스팅 되면 구현객체 안에 있는 메서드에 접근이 불가능하게 된다.
		//구현객체 안에있는 메서드에 접근하기위해서 다운캐스팅을 해야 한다.
		//instanceof라는 연산자로 다운캐스팅이 가능한지 체크후 적용한다.
		
		//HashMap(구현객체)이 Map(인터페이스)에 업캐스팅 되었다.
		Map<String, SampleVO> map = new HashMap<>();
		map.put("First", new SampleVO(111,"그루트","주니어"));
		
		return map;
	}
	
	
	
	//http://localhost:8080/sample/check?height=xx&weight=xx
	//vsalue -> 주소값   
	//params -> 매개변수
	@GetMapping(value = "/check", params = {"height" , "weight"})
	
	//ResponseEntity : 서버가 응답 처리시 Body(데이터)와 http상태코드값을 같이 전송하여 처리함
	public ResponseEntity<SampleVO> check(Double height, Double weight){
		
		SampleVO vo = new SampleVO(0,"" + height, "" + weight);
		
		ResponseEntity<SampleVO> result = null;
		
		if(height < 150) {
			//상태 코드값을 502으로 처리. BAD_GATEWAY : 502
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		}else {
			//상태 코드값을 200으로 처리. OK : 200
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}
		return result;
	}
	
	//http://localhost:8080/sample/product/notebook/1234
	//{cat}/{pid} : 매개변수
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(
		//URL 주소값의 매개변수 값(/{cat}/{pid})을 가져와서 
		//String cat 에 대입한다.
		@PathVariable("cat") String cat,
		@PathVariable("pid") Integer pid){
		
		//String배열에 두개의 값(cat,pid)을 넣어서 return한다
		return new String[] {"category:" + cat, "produtid:" + pid};
		}
	
	//http://localhost:8080/sample/ticket
	@PostMapping("/ticket")
	//@RequestBody : 클라이언트에서 JSON형태의 데이터를 객체(java)에 매핑처리
	public Ticket convert(@RequestBody Ticket ticket) {
		
		log.info("convert.....ticket" + ticket);
		
		return ticket;
	}
}













