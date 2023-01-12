package com.haru.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.haru.domain.BoardAttachDTO;
import com.haru.domain.BoardDTO;
import com.haru.domain.Criteria;
import com.haru.mapper.BoardAttachMapper;
import com.haru.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor //생성자를 이용한 자동 DI 스프링 4.3부터 단일 파라미터를 받는 경우 생성자를 통해 자동 DI
public class BoardServiceImpl implements BoardService {

	// @Autowired,@Inject,@Setter가 없다 - 프로퍼티(setter)에 데이터 전달 방식
	private BoardMapper mapper;
	private BoardAttachMapper attachMapper;
	
	@Override
	public int register(BoardDTO board) {
		log.info("게시판 등록 - board : " + board);
		//게시판 테이블 등록
		int result = mapper.insertSelectKey(board);
		
		//첨부파일 테이블 등록 - 파일이 있는경우만 처리
		if(board.getAttachList() != null && board.getAttachList().size() > 0) {
			//첨부파일 있는 만큼 for문을 돌린다
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
		
		return result; 
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

//	@Override
//	public List<BoardDTO> getList() {
//		log.info("게시판 리스트-------------------");
//		return mapper.getList();
//	}
	@Override
	public List<BoardDTO> getList(Criteria criteria) {
		log.info("게시판 리스트 페이징 처리------------------- criteria : " + criteria);
		return mapper.getListWithPaging(criteria);
	}

	@Override
	public int getTotal(Criteria criteria) {
		log.info("게시판 총 토탈 개수 -----------");
		return mapper.getTotalCount(criteria);
	}

	@Override
	public List<BoardAttachDTO> getAttachList(int bno) {
		log.info("게시판 첨부파일 목록 --------------- : " + bno );
		return attachMapper.findByBno(bno);
	}

}
