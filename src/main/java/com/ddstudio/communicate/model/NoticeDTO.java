package com.ddstudio.communicate.model;

import lombok.Data;

@Data
public class NoticeDTO {
	
	private String notice_seq;
	private String subject;
	private String content;
	private String regdate;
	private String attach;
	private String fix;

}
