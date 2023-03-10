package com.haru.domain;

import lombok.Data;

@Data
public class BoardAttachDTO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType; // image : true
	
	private int bno;
}
