package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * 작성자: 차수민
 */
@Data
public class InquiryDTO {
	
	private String name;
	private String email;
	
	private String inquiry_seq;
	private String type;
	private String subject;
	private String content;
	private String attach;
	private String regdate;
	private String answer;
	private String user_seq;

}
