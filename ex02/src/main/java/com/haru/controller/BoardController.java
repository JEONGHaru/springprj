package com.haru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haru.domain.BoardDTO;
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
	
	@GetMapping("/getList")
	public ModelAndView getList() {
		log.info("---------getList---------");
		
		ModelAndView mav = new ModelAndView();
		//처리된 데이터 저장
		mav.addObject("list",service.getList());
		//JSP 정보를 저장
		mav.setViewName("board/list");
		
		return mav;
	}
	
	//게시판 등록 폼
	@GetMapping("/register")
	public void register() {
		
	}
	//게시판 등록 처리
	@PostMapping("/register")
	public String register(BoardDTO board, RedirectAttributes rttr) {
		service.register(board);
		log.info("----------register------------" + board);
		
		rttr.addFlashAttribute("result","register success bno : "+board.getBno());
		return "redirect:list";
	}
	
	//게시판 글보기
	@GetMapping({"/get","/modify"})
	public void register(@RequestParam("bno") int bno, Model model) {
		log.info("----------get or modify------------" + bno);
		model.addAttribute("board", service.get(bno));
	}
	
	//게시판 글수정 처리
	@PostMapping("/modify")
	public String modify(BoardDTO board, RedirectAttributes rttr) {
		log.info("----------modify------------" + board);
		if(service.modify(board))
		rttr.addFlashAttribute("result","modify success bno : " + board.getBno());
		return "redirect:get?bno=" + board.getBno();
	}
	
	//게시판 글삭제
		@PostMapping("/remove")
		public String modify(@RequestParam("bno") int bno, RedirectAttributes rttr) {
			log.info("----------remove------------" + bno);
			if(service.remove(bno))
			rttr.addFlashAttribute("result","remove success");
			return "redirect:list";
		}
}
