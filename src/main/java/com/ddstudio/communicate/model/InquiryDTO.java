package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * 문의사항에 대한 데이터를 담는 DTO 클래스입니다.
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
