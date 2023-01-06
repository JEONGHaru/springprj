package com.haru.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haru.domain.Criteria;
import com.haru.domain.ReplyDTO;
import com.haru.domain.ReplyPageDTO;

public interface ReplyMapper {

	//댓글 목록
	public List<ReplyDTO> getListWithPaging(
			@Param("cri") Criteria criteria,
			@Param("bno") int bno
			);
	
	//해당하는 글에 대한 댓글 전체 개수 가져오기
	public int getCountByBno(int bno);
	
	//댓글 등록
	public int insert(ReplyDTO dto);
	
	//댓글 수정
	public int update(ReplyDTO dto);
	
	//댓글 삭제
	public int delete(int rno);
}
