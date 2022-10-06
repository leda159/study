package org.bigdata.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExamController {
	
	@RequestMapping(value="/join",method=RequestMethod.GET)//화면을 띄우기위해서 get방식으로 사용
	
	//Model:유효범위>request
	public String join(HttpSession session) {
		
		session.setAttribute("id", "test");
		session.setAttribute("name", "홍길등");
		session.setAttribute("passwd", "test1234");
		session.setAttribute("phone", "010-1234-5678");
		session.setAttribute("email", "test@naver.com");
		
		return "join";
		
		
	}
	
	@RequestMapping(value="/joinResult",method=RequestMethod.GET)
		public String joinResult() {
		
		return "joinResult";
		}
}
