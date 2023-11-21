package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * 자주 묻는 질문(FAQ)에 대한 데이터를 담는 DTO 클래스입니다.
 */
@Data
public class FAQDTO {
	
	private String faq_seq;
	private String type;
	private String question;
	private String answer;
}
