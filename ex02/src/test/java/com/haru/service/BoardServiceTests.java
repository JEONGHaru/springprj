package com.haru.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.haru.domain.BoardDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	//DI 적용 유무 확인
	@Test
	public void testExist() {
		log.info("service---------------------");
		log.info(service);
	}
	
	//게시판 등록 테스트
	@Test
	public void testRegister() {
		BoardDTO board = new BoardDTO();
		board.setTitle("새로 작성하는 제목");
		board.setContent("새로 작성하는 내용");
		board.setWriter("홍길동");
		
		log.info("service.register(board) : "+service.register(board));
	}
	
	//게시판 리스트 테스트
	@Test
	public void testGetList() {
		log.info("service.getList() ---- 게시판 리스트 : "+service.getList());
		service.getList().forEach(board -> log.info(board));
	}
	
	//게시판 보기
	@Test
	public void testGet() {
		log.info("----------------글보기 테스트-----------------");
		int bno = 5;
		log.info("service.get() --- 게시판 글보기 : "+service.get(bno));
	}
	
	//글삭제
	@Test
	public void testRemove() {
		log.info("----------------글삭제 테스트-----------------");
		int bno = 2;
		log.info("service.remove() --- 게시판 글보기 : "+service.remove(bno));
	}
	@Test
	public void testModify() {
		log.info("----------------글수정 테스트-----------------");
		BoardDTO board = service.get(1);
		
		if(board == null) return;
		
		//수정할 데이터 세팅
		board.setTitle("제목을 수정");
		
		log.info("service.modify() --- 게시판 글수정 : "+service.modify(board));
	}
	
	
	
	
}
