package com.haru.mapper;

import org.apache.ibatis.annotations.Insert;

public interface Sample2Mapper {

	@Insert("INSERT INTO tbl_sample2(col1) VALUES(#{data})")
	public int insertCol2(String data);
}
