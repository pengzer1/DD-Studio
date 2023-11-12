package com.ddstudio.communicate.model;

import lombok.Data;

@Data
public class InquiryDTO {
	
	private String name;
	
	private String inquiry_seq;
	private String type;
	private String subject;
	private String content;
	private String attach;
	private String answer;
	private String user_seq;
	
}
