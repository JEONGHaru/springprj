package com.haru.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {

	private int startPage; //화면 페이지 첫 부분
	private int endPage; //화면 페이지 마지막 부분
	private boolean prev,next; //이전,다음페이지가 있으면 true,없으면 fales

	private int total; //전체데이터 개수
	private Criteria criteria; // 현재 페이지와 화면에 보여줄 페이지 개수
	
	//생성자를 통해 값을 전달받아서 세팅
	public PageDTO(Criteria criteria, int total) {
		this.criteria = criteria;
		this.total = total;
		
		//화면에 보여줄 페이지 계산
		this.endPage = (int)(Math.ceil(criteria.getPageNum()/5.0)*5);
		this.startPage = this.endPage -4;
		
		//전체 데이터의 마지막 페이지
		int realEnd = getTotalPage();
		
		if(realEnd < endPage) this.endPage = realEnd;
		
		this.prev = this.startPage > 1;
		this.next = this.endPage <realEnd;
	}
	
	public int getTotalPage() {
		
		return (int)(Math.ceil((total*1.0)/criteria.getAmount()));
	}
}
