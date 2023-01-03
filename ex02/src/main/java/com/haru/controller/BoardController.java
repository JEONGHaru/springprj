package com.haru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haru.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
@AllArgsConstructor // private 멤버 변수의 생성자를 이용한  자동 DI
public class BoardController {

	private BoardService service;
	
	//게시판 리스트
	@GetMapping("/list")
	public void list(Model model) {
		log.info("---------list---------");
		model.addAttribute("list",service.getList());
	}
}
