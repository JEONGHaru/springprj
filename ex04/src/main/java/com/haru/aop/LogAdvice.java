package com.haru.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {

	// * : 대체문자 - 0개이상의문자
	//.. : 인수가 여러개
	@Before("execution(* com.haru.service.SampleService*.*(..))")
	public void logBefore() {
		log.info("=========================================");
	}
	
	//넘어가는 데이터를 확인하고 실행시간을 확인하는 Advice
	// PJP - 처리 되는 정보가 담겨있는 객체
	@Around("execution(* com.haru.service.SampleService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		
		Object result = null;
		//실행 시작 시간
		long start = System.nanoTime();
		
		//넘어가는 데이터나 실행 클래스 정보
		log.info("Target ----- : "  + pjp.getTarget());
		log.info("param ----- : "  + Arrays.toString(pjp.getArgs()));
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		//실행 결과 확인
		log.info("result : " + result);
		
		//실행 종료 시간
		long end = System.nanoTime();
		
		log.info("TIME : " + (end-start));
		
		return result;
	}
}
