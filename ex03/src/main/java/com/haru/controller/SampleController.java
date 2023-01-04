package com.haru.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.haru.domain.SampleDTO;
import com.haru.domain.Ticket;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample")
@Log4j
public class SampleController {

	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
	public String getText() {
		log.info("MiME TYPE : " + MediaType.TEXT_PLAIN_VALUE);
		return "안녕하세요";
	}

	@GetMapping(value = "/getSample", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public SampleDTO getSample() {
		log.info("sample 객체를 데이터로 전달하기 ");
		return new SampleDTO(112, "스타", "로드");
	}

	@GetMapping(value = "/getList")
	public List<SampleDTO> getList() {
		log.info("LIST 객체를 데이터로 전달하기 ");

		return IntStream.rangeClosed(1, 10).mapToObj(i -> new SampleDTO(i, i + " first", i + " last"))
				.collect(Collectors.toList());
	}

	@GetMapping(value = "/getMap")
	public Map<String, SampleDTO> getMap() {
		log.info("MAP 객체를 데이터로 전달하기 ");
		Map<String, SampleDTO> map = new HashMap<String, SampleDTO>();
		map.put("First", new SampleDTO(111, "그루트", "주니어"));
		return map;
	}
	@GetMapping(value = "/getMapData")
	public Map<String, Object> getMapData() {
		log.info("MAP 데이터로 전달하기 ");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno",1111);
		map.put("FirsNamet","KWANGYOUNG");
		map.put("LastName","JEONG");
		return map;
	}
	
	@GetMapping(value = "/check",params = {"height","weight"})
	public ResponseEntity<SampleDTO> check(Double height, Double weight) {
		log.info("ResponseEntity 데이터로 전달하기 ");
		
		SampleDTO dto = new SampleDTO(0, ""+height, ""+weight);
		
		ResponseEntity<SampleDTO> result = null;
		
		if(height < 150) {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(dto);
		}else {
			result = ResponseEntity.status(HttpStatus.OK).body(dto);
		}
		
		return result;
	}
	
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat, @PathVariable("pid") Integer pid) {
		
		log.info("cat : " +cat +", pid : " +pid);
		
		return new String[] {"category : " + cat, "product : " + pid};
	}
	
	//JSON DATA를 받을수 있는 METHOD
	@PostMapping("/ticket")
	public Ticket convert(@RequestBody Ticket ticket) {
		
		log.info("convert---------------ticket : " + ticket);
		
		return ticket;
	}
	
	
}