package org.bigdata.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

//해당 클래스가 Aspect 기능을 수행한다는 선언
@Aspect
//Bean등록을 자동으로 처리
@Component
@Log4j
public class LogAdvice {

	//AspectJ 문법을 이용하여 공통기능을
	//핵심기능 어디에 적용시킬건지 선언
	//첫번째 * : 접근제한자
	//org.bigdata.service 패키지에 있는 SampleService로
	//시작되는 클래스중 메서드 이름은 상관없고 매개변수의 갯수도 상관없다.
	@Before("execution(* org.bigdata.service.SampleService*.*(..))")
	public void logBefore() {
		
		log.info("=============================");
	}
	
	@Before("execution(* org.bigdata.service.SampleService*.doAdd(String,String)) && args(str1,str2)")
	public void logBeforeWithParam(String str1,String str2) {
		
		log.info("str1:" + str1);
		log.info("str2:" + str2);
		
	}
	
	//예외발생시 처리
	@AfterThrowing(pointcut = "execution(* org.bigdata.service.SampleService*.*(..))",throwing="exception")
	public void logException(Exception exception) {
		
		log.info("예외발생" + exception);
	}
	
	//공통기능(advice)이 Target(객체)의 핵심기능을 수행하기
	//전후에 실행되는 어노테이션
	//ProceedingJoinPoint?
	//business logic(핵심기능)을 수행한 결과를 가지는 객체
	@Around("execution(* org.bigdata.service.SampleService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
	
		long start = System.currentTimeMillis();
		
		//공통기능을 수행하는 Target의 메서드 이름을 리턴
		log.info("Target:" + pjp.getTarget());
		//공통기능을 수행하는 객체의 매개변수 값들을 리턴
		log.info("매개변수:" + Arrays.toString(pjp.getArgs()));

		Object result = null;
		
		try {
			//pjp.proceed()를 기준으로 이전에는
			//@Before가 실행되고 이후에는 @After가
			//실행
			result = pjp.proceed(); 
		}catch(Throwable e) {
			e.printStackTrace();
		}
		
		long end = System.currentTimeMillis();
		
		log.info("경과시간:" + (end-start));
		
		return result;
		
		
	}
	
}





