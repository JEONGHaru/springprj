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
	private String keyword; //검색할 단어 저장
	
	
	//변수 값을 세팅 하는 방법 - 초기화 블록 사용
	
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	//검색에 필요한 type을 쪼개서 글자별로 가져가는 getter 작성(프로퍼티)
	//-- #{typeArr}
	public String[] getTypeArr() {
		// type이 null이면 비어있는 배열 전달, null이 아니면 한글자씩 꺼내서 배열로 만듬
		return type == null ? new String[]{} : type.split("");
	}
}
