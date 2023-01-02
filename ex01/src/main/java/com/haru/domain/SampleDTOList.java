package com.haru.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class SampleDTOList {

	private List<SampleDTO> list;
	
	public SampleDTOList() {
		this.list = new ArrayList<SampleDTO>();
	}
}
