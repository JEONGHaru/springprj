package com.haru.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor // 데이터 세팅은 생성자를 이용한다
@Getter
public class ReplyPageDTO {

	private int replyCnt;
	private List<ReplyDTO> list;
	
}
