package org.bigdata.controller;

import java.util.ArrayList;

import org.bigdata.domain.SampleDTO;
import org.bigdata.domain.TodoDTO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

//@Controller?
//해당 클래스가 클라이언트의 요청 URL을 처리하는
//클래스임을 선언하고 Model 객체를 생성하여 데이터를 담아
//View에 전달하는 기능을 수행
@Controller
//http://localhost:8080/sample : 기본 url
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	//날짜 매개 변수를 바인딩시 날짜를 검증하기 위한 어노테이션
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		
//		binder.registerCustomEditor(java.util.Date.class,(PropertyEditor) new CustomDateEditor(dateFormat,false));
//	}
	
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public void basic() {
		log.debug("basic() 메서드 실행");
	}
	
	//http://localhost:8080/sample/basic
	@RequestMapping(value="/basic",
			       method= {RequestMethod.GET,RequestMethod.POST})
	public void basicGet() {
		log.info("basicGet() 메서드 실행중");
	}
	
	//http://localhost:8080/sample/basicOnlyGet
	//을 전송방식 get으로 처리
	@GetMapping("/basicOnlyGet")
	public void basicGet2() {
		log.info("basicGet2() 메서드 실행중");
	}
	
	//page 131
	//http://localhost:8080/sample/ex02?name=admin&age=30
	@GetMapping("/ex02")
	public String ex02(Model model,
			//주소 url에 전달되는 매개변수를 받아서
			//변수에 대입처리하는 어노테이션
			@RequestParam("name") String name,
			@RequestParam("age") int age) {
		
		log.info("이름:" + name);
		log.info("나이:" + age);
		
		model.addAttribute("name",name);
		model.addAttribute("age",age);
	
		
		return "ex02";
	}
	
	@GetMapping("/fruitList")
	public String fruitList(Model model) {
		
		ArrayList<String> fruitList 
					= new ArrayList<String>();
		
		fruitList.add("사과");
		fruitList.add("배");
		fruitList.add("멜론");
		fruitList.add("수박");
		
		model.addAttribute("fruitList",fruitList);
		
		return "fruitList";
	}
	
	//http://localhost:8080/sample/ex03?title=test&dueDate=2022-10-0
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		log.info("todo: " + todo);
		
		return "ex03";
	}
	
	//http://localhost:8080/sample/ex04?name=hong&age=30&page=3
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto,
			           @ModelAttribute("page") int page) {
		
		log.info("dto:" + dto);
		log.info("page:" + page);

		
		return "/sample/ex04";
	}
	
	//@ResponseBody?
	//메서드에서 리턴되는 값을 view를 이용하여 출력하지
	//않고 Http Response Body에 직접 대입된다.
	//대입되기 전에 MessageConverter에서 변환이 된후
	//대입된다. 결과값은 JSON 형태로 리턴
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		log.info("/ex06 실행");
		
		SampleDTO dto = new SampleDTO();
		
		dto.setName("홍길동");
		dto.setAge(10);
		
		return dto;
	}
	
	
	//ResponseEntity?
	//HttpEntity를 상속받은 객체로
	//결과 데이터와 http 상태코드를 개발자가 직접 제어
	//가능한 어노테이션
	@GetMapping("/ex07")
	public ResponseEntity<String> ex07(){
		log.info("/ex07 실행");
		
		//응답처리시 json 형태로 리턴
		String msg = "{\"name\": \"홍길동\"}";
		
		//헤더정보
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type","application/json;charset=UTF-8");
		
		return new ResponseEntity<>(msg,header,HttpStatus.OK);
		
	}
	
	//void로 메서드가 선언되면 url위치에 jsp를 생성해야
	//하므로 views > sample 폴더에 exUpload.jsp 생성
	//http://localhost:8080/sample/exUpload
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUplod 실행");
	}
	
	
	
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files) {
		
		//람다식과 반복문을 사용하여 업로드 파일 내역을 출력
		files.forEach(file -> {
			log.info("-------------------------");
			log.info("name:" + file.getOriginalFilename()); //서버에 업로드한 원본 파일명
			log.info("size:" + file.getSize());
		});
	}

}









