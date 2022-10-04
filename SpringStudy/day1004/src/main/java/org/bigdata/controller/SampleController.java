package org.bigdata.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;


//@Controller : 해당 클래스가 클라이언트의 요청URL을 처리하는 클래스임을 선언하고
//              Model 객체를 생성하여 데이터를 담아 view에 전달하는 기능을 수행함
//http://localhost:8080/sample : 기본 URL

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	
	//http://localhost:8080/sample
	@RequestMapping("")
	public void basic() {
		log.debug("basic() 메서드 실행");
	}
	
	//http://localhost:8080/sample/basic
	@RequestMapping(value="/basic",method= {RequestMethod.GET,RequestMethod.POST})
	public void basicGet() {
		log.info("basicGet() 실행중");
	}
	
	//http://localhost:8080/sample/basicOnlyGet 을 전송방식 get으로 처리
	@GetMapping("/basicOnlyGet/")
	public void basicGet2() {
		log.info("basicGet2() 실행");
	}
	
	//page 131
	//http://localhost:8080/sample/ex02
	@GetMapping("/ex02")
	public String ex02(Model model,
		
			//주소 url에 전달되는 매개변수를 받아서 변수에 대입처리하는 어노테이션
			@RequestParam("name")String name, 
			@RequestParam("age")int age){
		
		log.info("name:"+name);
		log.info("age:"+age);
		
		model.addAttribute("name",name);
		model.addAttribute("age",age);
		
		return "ex02";
	}
	
	//장바구니
	//http:localhost:8080/sample/fruitList
	@GetMapping("/fruitList")
	public String fruitList(Model model) {
		
		ArrayList<String> fruitList = new ArrayList<String>();
		
		fruitList.add("사과");
		fruitList.add("배");
		fruitList.add("멜론");
		fruitList.add("수박");
		
		model.addAttribute("fruitList",fruitList);
		
		return"fruitList";
		
	}
	
}












