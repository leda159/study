package org.bigdata.controller;

import org.bigdata.dto.Join;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//회원가입 URL 입력화면 실행
//http://localhost:8080/join

@Controller
public class ExamController {

	//클라이언트의 요청을 처리어노테이션
	//"/join" 이 들어오면 처리해준다는 의미
	// /join : //http:localhost:8080/join
	//get방식으로 url 처리한다
	@RequestMapping(value="/join",method=RequestMethod.GET)
	
	public String join() {
	
		//views 폴더의 join.jsp를 호출한다
		return "join";
	}
	
	
	
	@RequestMapping(value="/joinProcess",method=RequestMethod.POST)
		
	public String joinProcess(
			//@RequestParam : url 호출시 전달된 매개변수 값을 가져와서 변수에 대입
			//join에 name값을 가져와서 변수에 대입
			
			Model model,
			@RequestParam("id") String id,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("phone") String phone
			
			){
		
			//입력한 값을 받아서 객체 Model에 대입 
			//유효범위:request이므로 response 되면 소멸됨
			model.addAttribute("id",id);
			model.addAttribute("password",password);
			model.addAttribute("name",name);
			model.addAttribute("email",email);
			model.addAttribute("phone",phone);
			
			return "joinProcess";	
	}
	
	
	
	//입력받은 값을 자바클래스에 매핑처리
	@RequestMapping(value="joinProcess2",method=RequestMethod.POST)
	
	public String joinProcess2(Join join) {
		
		return "joinProcess2";
	}
	
}






