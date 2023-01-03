package com.haru.mapper;

import java.util.List;

import com.haru.domain.BoardDTO;

public interface BoardMapper {

	// WHERE bno >0 -> 인덱스를 구성하고 있는 것으로 검색하면 처리 속도가 빨라짐
	//@Select("SELECT * FROM tbl_board WHERE bno > 0")
	public List<BoardDTO> getList();
	
	public int insert(BoardDTO board);
	
	public int insertSelectKey(BoardDTO board);
	
	public BoardDTO read(int bno);
	
	public int delete(int bno);

	public int update(BoardDTO board);
}
