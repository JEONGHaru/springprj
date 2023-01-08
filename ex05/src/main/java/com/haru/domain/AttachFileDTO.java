package com.haru.domain;

import lombok.Data;

/**
 * 첨부파일 한개를 저장하기 위한 객체
 * @author jeong-gwang-yeong
 *
 */
@Data
public class AttachFileDTO {

	private String fileName; //순수 파일명
	private String uploadPath; //저장  위치
	private String uuid; //uuid문자열 순수 파일명에서 uuid- 를 제거하면 original파일명이 나옴
	private boolean image;
}
