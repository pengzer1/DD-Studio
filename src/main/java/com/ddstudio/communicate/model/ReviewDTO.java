package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * 작성자: 차수민
 */
@Data
public class ReviewDTO {
	
	private String visit_date;
	
	private String img;
	
	private String review_seq;
	private String subject;
	private String content;
	private String regdate;
	private String readcount;
	private String user_book_seq;

}
