package org.bigdata.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

//@ControllerAdvice :전역에서 발생하는 예외처리를 한다는 어노테이션
@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	
	//Exception은 예외처리의 최고 조상이다
	@ExceptionHandler(Exception.class)
	public String except(Exception ex, Model model) {
		
		log.error("Exception....." + ex.getMessage());
		model.addAttribute("exception",ex);
		log.error(model);
		return "error_page";
	}
	
	
	//NoHandlerFoundException.class : 
	//클라이언트가 요청을 하는 컨트롤러 메서드가 없는
	//url에 접속하려할 때 발생하는 예외
	@ExceptionHandler(NoHandlerFoundException.class)
	//응답처리시 상태코드값을 리턴
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handler404(NoHandlerFoundException ex) {
		
		return "custom404";
	}
}
