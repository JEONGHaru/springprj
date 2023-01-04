package com.haru.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	//페이지 처리를 위한 변수
	private int pageNum; //현재 페이지
	private int amount; //한 페이지에 표시되는 데이터의 갯수
	
	//검색을 위한 변수
	private String type; //검색할 항목 저장
	private String keyWord; //검색할 단어 저장
	
	
	//변수 값을 세팅 하는 방법 - 초기화 블록 사용
	
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
	}
	
}
