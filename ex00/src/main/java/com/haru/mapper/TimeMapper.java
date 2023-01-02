package com.haru.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	
	//sql 문장(데이터)을 저장할떄 - annotation을 사용하거나 Mapper.xml을 사용
	// annotation에 sql 을 저장해서 사용하기
	@Select("SELECT NOW()")
	public String getTime();
	
	//Mapper.xml에 sql 저장해서 사용하기
	public String getTime2();
}
