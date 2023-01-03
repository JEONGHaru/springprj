package com.haru.service;

import java.util.List;

import com.haru.domain.BoardDTO;

public interface BoardService {

	public int register(BoardDTO board); //write , throws 가 없다 -> 없더라도 스프링 예외처리 advice쪽으로 가게된다
	
	public BoardDTO get(int bno); // detail 
	
	public boolean modify(BoardDTO board); // update
	
	public boolean remove(int bno); //delete
	
	public List<BoardDTO> getList(); // list
	
	
}
