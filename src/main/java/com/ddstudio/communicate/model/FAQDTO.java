package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * 작성자: 차수민
 */
@Data
public class FAQDTO {
	
	private String faq_seq;
	private String type;
	private String question;
	private String answer;
}
