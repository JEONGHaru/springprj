package com.haru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/")
@Log4j
public class BoardController {

	 @GetMapping("list")
	 public void list() {
		 log.info("게시판 리스트");
	 }
	 
	 @GetMapping("detail")
	 public void detail() {
		 log.info("게시판 글보기");
	 }
	 
	 @GetMapping("write")
	 public void writeForm() {
		 log.info("게시판 글쓰기 폼");
	 }
	 
	 @PostMapping("write")
	 public String write() {
		 log.info("게시판 글쓰기 처리");
		 return "redirect:list";
	 }
}
