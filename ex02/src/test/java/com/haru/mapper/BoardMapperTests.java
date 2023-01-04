package com.haru.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.haru.domain.BoardDTO;
import com.haru.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
//	@Test
//	public void testGetList() {
//		log.info("mapper.getList() ---------------------------");
//		mapper.getList().forEach(board -> log.info(board));
//	}
	//페이징 처리된 리스트
	@Test
	public void testGetListWithPaging() {
		log.info("mapper.getListWithPaging() ---------------------------");
		Criteria criteria = new Criteria();
		criteria.setPageNum(2);
		mapper.getListWithPaging(criteria).forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardDTO board = new BoardDTO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		int result = mapper.insert(board);
		log.info("result : " + result);
		log.info("board : " + board);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardDTO board = new BoardDTO();
		board.setTitle("새로 작성하는 글 - select key");
		board.setContent("새로 작성하는 내용 - select key");
		board.setWriter("newbie - select key");
		
		int result = mapper.insertSelectKey(board);
		log.info("result : " + result);
		log.info("board : " + board);
	}
	
	@Test
	public void testRead() {
		int bno = 5;
		BoardDTO board = mapper.read(bno);
		log.info("board : " + board);
	}
	
	@Test
	public void testDelete() {
		int bno = 3;
		log.info("delete count: " + mapper.delete(bno));
	}
	
	@Test
	public void testUpdate() {
		BoardDTO board = new BoardDTO();
		board.setBno(5);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");
		log.info("update count : " + mapper.update(board));
	}
}
