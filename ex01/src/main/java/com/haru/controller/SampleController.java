package com.haru.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.haru.domain.SampleDTO;
import com.haru.domain.SampleDTOList;
import com.haru.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	@RequestMapping("")
	public void basic() {
		log.info("basic....");
	}
	
	@RequestMapping(value = "/basic",method = {RequestMethod.GET,RequestMethod.POST})
	public void basicGet() {
		log.info("basic get.....");
	}
	
	@GetMapping("basicOnlyGet")
	public void basicGet2() {
		log.info("basic get only.....");
	}
	
	@PostMapping("/basicPost")
	public void basicPost() {
		log.info("basic post......");
	}
	
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info(""+dto);
		
		return "ex01";
	}
	
	@GetMapping("/ex01_name")
	public String ex01_name(@RequestParam("n")String name) {
		log.info(""+name);
		
		return "ex01_name";
	}
	@GetMapping("/ex01_age")
	// @RequestParam - 전달되는 파라미터의 이름과 프로퍼티 이름이 다른경우 , 기본값이 필요한경우 사용됨
	public String ex01_age(@RequestParam(defaultValue="10")int age) {
		log.info(""+age);
		
		return "ex01_age";
	}
	
	@GetMapping("/ex02List")
	// ArrayList 데이터를 여러개 받을때에는 @RequestParam annotation이 필요
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		log.info("ids : " +ids);
		
		return "ex02List";
	}
	
	@GetMapping("/ex02Beans")
	//http://localhost:8080/sample/ex02Beans?list%5B0%5D.name=jeong&list%5B0%5D.age=10&list%5B1%5D.name=lee&list%5B1%5D.age=20
	public String ex02Beans(SampleDTOList list) {
		log.info("list dtos : "+list);
		
		return "ex02Beans";
	}
	
	@GetMapping("/ex03")
	public String ex03(TodoDTO dto) {
		log.info("dto : "+dto);
		
		return "ex03";
	}
	
	@GetMapping("/ex04")
	//파라미터로 받은 DTO는 request에 담겨서 JSP까지 넘어간다.주소가 아닌 순수 값은 넘어가지 않는다(ex:page)
	//넘기고 싶은경우 @Modelattribute를 사용
	public String ex04(SampleDTO dto,@ModelAttribute("page") int page) {
		log.info("dto : "+dto);
		log.info("page : "+page);
		
		return "/sample/ex04";
	}
}
