package com.haru.mapper;

import java.util.List;

import com.haru.domain.BoardAttachDTO;

public interface BoardAttachMapper {
	
	//게시글 보기할떄 파일목록도 같이 보이도록한다
	public List<BoardAttachDTO> findByBno(int bno);
	
	//게시판 글등록후에 첨부파일의 정보를 저장
	public int insert(BoardAttachDTO dto);
	
	//게시글이 삭제될때 같이 삭제 되도록 이미지를 수정하면 원래것은 지워지도록
	public int delete(String uuid);

	//스케줄러에 의해서 DB에 없는 파일 삭제
	public List<BoardAttachDTO> getOldFiles();
}
