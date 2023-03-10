package com.haru.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.haru.domain.Criteria;
import com.haru.domain.ReplyDTO;
import com.haru.domain.ReplyPageDTO;
import com.haru.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController //method의 리턴이 데이터 그대로 클라이언트에게 전달됨
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	//댓글 리스트
	@GetMapping(
			  value = "/pages/{bno}/{page}",
			  produces = {
					  MediaType.APPLICATION_XML_VALUE,
					  MediaType.APPLICATION_JSON_VALUE}
			)
	//public ResponseEntity<List<ReplyDTO>> getList(
	  public ResponseEntity<ReplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("bno") int bno
			){
		log.info("Reply  : getList() -----------------");
		Criteria cri = new Criteria(page,10);
		log.info(cri);
		
		ReplyPageDTO dto = service.getList(cri, bno);
		for(ReplyDTO d : dto.getList()) {
			d.setReply(d.getReply().replaceAll("\n","<br>"));
		}
		return new ResponseEntity<>(dto,HttpStatus.OK);
	}
	
	//댓글 등록
	@PostMapping(value = "new", consumes ="application/json" , produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyDTO dto){
		log.info("reply create ---------------- dto : "+dto);
		int insertCount = service.register(dto);
		log.info("reply insertCount ------------------- : " + insertCount);
		
		return insertCount == 1 //정상 등록 여부
				? new ResponseEntity<String>("register success!",HttpStatus.OK) //true
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); //false
	}
	
	@RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH},
					value= "/{rno}", //url - /replies/1
					consumes = "application/json", //넘어오는 데이터가 JSON
					produces = {MediaType.TEXT_PLAIN_VALUE}) //넘겨주는 데이터 -> 순수 text 문자열 데이터
	public ResponseEntity<String> modify(@RequestBody ReplyDTO dto,@PathVariable("rno") int rno){
		log.info("reply modify -------------------- dto" + dto);
		
		//Path에서 받아온 rno를 DTO 객체에 넣는다
		dto.setBno(rno);
		return service.modify(dto) == 1
				?new ResponseEntity<String>("update success",HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.NOT_MODIFIED);
	}
	
	@DeleteMapping(value = "/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE}) //넘겨주는 데이터 -> 순수 text 문자열 데이터)
	public ResponseEntity<String> remove(@PathVariable("rno") int rno){
		log.info("reply remove -------------------- rno" + rno);
		
		return service.remove(rno) == 1
				?new ResponseEntity<String>("delete success",HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
