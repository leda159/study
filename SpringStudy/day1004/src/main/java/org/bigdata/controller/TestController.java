package org.bigdata.controller;

import org.bigdata.dto.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

//http://localhost:8080/test
@RequestMapping("/test/*")
public class TestController {
	
	@GetMapping("/student")
	public String studentInput() {
		
		//views 폴더에 생성
		return "student";
	}
	
	
	@PostMapping("/studentProcess")
	public String studentProcess(Student student) {
		return "studentProcess";
	}
}
