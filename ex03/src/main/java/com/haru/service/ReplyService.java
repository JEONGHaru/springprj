package com.haru.service;

import java.util.List;

import com.haru.domain.Criteria;
import com.haru.domain.ReplyDTO;
import com.haru.domain.ReplyPageDTO;

public interface ReplyService {

	//댓글 리스트
	//public List<ReplyDTO> getList(Criteria cri, int bno);
	public ReplyPageDTO getList(Criteria cri, int bno);
	
	//댓글 등록
	public int register(ReplyDTO dto);
	
	//댓글 수정
	public int modify(ReplyDTO dto);
	
	//댓글 삭제
	public int remove(int rno);
}
