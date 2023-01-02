package com.haru.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {

	//날짜를 입력 받는 필드에서만 선언
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dueDate;
}
