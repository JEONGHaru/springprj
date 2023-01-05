package com.haru.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {

	private int rno;
	private int bno;
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
}
