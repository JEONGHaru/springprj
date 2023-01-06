package com.haru.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haru.domain.Criteria;
import com.haru.domain.ReplyDTO;
import com.haru.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	//댓글 리스트
	@Override
	public List<ReplyDTO> getList(Criteria cri, int bno) {
		log.info("get reply list ------------- cri : " + cri +", bno: " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}
	
	//댓글 등록
	@Override
	public int register(ReplyDTO dto) {
		log.info("reply register -------------------- dto : " + dto );
		return mapper.insert(dto);
	}

	//댓글 수정
	@Override
	public int modify(ReplyDTO dto) {
		log.info("reply modify ---------------------- dto : " + dto);
		
		return mapper.update(dto);
	}

	//댓글 삭제
	@Override
	public int remove(int rno) {
		log.info("reply remove ---------------------- rno : " + rno);
		
		return mapper.delete(rno);
	}

}
