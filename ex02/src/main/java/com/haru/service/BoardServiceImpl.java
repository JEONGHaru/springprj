package com.haru.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.haru.domain.BoardDTO;
import com.haru.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	// @Autowired,@Inject,@Setter가 없다 - 프로퍼티(setter)에 데이터 전달 방식
	private BoardMapper mapper;
	
	@Override
	public int register(BoardDTO board) {
		log.info("게시판 등록 - board : " + board);
		
		return mapper.insertSelectKey(board);
	}

	@Override
	public BoardDTO get(int bno) {
		log.info("게시판 글보기 --------------------------------- bno : " + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardDTO board) {
		log.info("게시판 글 수정 -------------------------------board : " + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(int bno) {
		log.info("게시판 글삭제 --------------------------------bno : " + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardDTO> getList() {
		log.info("게시판 리스트-------------------");
		return mapper.getList();
	}

}
