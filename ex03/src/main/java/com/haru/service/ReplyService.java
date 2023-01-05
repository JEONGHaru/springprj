package com.haru.service;

import java.util.List;

import com.haru.domain.Criteria;
import com.haru.domain.ReplyDTO;

public interface ReplyService {

	//댓글 리스트
	public List<ReplyDTO> getList(Criteria cri, int bno);
	
	//댓글 등록
	public int register(ReplyDTO dto);
}
