package com.haru.service;

import java.util.List;

import com.haru.domain.BoardAttachDTO;
import com.haru.domain.BoardDTO;
import com.haru.domain.Criteria;

public interface BoardService {

	public int register(BoardDTO board); //write , throws 가 없다 -> 없더라도 스프링 예외처리 advice쪽으로 가게된다
	
	//게시판 글보기 - 게시판 데이터 + 첨부데이터 목록
	public BoardDTO get(int bno); // detail 
	public List<BoardAttachDTO> getAttachList(int bno); // detail 
	
	public boolean modify(BoardDTO board); // update
	
	public boolean remove(int bno); //delete
	
	//public List<BoardDTO> getList(); // list
	
	public List<BoardDTO> getList(Criteria criteria); //페이징처리된 List
	
	public int getTotal(Criteria criteria);
}
